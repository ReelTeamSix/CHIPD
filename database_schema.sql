-- ============================================================================
-- CHIP'D Database Schema - MVP
-- Version: 1.1.0
-- Last Updated: November 2024
-- ============================================================================
--
-- VERIFICATION MODEL: Peer Attestation
-- 1. GPS proves all players are at the course
-- 2. NFC scan proves players are physically together (each scans others' tags)
-- 3. Mutual attestation: each player confirms everyone else's scores
--
-- SUPPORTS: Twosomes, Threesomes, Foursomes (2-4 players)
--
-- MIGRATION: Run migrations/001_peer_attestation.sql if upgrading from v1.0.0
--
-- ============================================================================


-- ============================================================================
-- 1. EXTENSIONS
-- ============================================================================

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";


-- ============================================================================
-- 2. CORE TABLES (MVP - DEPLOYED)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- USERS TABLE
-- Extended user data linked to auth.users
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.users (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    email TEXT,
    display_name TEXT,
    avatar_url TEXT,
    
    -- Subscription tier (denormalized for quick access)
    -- Synced from subscriptions table via trigger
    tier TEXT NOT NULL DEFAULT 'free' CHECK (
        tier IN ('free', 'verified', 'the_900')
    ),
    
    -- Golf stats (only tracked for verified+ tiers)
    handicap DECIMAL(4,1) DEFAULT 0,
    verified_rounds_count INTEGER DEFAULT 0,
    
    -- Chip economy
    chip_balance INTEGER DEFAULT 0,
    
    -- The 900 specific
    the_900_number INTEGER,  -- NULL unless founder tier
    
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own profile" 
    ON public.users FOR SELECT 
    USING (auth.uid() = id);

CREATE POLICY "Users can update own profile" 
    ON public.users FOR UPDATE 
    USING (auth.uid() = id);

CREATE POLICY "Users can insert own profile" 
    ON public.users FOR INSERT 
    WITH CHECK (auth.uid() = id);

COMMENT ON TABLE public.users IS 'Extended user profiles linked to auth.users. Auto-created on signup via trigger.';


-- ----------------------------------------------------------------------------
-- COURSES TABLE
-- Golf courses with hole GPS coordinates
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.courses (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    city TEXT,
    state TEXT,
    country TEXT DEFAULT 'USA',
    
    -- Holes stored as JSONB array
    -- Structure: { hole_number, par, tee_lat, tee_lng, green_lat, green_lng, yardage? }
    holes JSONB NOT NULL DEFAULT '[]',
    
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE public.courses ENABLE ROW LEVEL SECURITY;

-- Public read access (even anonymous for course discovery)
CREATE POLICY "Anyone can view courses" 
    ON public.courses FOR SELECT 
    TO authenticated, anon 
    USING (true);

COMMENT ON TABLE public.courses IS 'Golf courses with hole-by-hole GPS coordinates in holes JSONB array.';


-- ----------------------------------------------------------------------------
-- NFC_TAGS TABLE
-- Player-owned NFC tags for peer attestation
-- Each player registers their personal tag (keychain, card, sticker)
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.nfc_tags (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- The physical NFC chip's unique identifier (NTAG 424 DNA = 14 hex chars)
    uid TEXT UNIQUE NOT NULL,
    
    -- Owner of this tag (required - all tags are player-owned)
    owner_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    
    -- Optional friendly name
    nickname TEXT,  -- e.g., "My Keychain Tag", "Bag Tag"
    
    -- Status
    is_active BOOLEAN DEFAULT true,
    
    -- Timestamps
    created_at TIMESTAMPTZ DEFAULT NOW(),
    last_scanned_at TIMESTAMPTZ
);

ALTER TABLE public.nfc_tags ENABLE ROW LEVEL SECURITY;

-- Users can see their own tags
CREATE POLICY "Users can view own tags" 
    ON public.nfc_tags FOR SELECT 
    TO authenticated 
    USING (owner_id = auth.uid());

-- Users can see any active tag (needed to verify partner)
CREATE POLICY "Users can view active tags for verification" 
    ON public.nfc_tags FOR SELECT 
    TO authenticated 
    USING (is_active = true);

CREATE POLICY "Users can register own tags"
    ON public.nfc_tags FOR INSERT
    TO authenticated
    WITH CHECK (owner_id = auth.uid());

CREATE POLICY "Users can update own tags"
    ON public.nfc_tags FOR UPDATE
    TO authenticated
    USING (owner_id = auth.uid());

COMMENT ON TABLE public.nfc_tags IS 'Player-owned NFC tags for peer attestation. Each player registers their personal tag.';


-- ----------------------------------------------------------------------------
-- ROUNDS TABLE
-- Golf rounds with peer attestation (GPS + NFC + Mutual Confirmation)
-- Supports 2-4 players (twosome, threesome, foursome)
-- Supports mixed verified/unverified players
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.rounds (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- Who created this round
    created_by UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    
    -- Course played (optional - GPS verifies location regardless)
    course_id UUID REFERENCES public.courses(id),
    
    -- Group size (2-4 players)
    player_count INTEGER DEFAULT 2 CHECK (player_count >= 1 AND player_count <= 4),
    
    -- Round status
    -- pending: Created, waiting for all players to join
    -- in_progress: All players confirmed, round active
    -- completed: Scores entered, awaiting attestation
    -- verified: All players attested
    -- disputed: One or more players contested
    status TEXT DEFAULT 'pending' CHECK (
        status IN ('pending', 'in_progress', 'completed', 'verified', 'disputed')
    ),
    
    -- Verification level (based on player verification statuses)
    -- full: All players are NFC-verified
    -- partial: Some players verified, some not
    -- none: No NFC verification (all joined via links)
    verification_level TEXT DEFAULT 'none' CHECK (
        verification_level IN ('full', 'partial', 'none')
    ),
    verified_player_count INTEGER DEFAULT 0,
    
    -- Timestamps
    start_time TIMESTAMPTZ,
    end_time TIMESTAMPTZ,
    
    -- GPS Verification (proves group at course)
    start_lat DOUBLE PRECISION,
    start_lng DOUBLE PRECISION,
    end_lat DOUBLE PRECISION,
    end_lng DOUBLE PRECISION,
    
    -- Verification timestamps
    start_verified_at TIMESTAMPTZ,
    end_verified_at TIMESTAMPTZ,
    
    -- Timestamps
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE public.rounds ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view rounds they participate in"
    ON public.rounds FOR SELECT
    TO authenticated
    USING (
        created_by = auth.uid()
        OR EXISTS (
            SELECT 1 FROM public.round_players rp 
            WHERE rp.round_id = id 
            AND rp.user_id = auth.uid()
        )
    );

CREATE POLICY "Users can create rounds"
    ON public.rounds FOR INSERT
    TO authenticated
    WITH CHECK (created_by = auth.uid());

CREATE POLICY "Participants can update rounds"
    ON public.rounds FOR UPDATE
    TO authenticated
    USING (
        created_by = auth.uid()
        OR EXISTS (
            SELECT 1 FROM public.round_players rp 
            WHERE rp.round_id = id 
            AND rp.user_id = auth.uid()
        )
    );

COMMENT ON TABLE public.rounds IS 'Golf rounds supporting 2-4 players. GPS verifies location, NFC proves proximity, attestation confirms scores.';


-- ----------------------------------------------------------------------------
-- ROUND_PLAYERS TABLE
-- Individual player participation in a round (supports foursomes)
-- Supports both verified (with chip) and unverified (no chip) players
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.round_players (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- Link to round
    round_id UUID NOT NULL REFERENCES public.rounds(id) ON DELETE CASCADE,
    
    -- The player
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    
    -- Which tag they used (NULL if joined without chip)
    tag_uid TEXT REFERENCES public.nfc_tags(uid),
    
    -- How did they join?
    join_method TEXT NOT NULL DEFAULT 'nfc' CHECK (
        join_method IN ('nfc', 'invite_link', 'qr_code', 'nearby')
    ),
    
    -- Verification status
    -- verified: Joined via NFC tap AND closed via NFC tap
    -- partial: Joined via NFC OR closed via NFC (not both)
    -- unverified: No NFC interaction (joined via link)
    verification_status TEXT NOT NULL DEFAULT 'unverified' CHECK (
        verification_status IN ('verified', 'partial', 'unverified')
    ),
    
    -- Player's scores for this round
    -- Structure: [4, 5, 3, 4, ...] (array of scores per hole)
    scores JSONB DEFAULT '[]'::jsonb,
    total_score INTEGER,
    
    -- Attestation: has this player confirmed ALL other players' scores?
    has_attested BOOLEAN DEFAULT false,
    attested_at TIMESTAMPTZ,
    
    -- NFC verification tracking
    join_verified_by UUID REFERENCES public.users(id),   -- Who tapped them in
    join_verified_at TIMESTAMPTZ,
    close_verified_by UUID REFERENCES public.users(id),  -- Who they tapped to close
    close_verified_at TIMESTAMPTZ,
    
    -- Timestamps
    joined_at TIMESTAMPTZ DEFAULT NOW(),
    
    -- Constraints
    UNIQUE(round_id, user_id)  -- Each player once per round
);

ALTER TABLE public.round_players ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Players can view their round participation"
    ON public.round_players FOR SELECT
    TO authenticated
    USING (
        user_id = auth.uid() 
        OR EXISTS (
            SELECT 1 FROM public.round_players rp 
            WHERE rp.round_id = round_players.round_id 
            AND rp.user_id = auth.uid()
        )
    );

CREATE POLICY "Round creator can add players"
    ON public.round_players FOR INSERT
    TO authenticated
    WITH CHECK (
        EXISTS (
            SELECT 1 FROM public.rounds r 
            WHERE r.id = round_id 
            AND r.created_by = auth.uid()
        )
        OR user_id = auth.uid()
    );

CREATE POLICY "Players can update own participation"
    ON public.round_players FOR UPDATE
    TO authenticated
    USING (user_id = auth.uid());

COMMENT ON TABLE public.round_players IS 'Players in a round (2-4). Each has own scores and attestation status. All must attest for verified round.';


-- ============================================================================
-- 3. INDEXES
-- ============================================================================

-- Rounds indexes
CREATE INDEX IF NOT EXISTS idx_rounds_created_by ON public.rounds(created_by);
CREATE INDEX IF NOT EXISTS idx_rounds_status ON public.rounds(status);
CREATE INDEX IF NOT EXISTS idx_rounds_active ON public.rounds(created_by, status) WHERE status IN ('pending', 'in_progress');
CREATE INDEX IF NOT EXISTS idx_rounds_course ON public.rounds(course_id) WHERE course_id IS NOT NULL;

-- Round players indexes
CREATE INDEX IF NOT EXISTS idx_round_players_round ON public.round_players(round_id);
CREATE INDEX IF NOT EXISTS idx_round_players_user ON public.round_players(user_id);
CREATE INDEX IF NOT EXISTS idx_round_players_unattested ON public.round_players(round_id) WHERE has_attested = false;

-- NFC tags indexes
CREATE INDEX IF NOT EXISTS idx_nfc_tags_uid ON public.nfc_tags(uid);
CREATE INDEX IF NOT EXISTS idx_nfc_tags_owner ON public.nfc_tags(owner_id);

-- Courses indexes
CREATE INDEX IF NOT EXISTS idx_courses_state ON public.courses(state);


-- ============================================================================
-- 4. TRIGGERS & FUNCTIONS
-- ============================================================================

-- Auto-create user profile on signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.users (id, email) 
    VALUES (NEW.id, NEW.email);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Drop existing trigger if it exists, then recreate
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;

CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();


-- Auto-update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Apply to tables with updated_at
DROP TRIGGER IF EXISTS update_users_updated_at ON public.users;
CREATE TRIGGER update_users_updated_at
    BEFORE UPDATE ON public.users
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

DROP TRIGGER IF EXISTS update_courses_updated_at ON public.courses;
CREATE TRIGGER update_courses_updated_at
    BEFORE UPDATE ON public.courses
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

DROP TRIGGER IF EXISTS update_rounds_updated_at ON public.rounds;
CREATE TRIGGER update_rounds_updated_at
    BEFORE UPDATE ON public.rounds
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();


-- ============================================================================
-- 5. SEED DATA (Lab Mode Testing)
-- ============================================================================

-- Test course for Lab Mode development (Michigan desk location)
INSERT INTO public.courses (name, city, state, holes) 
VALUES (
    'Lab Mode Test Course',
    'Grand Rapids',
    'MI',
    '[
        {"hole_number": 1, "par": 4, "tee_lat": 42.808504, "tee_lng": -85.987556, "green_lat": 42.809100, "green_lng": -85.986800},
        {"hole_number": 2, "par": 3, "tee_lat": 42.809200, "tee_lng": -85.986700, "green_lat": 42.809600, "green_lng": -85.986200},
        {"hole_number": 3, "par": 5, "tee_lat": 42.809700, "tee_lng": -85.986100, "green_lat": 42.810500, "green_lng": -85.985000},
        {"hole_number": 4, "par": 4, "tee_lat": 42.810600, "tee_lng": -85.984900, "green_lat": 42.811200, "green_lng": -85.984200},
        {"hole_number": 5, "par": 4, "tee_lat": 42.811300, "tee_lng": -85.984100, "green_lat": 42.811900, "green_lng": -85.983500},
        {"hole_number": 6, "par": 3, "tee_lat": 42.812000, "tee_lng": -85.983400, "green_lat": 42.812400, "green_lng": -85.982900},
        {"hole_number": 7, "par": 5, "tee_lat": 42.812500, "tee_lng": -85.982800, "green_lat": 42.813400, "green_lng": -85.981600},
        {"hole_number": 8, "par": 4, "tee_lat": 42.813500, "tee_lng": -85.981500, "green_lat": 42.814100, "green_lng": -85.980800},
        {"hole_number": 9, "par": 4, "tee_lat": 42.814200, "tee_lng": -85.980700, "green_lat": 42.814800, "green_lng": -85.980000}
    ]'::jsonb
)
ON CONFLICT DO NOTHING;


-- ============================================================================
-- 6. SIDE GAMES & BETTING (MVP Phase 3)
-- Dynamic games created during rounds
-- ============================================================================

-- ----------------------------------------------------------------------------
-- ROUND_GAMES TABLE
-- Games created dynamically during a round (CTP, Skins, Nassau, etc.)
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.round_games (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    round_id UUID NOT NULL REFERENCES public.rounds(id) ON DELETE CASCADE,
    
    -- Game type
    game_type TEXT NOT NULL CHECK (
        game_type IN (
            'ctp',              -- Closest to Pin (par 3s)
            'skins',            -- Win hole outright
            'nassau',           -- Front 9 / Back 9 / Total
            'stroke_play',      -- Net stroke play with handicaps
            'match_play',       -- Hole by hole with handicaps
            'bingo_bango_bongo', -- First on, closest, first in
            'wolf',             -- Pick partner each hole
            'greenies',         -- Hit green on par 3
            'sandies',          -- Up and down from sand
            'custom'            -- User-defined
        )
    ),
    
    -- Scope
    hole_number INTEGER,        -- Specific hole (NULL = full round)
    holes_range INT4RANGE,      -- For Nassau: [1,9], [10,18], [1,18]
    
    -- Stakes
    stakes_per_player INTEGER NOT NULL DEFAULT 10,
    pot_total INTEGER DEFAULT 0,
    
    -- Who proposed and status
    proposed_by UUID NOT NULL REFERENCES public.users(id),
    status TEXT NOT NULL DEFAULT 'proposed' CHECK (
        status IN ('proposed', 'active', 'settled', 'cancelled')
    ),
    
    -- Custom game details
    custom_name TEXT,
    custom_rules TEXT,
    
    -- Timestamps
    created_at TIMESTAMPTZ DEFAULT NOW(),
    settled_at TIMESTAMPTZ
);

ALTER TABLE public.round_games ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Round participants can view games"
    ON public.round_games FOR SELECT
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM public.round_players rp 
            WHERE rp.round_id = round_games.round_id 
            AND rp.user_id = auth.uid()
        )
    );

CREATE POLICY "Round participants can create games"
    ON public.round_games FOR INSERT
    TO authenticated
    WITH CHECK (
        EXISTS (
            SELECT 1 FROM public.round_players rp 
            WHERE rp.round_id = round_id 
            AND rp.user_id = auth.uid()
        )
    );

CREATE POLICY "Participants can update games"
    ON public.round_games FOR UPDATE
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM public.round_players rp 
            WHERE rp.round_id = round_games.round_id 
            AND rp.user_id = auth.uid()
        )
    );

