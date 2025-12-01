-- ============================================================================
-- CHIP'D Migration - RUN THIS IN SUPABASE SQL EDITOR
-- From: v1.0.0 (basic schema)
-- To: v1.1.0 (peer attestation, games, subscriptions)
-- ============================================================================
-- 
-- INSTRUCTIONS:
-- 1. Open Supabase Dashboard > SQL Editor
-- 2. Paste this entire file
-- 3. Click "Run"
-- 4. Verify: SELECT * FROM public.schema_version;
--
-- ============================================================================


-- ============================================================================
-- STEP 1: Update USERS table
-- ============================================================================

-- Add tier and tracking columns
ALTER TABLE public.users ADD COLUMN IF NOT EXISTS tier TEXT DEFAULT 'free';
ALTER TABLE public.users ADD COLUMN IF NOT EXISTS verified_rounds_count INTEGER DEFAULT 0;
ALTER TABLE public.users ADD COLUMN IF NOT EXISTS the_900_number INTEGER;


-- ============================================================================
-- STEP 2: Update NFC_TAGS table (remove course-mounting, add nickname)
-- ============================================================================

ALTER TABLE public.nfc_tags DROP COLUMN IF EXISTS course_id;
ALTER TABLE public.nfc_tags DROP COLUMN IF EXISTS hole_number;
ALTER TABLE public.nfc_tags DROP COLUMN IF EXISTS tag_type;
ALTER TABLE public.nfc_tags ADD COLUMN IF NOT EXISTS nickname TEXT;

-- Clean up orphan tags and make owner required
DELETE FROM public.nfc_tags WHERE owner_id IS NULL;
ALTER TABLE public.nfc_tags ALTER COLUMN owner_id SET NOT NULL;

-- Update policies
DROP POLICY IF EXISTS "Authenticated users can view active tags" ON public.nfc_tags;
DROP POLICY IF EXISTS "Users can view own tags" ON public.nfc_tags;
DROP POLICY IF EXISTS "Users can view active tags for verification" ON public.nfc_tags;
DROP POLICY IF EXISTS "Users can register own tags" ON public.nfc_tags;
DROP POLICY IF EXISTS "Users can update own tags" ON public.nfc_tags;

CREATE POLICY "Users can view own tags" 
    ON public.nfc_tags FOR SELECT TO authenticated 
    USING (owner_id = auth.uid());

CREATE POLICY "Users can view active tags for verification" 
    ON public.nfc_tags FOR SELECT TO authenticated 
    USING (is_active = true);

CREATE POLICY "Users can register own tags"
    ON public.nfc_tags FOR INSERT TO authenticated
    WITH CHECK (owner_id = auth.uid());

CREATE POLICY "Users can update own tags"
    ON public.nfc_tags FOR UPDATE TO authenticated
    USING (owner_id = auth.uid());


-- ============================================================================
-- STEP 3: Update ROUNDS table
-- ============================================================================

ALTER TABLE public.rounds ADD COLUMN IF NOT EXISTS created_by UUID REFERENCES public.users(id);
ALTER TABLE public.rounds ADD COLUMN IF NOT EXISTS verification_level TEXT DEFAULT 'none';
ALTER TABLE public.rounds ADD COLUMN IF NOT EXISTS verified_player_count INTEGER DEFAULT 0;
ALTER TABLE public.rounds ADD COLUMN IF NOT EXISTS start_lat DOUBLE PRECISION;
ALTER TABLE public.rounds ADD COLUMN IF NOT EXISTS start_lng DOUBLE PRECISION;
ALTER TABLE public.rounds ADD COLUMN IF NOT EXISTS end_lat DOUBLE PRECISION;
ALTER TABLE public.rounds ADD COLUMN IF NOT EXISTS end_lng DOUBLE PRECISION;
ALTER TABLE public.rounds ADD COLUMN IF NOT EXISTS start_verified_at TIMESTAMPTZ;
ALTER TABLE public.rounds ADD COLUMN IF NOT EXISTS end_verified_at TIMESTAMPTZ;

-- Backfill created_by from user_id if exists
UPDATE public.rounds SET created_by = user_id WHERE created_by IS NULL AND user_id IS NOT NULL;


-- ============================================================================
-- STEP 4: Create ROUND_PLAYERS table
-- ============================================================================

