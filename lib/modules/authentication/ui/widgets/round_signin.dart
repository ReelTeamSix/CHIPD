import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef SocialSigninCallback = void Function();

class SocialSigninButton extends StatelessWidget {
  final Image iconImage;
  final SocialSigninCallback? onPressed;

  const SocialSigninButton({
    super.key,
    required this.iconImage,
    required this.onPressed,
  });

  factory SocialSigninButton.google(SocialSigninCallback onPressed) {
    return SocialSigninButton(
      iconImage: Image.asset("assets/icons/google.png", width: 24),
      onPressed: onPressed,
    );
  }

  factory SocialSigninButton.googlePlayGames(SocialSigninCallback onPressed) {
    return SocialSigninButton(
      iconImage: Image.asset("assets/icons/google_play_games.png", width: 24),
      onPressed: onPressed,
    );
  }

  factory SocialSigninButton.facebook(SocialSigninCallback onPressed) {
    return SocialSigninButton(
      iconImage: Image.asset("assets/icons/facebook.png", width: 24),
      onPressed: onPressed,
    );
  }

  factory SocialSigninButton.apple(SocialSigninCallback onPressed) {
    return SocialSigninButton(
      iconImage: Image.asset("assets/icons/apple.png", width: 24),
      onPressed: onPressed,
    );
  }

  factory SocialSigninButton.twitter(SocialSigninCallback onPressed) {
    return SocialSigninButton(
      iconImage: Image.asset("assets/icons/twitter.png", width: 24),
      onPressed: onPressed,
    );
  }

  factory SocialSigninButton.microsoft(SocialSigninCallback onPressed) {
    return SocialSigninButton(
      iconImage: Image.asset("assets/icons/microsoft.png", width: 24),
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = context.colors.grey1.withValues(alpha: 0.3);
    return Container(
      width: 56,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        shape: BoxShape.circle,
      ),
      child: RawMaterialButton(
        elevation: 0,
        onPressed: () {
          HapticFeedback.mediumImpact();
          onPressed?.call();
        },
        shape: const CircleBorder(),
        fillColor: Colors.transparent,
        padding: const EdgeInsets.all(16),
        child: iconImage,
      ),
    );
  }
}