COMMENT ON TABLE public.round_games IS 'Side games created dynamically during rounds. Stakes in chips.';


-- ----------------------------------------------------------------------------
-- ROUND_GAME_PLAYERS TABLE
-- Who is participating in each game
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.round_game_players (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    game_id UUID NOT NULL REFERENCES public.round_games(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    
    -- For handicap-based games
    handicap_at_time DECIMAL(4,1),
    strokes_given INTEGER DEFAULT 0,
    
    -- Participation status
    opted_in BOOLEAN DEFAULT false,
    responded_at TIMESTAMPTZ,
    
    -- Results
    net_chips INTEGER DEFAULT 0,  -- + or - from this game
    
    UNIQUE(game_id, user_id)
);

ALTER TABLE public.round_game_players ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Game participants can view"
    ON public.round_game_players FOR SELECT
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM public.round_games rg
            JOIN public.round_players rp ON rp.round_id = rg.round_id
            WHERE rg.id = round_game_players.game_id
            AND rp.user_id = auth.uid()
        )
    );

CREATE POLICY "Users can join games"
    ON public.round_game_players FOR INSERT
    TO authenticated
    WITH CHECK (user_id = auth.uid());

CREATE POLICY "Users can update own participation"
    ON public.round_game_players FOR UPDATE
    TO authenticated
    USING (user_id = auth.uid());

