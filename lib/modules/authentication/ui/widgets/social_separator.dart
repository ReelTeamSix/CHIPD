import 'package:apparence_kit/core/theme/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class SocialSeparator extends StatelessWidget {
  const SocialSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    final dividerColor = context.colors.grey1.withValues(alpha: 0.3);
    return Row(
      children: [
        Expanded(
          child: Divider(color: dividerColor),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Or sign in with",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: context.colors.grey2,
                ),
          ),
        ),
        Expanded(
          child: Divider(color: dividerColor),
        ),
      ],
    );
  }
}