CREATE TABLE IF NOT EXISTS public.round_players (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    round_id UUID NOT NULL REFERENCES public.rounds(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    tag_uid TEXT REFERENCES public.nfc_tags(uid),
    join_method TEXT NOT NULL DEFAULT 'nfc' CHECK (join_method IN ('nfc', 'invite_link', 'qr_code', 'nearby')),
    verification_status TEXT NOT NULL DEFAULT 'unverified' CHECK (verification_status IN ('verified', 'partial', 'unverified')),
    scores JSONB DEFAULT '[]'::jsonb,
    total_score INTEGER,
    has_attested BOOLEAN DEFAULT false,
    attested_at TIMESTAMPTZ,
    join_verified_by UUID REFERENCES public.users(id),
    join_verified_at TIMESTAMPTZ,
    close_verified_by UUID REFERENCES public.users(id),
    close_verified_at TIMESTAMPTZ,
    joined_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(round_id, user_id)
);

ALTER TABLE public.round_players ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Players can view their round participation"
    ON public.round_players FOR SELECT TO authenticated
    USING (user_id = auth.uid() OR EXISTS (
        SELECT 1 FROM public.round_players rp 
        WHERE rp.round_id = round_players.round_id AND rp.user_id = auth.uid()
    ));

CREATE POLICY "Round creator can add players"
    ON public.round_players FOR INSERT TO authenticated
    WITH CHECK (EXISTS (
        SELECT 1 FROM public.rounds r WHERE r.id = round_id AND r.created_by = auth.uid()
    ) OR user_id = auth.uid());

CREATE POLICY "Players can update own participation"
    ON public.round_players FOR UPDATE TO authenticated
    USING (user_id = auth.uid());


-- ============================================================================
-- STEP 5: Create ROUND_GAMES table (dynamic side games)
-- ============================================================================

CREATE TABLE IF NOT EXISTS public.round_games (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    round_id UUID NOT NULL REFERENCES public.rounds(id) ON DELETE CASCADE,
    game_type TEXT NOT NULL CHECK (game_type IN (
        'ctp', 'skins', 'nassau', 'stroke_play', 'match_play',
        'bingo_bango_bongo', 'wolf', 'greenies', 'sandies', 'custom'
    )),
    hole_number INTEGER,
    stakes_per_player INTEGER NOT NULL DEFAULT 10,
    pot_total INTEGER DEFAULT 0,
    proposed_by UUID NOT NULL REFERENCES public.users(id),
    status TEXT NOT NULL DEFAULT 'proposed' CHECK (status IN ('proposed', 'active', 'settled', 'cancelled')),
    custom_name TEXT,
    custom_rules TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    settled_at TIMESTAMPTZ
);

ALTER TABLE public.round_games ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Round participants can view games"
    ON public.round_games FOR SELECT TO authenticated
    USING (EXISTS (
        SELECT 1 FROM public.round_players rp 
        WHERE rp.round_id = round_games.round_id AND rp.user_id = auth.uid()
    ));

CREATE POLICY "Round participants can create games"
    ON public.round_games FOR INSERT TO authenticated
    WITH CHECK (EXISTS (
        SELECT 1 FROM public.round_players rp 
        WHERE rp.round_id = round_id AND rp.user_id = auth.uid()
    ));

CREATE POLICY "Participants can update games"
    ON public.round_games FOR UPDATE TO authenticated
    USING (EXISTS (
        SELECT 1 FROM public.round_players rp 
        WHERE rp.round_id = round_games.round_id AND rp.user_id = auth.uid()
    ));


-- ============================================================================
-- STEP 6: Create ROUND_GAME_PLAYERS table
-- ============================================================================

CREATE TABLE IF NOT EXISTS public.round_game_players (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    game_id UUID NOT NULL REFERENCES public.round_games(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    handicap_at_time DECIMAL(4,1),
    strokes_given INTEGER DEFAULT 0,
    opted_in BOOLEAN DEFAULT false,
    responded_at TIMESTAMPTZ,
    net_chips INTEGER DEFAULT 0,
    UNIQUE(game_id, user_id)
);

ALTER TABLE public.round_game_players ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Game participants can view"
    ON public.round_game_players FOR SELECT TO authenticated
    USING (EXISTS (
        SELECT 1 FROM public.round_games rg
        JOIN public.round_players rp ON rp.round_id = rg.round_id
        WHERE rg.id = round_game_players.game_id AND rp.user_id = auth.uid()
    ));

CREATE POLICY "Users can join games"
    ON public.round_game_players FOR INSERT TO authenticated
    WITH CHECK (user_id = auth.uid());

CREATE POLICY "Users can update own participation"
    ON public.round_game_players FOR UPDATE TO authenticated
    USING (user_id = auth.uid());


-- ============================================================================
-- STEP 7: Create ROUND_GAME_RESULTS table
-- ============================================================================

CREATE TABLE IF NOT EXISTS public.round_game_results (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    game_id UUID NOT NULL REFERENCES public.round_games(id) ON DELETE CASCADE,
    hole_number INTEGER,
    result_type TEXT NOT NULL CHECK (result_type IN ('hole_winner', 'front_9', 'back_9', 'total', 'carryover')),
    winner_id UUID REFERENCES public.users(id),
    chips_won INTEGER NOT NULL DEFAULT 0,
    confirmed_by JSONB DEFAULT '[]'::jsonb,
    is_confirmed BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    confirmed_at TIMESTAMPTZ
);

ALTER TABLE public.round_game_results ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Game participants can view results"
    ON public.round_game_results FOR SELECT TO authenticated
    USING (EXISTS (
        SELECT 1 FROM public.round_games rg
        JOIN public.round_players rp ON rp.round_id = rg.round_id
        WHERE rg.id = round_game_results.game_id AND rp.user_id = auth.uid()
    ));

CREATE POLICY "Game participants can record results"
    ON public.round_game_results FOR INSERT TO authenticated
    WITH CHECK (EXISTS (
        SELECT 1 FROM public.round_games rg
        JOIN public.round_players rp ON rp.round_id = rg.round_id
        WHERE rg.id = game_id AND rp.user_id = auth.uid()
    ));

CREATE POLICY "Participants can confirm results"
    ON public.round_game_results FOR UPDATE TO authenticated
    USING (EXISTS (
        SELECT 1 FROM public.round_games rg
        JOIN public.round_players rp ON rp.round_id = rg.round_id
        WHERE rg.id = round_game_results.game_id AND rp.user_id = auth.uid()
    ));


-- ============================================================================
-- STEP 8: Create CHIP_TRANSACTIONS table
-- ============================================================================

CREATE TABLE IF NOT EXISTS public.chip_transactions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    amount INTEGER NOT NULL,
    balance_after INTEGER NOT NULL,
    transaction_type TEXT NOT NULL CHECK (transaction_type IN (
        'game_win', 'game_loss', 'round_bonus', 'streak_bonus',
        'purchase', 'transfer_in', 'transfer_out', 'admin_adjustment'
    )),
    round_id UUID REFERENCES public.rounds(id),
    game_id UUID REFERENCES public.round_games(id),
    game_result_id UUID REFERENCES public.round_game_results(id),
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

ALTER TABLE public.chip_transactions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own transactions"
    ON public.chip_transactions FOR SELECT TO authenticated
    USING (user_id = auth.uid());


-- ============================================================================
-- STEP 9: Create HANDICAP_HISTORY table
-- ============================================================================

CREATE TABLE IF NOT EXISTS public.handicap_history (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    handicap DECIMAL(4,1) NOT NULL,
    round_id UUID REFERENCES public.rounds(id),
    differentials_used JSONB,
    effective_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

ALTER TABLE public.handicap_history ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view handicap history"
    ON public.handicap_history FOR SELECT TO authenticated
    USING (true);


-- ============================================================================
-- STEP 10: Create SUBSCRIPTIONS table
-- ============================================================================

CREATE TABLE IF NOT EXISTS public.subscriptions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    tier TEXT NOT NULL DEFAULT 'free' CHECK (tier IN ('free', 'verified', 'the_900')),
    revenuecat_id TEXT,
    product_id TEXT,
    status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active', 'cancelled', 'expired', 'paused', 'lifetime')),
    the_900_number INTEGER,
    started_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    expires_at TIMESTAMPTZ,
    cancelled_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE(user_id)
);

ALTER TABLE public.subscriptions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own subscription"
    ON public.subscriptions FOR SELECT TO authenticated
    USING (user_id = auth.uid());


-- ============================================================================
-- STEP 11: Create tier sync trigger
-- ============================================================================

CREATE OR REPLACE FUNCTION sync_user_tier()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE public.users 
    SET 
        tier = NEW.tier,
        the_900_number = NEW.the_900_number,
        updated_at = NOW()
    WHERE id = NEW.user_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS sync_user_tier_on_subscription ON public.subscriptions;
CREATE TRIGGER sync_user_tier_on_subscription
    AFTER INSERT OR UPDATE ON public.subscriptions
    FOR EACH ROW EXECUTE FUNCTION sync_user_tier();


-- ============================================================================
-- STEP 12: Create all indexes
-- ============================================================================

CREATE INDEX IF NOT EXISTS idx_round_players_round ON public.round_players(round_id);
CREATE INDEX IF NOT EXISTS idx_round_players_user ON public.round_players(user_id);
CREATE INDEX IF NOT EXISTS idx_round_games_round ON public.round_games(round_id);
CREATE INDEX IF NOT EXISTS idx_round_games_status ON public.round_games(status);
CREATE INDEX IF NOT EXISTS idx_round_game_players_game ON public.round_game_players(game_id);
CREATE INDEX IF NOT EXISTS idx_round_game_players_user ON public.round_game_players(user_id);
CREATE INDEX IF NOT EXISTS idx_round_game_results_game ON public.round_game_results(game_id);
CREATE INDEX IF NOT EXISTS idx_chip_transactions_user ON public.chip_transactions(user_id);
CREATE INDEX IF NOT EXISTS idx_chip_transactions_date ON public.chip_transactions(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_handicap_history_user ON public.handicap_history(user_id, effective_at DESC);
CREATE INDEX IF NOT EXISTS idx_subscriptions_user ON public.subscriptions(user_id);
CREATE INDEX IF NOT EXISTS idx_subscriptions_tier ON public.subscriptions(tier);


-- ============================================================================
-- STEP 13: Update schema version
-- ============================================================================

CREATE TABLE IF NOT EXISTS public.schema_version (
    version TEXT PRIMARY KEY,
    description TEXT,
    applied_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

INSERT INTO public.schema_version (version, description)
VALUES ('1.1.0', 'Peer Attestation: round_players, dynamic games, subscriptions, tier system')
ON CONFLICT (version) DO UPDATE SET applied_at = NOW();


-- ============================================================================
-- DONE! Verify with:
-- ============================================================================
-- SELECT * FROM public.schema_version ORDER BY applied_at DESC;
-- SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' ORDER BY table_name;
-- ============================================================================