COMMENT ON TABLE public.round_game_players IS 'Player participation in side games. Tracks handicap strokes and chip results.';


-- ----------------------------------------------------------------------------
-- ROUND_GAME_RESULTS TABLE
-- Outcomes of games (per hole for skins/CTP, or final for match/stroke)
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.round_game_results (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    game_id UUID NOT NULL REFERENCES public.round_games(id) ON DELETE CASCADE,
    
    -- What this result is for
    hole_number INTEGER,        -- For per-hole games
    result_type TEXT NOT NULL CHECK (
        result_type IN ('hole_winner', 'front_9', 'back_9', 'total', 'carryover')
    ),
    
    -- Winner
    winner_id UUID REFERENCES public.users(id),
    chips_won INTEGER NOT NULL DEFAULT 0,
    
    -- Verification
    confirmed_by JSONB DEFAULT '[]'::jsonb,  -- Array of user_ids who confirmed
    is_confirmed BOOLEAN DEFAULT false,
    
    -- Timestamps
    created_at TIMESTAMPTZ DEFAULT NOW(),
    confirmed_at TIMESTAMPTZ
);

ALTER TABLE public.round_game_results ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Game participants can view results"
    ON public.round_game_results FOR SELECT
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM public.round_games rg
            JOIN public.round_players rp ON rp.round_id = rg.round_id
            WHERE rg.id = round_game_results.game_id
            AND rp.user_id = auth.uid()
        )
    );

CREATE POLICY "Game participants can record results"
    ON public.round_game_results FOR INSERT
    TO authenticated
    WITH CHECK (
        EXISTS (
            SELECT 1 FROM public.round_games rg
            JOIN public.round_players rp ON rp.round_id = rg.round_id
            WHERE rg.id = game_id
            AND rp.user_id = auth.uid()
        )
    );

CREATE POLICY "Participants can confirm results"
    ON public.round_game_results FOR UPDATE
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM public.round_games rg
            JOIN public.round_players rp ON rp.round_id = rg.round_id
            WHERE rg.id = round_game_results.game_id
            AND rp.user_id = auth.uid()
        )
    );

COMMENT ON TABLE public.round_game_results IS 'Game outcomes. confirmed_by tracks which players verified via NFC or in-app.';


-- ----------------------------------------------------------------------------
-- CHIP_TRANSACTIONS TABLE
-- Audit trail for all chip movements
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.chip_transactions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    
    -- Amount and balance
    amount INTEGER NOT NULL,        -- Positive = credit, Negative = debit
    balance_after INTEGER NOT NULL,
    
    -- What caused this transaction
    transaction_type TEXT NOT NULL CHECK (
        transaction_type IN (
            'game_win',         -- Won a side game
            'game_loss',        -- Lost a side game
            'round_bonus',      -- Bonus for verified round
            'streak_bonus',     -- Streak achievement
            'purchase',         -- Bought chips
            'transfer_in',      -- Received from another user
            'transfer_out',     -- Sent to another user
            'admin_adjustment'  -- Manual adjustment
        )
    ),
    
    -- References
    round_id UUID REFERENCES public.rounds(id),
    game_id UUID REFERENCES public.round_games(id),
    game_result_id UUID REFERENCES public.round_game_results(id),
    
    -- Details
    description TEXT,
    
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

ALTER TABLE public.chip_transactions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own transactions"
    ON public.chip_transactions FOR SELECT
    TO authenticated
    USING (user_id = auth.uid());

-- Transactions are created by server/edge functions only
-- No direct INSERT policy for users

COMMENT ON TABLE public.chip_transactions IS 'Immutable ledger of all chip balance changes.';

-- Indexes for transactions
CREATE INDEX IF NOT EXISTS idx_chip_transactions_user ON public.chip_transactions(user_id);
CREATE INDEX IF NOT EXISTS idx_chip_transactions_round ON public.chip_transactions(round_id) WHERE round_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_chip_transactions_date ON public.chip_transactions(created_at DESC);


-- ============================================================================
-- 7. HANDICAP TRACKING
-- Verified handicap calculation from attested rounds
-- ============================================================================

-- ----------------------------------------------------------------------------
-- HANDICAP_HISTORY TABLE
-- Track handicap changes over time
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.handicap_history (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    
    -- Handicap value
    handicap DECIMAL(4,1) NOT NULL,
    
    -- What triggered this update
    round_id UUID REFERENCES public.rounds(id),
    differentials_used JSONB,   -- Array of {round_id, differential} used in calc
    
    -- Timestamps
    effective_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

ALTER TABLE public.handicap_history ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own handicap history"
    ON public.handicap_history FOR SELECT
    TO authenticated
    USING (user_id = auth.uid());

CREATE POLICY "Anyone can view handicap history"
    ON public.handicap_history FOR SELECT
    TO authenticated
    USING (true);

COMMENT ON TABLE public.handicap_history IS 'Historical record of handicap changes. Calculated from verified rounds only.';

-- Index for handicap lookups
CREATE INDEX IF NOT EXISTS idx_handicap_history_user ON public.handicap_history(user_id, effective_at DESC);


-- ============================================================================
-- 8. SUBSCRIPTIONS & TIERS
-- The chip IS the subscription - physical product = premium access
-- ============================================================================

-- ----------------------------------------------------------------------------
-- SUBSCRIPTIONS TABLE
-- Tracks user tier and subscription status
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.subscriptions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    
    -- Tier
    -- free: No chip, unverified, limited features
    -- verified: Has chip, full features, monthly subscription
    -- the_900: Founder tier, gold chip, lifetime access (limited to 900)
    tier TEXT NOT NULL DEFAULT 'free' CHECK (
        tier IN ('free', 'verified', 'the_900')
    ),
    
    -- RevenueCat integration
    revenuecat_id TEXT,
    product_id TEXT,
    
    -- Status
    status TEXT NOT NULL DEFAULT 'active' CHECK (
        status IN ('active', 'cancelled', 'expired', 'paused', 'lifetime')
    ),
    
    -- The 900 specific
    the_900_number INTEGER,  -- 1-900, their founder number
    
    -- Timestamps
    started_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    expires_at TIMESTAMPTZ,  -- NULL for lifetime (The 900)
    cancelled_at TIMESTAMPTZ,
    
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    
    UNIQUE(user_id)  -- One subscription per user
);

ALTER TABLE public.subscriptions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own subscription"
    ON public.subscriptions FOR SELECT
    TO authenticated
    USING (user_id = auth.uid());

-- Subscriptions managed by server/webhooks only

COMMENT ON TABLE public.subscriptions IS 'User subscription tiers. free=no chip, verified=has chip, the_900=founder with gold chip.';

-- Index for tier lookups
CREATE INDEX IF NOT EXISTS idx_subscriptions_user ON public.subscriptions(user_id);
CREATE INDEX IF NOT EXISTS idx_subscriptions_tier ON public.subscriptions(tier);


-- ----------------------------------------------------------------------------
-- FEATURE ACCESS VIEW
-- Computed view of what features each tier can access
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW public.tier_features AS
SELECT 
    tier,
    CASE 
        WHEN tier = 'free' THEN false
        ELSE true 
    END AS can_have_chip,
    CASE 
        WHEN tier = 'free' THEN false
        ELSE true 
    END AS can_verify_rounds,
    CASE 
        WHEN tier = 'free' THEN 1
        WHEN tier = 'verified' THEN 4
        WHEN tier = 'the_900' THEN 4
    END AS max_players_per_round,
    CASE 
        WHEN tier = 'free' THEN false
        ELSE true 
    END AS can_create_side_games,
    CASE 
        WHEN tier = 'free' THEN false
        ELSE true 
    END AS can_bet_chips,
    CASE 
        WHEN tier = 'free' THEN false
        ELSE true 
    END AS handicap_tracked,
    CASE 
        WHEN tier = 'free' THEN 3
        WHEN tier = 'verified' THEN -1  -- unlimited
        WHEN tier = 'the_900' THEN -1
    END AS rounds_per_month,
    CASE 
        WHEN tier = 'the_900' THEN true
        ELSE false 
    END AS gold_badge,
    CASE 
        WHEN tier = 'the_900' THEN true
        ELSE false 
    END AS early_access
FROM (VALUES ('free'), ('verified'), ('the_900')) AS tiers(tier);

COMMENT ON VIEW public.tier_features IS 'Feature matrix by subscription tier.';


/*
-- ----------------------------------------------------------------------------
-- ROUND_PLAYERS TABLE (Multi-Player Rounds)
-- For tracking multiple players in a single round
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.round_players (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    round_id UUID NOT NULL REFERENCES public.rounds(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
    
    -- Player's scores for this round
    scores JSONB DEFAULT '[]',
    total_score INTEGER,
    
    -- Their verification status
    tap_signature TEXT,
    verified_at TIMESTAMPTZ,
    
    created_at TIMESTAMPTZ DEFAULT NOW(),
    
    UNIQUE(round_id, user_id)
);

ALTER TABLE public.round_players ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view rounds they are part of"
    ON public.round_players FOR SELECT
    TO authenticated
    USING (user_id = auth.uid() OR EXISTS (
        SELECT 1 FROM public.round_players rp 
        WHERE rp.round_id = round_players.round_id AND rp.user_id = auth.uid()
    ));

COMMENT ON TABLE public.round_players IS 'Tracks multiple players per round with individual scores and verification.';
*/


/*
-- ----------------------------------------------------------------------------
-- WAGERS TABLE (Betting System)
-- Chip wagers between players
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.wagers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    round_id UUID NOT NULL REFERENCES public.rounds(id) ON DELETE CASCADE,
    
    proposer_id UUID NOT NULL REFERENCES public.users(id),
    accepter_id UUID REFERENCES public.users(id),
    
    amount INTEGER NOT NULL CHECK (amount > 0),
    wager_type TEXT NOT NULL CHECK (
        wager_type IN ('match_play', 'stroke_play', 'skins', 'nassau')
    ),
    
    status TEXT NOT NULL DEFAULT 'proposed' CHECK (
        status IN ('proposed', 'accepted', 'declined', 'completed', 'cancelled')
    ),
    
    winner_id UUID REFERENCES public.users(id),
    
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    accepted_at TIMESTAMPTZ,
    completed_at TIMESTAMPTZ
);

ALTER TABLE public.wagers ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view wagers they are part of"
    ON public.wagers FOR SELECT
    TO authenticated
    USING (proposer_id = auth.uid() OR accepter_id = auth.uid());

COMMENT ON TABLE public.wagers IS 'Chip wagers between players on rounds.';
*/


-- ============================================================================
-- 7. SCHEMA VERSION TRACKING
-- ============================================================================

CREATE TABLE IF NOT EXISTS public.schema_version (
    version TEXT PRIMARY KEY,
    description TEXT,
    applied_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

INSERT INTO public.schema_version (version, description)
VALUES ('1.0.0', 'Initial MVP: users, courses, nfc_tags, rounds (single-player)')
ON CONFLICT (version) DO NOTHING;

INSERT INTO public.schema_version (version, description)
VALUES ('1.1.0', 'Peer Attestation: round_players, dynamic games, subscriptions, tier system')
ON CONFLICT (version) DO NOTHING;


-- ============================================================================
-- END OF SCHEMA
-- ============================================================================
