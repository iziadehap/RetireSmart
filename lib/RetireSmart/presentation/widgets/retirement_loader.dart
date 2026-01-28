import 'package:flutter/material.dart';
import 'package:retiresmart/l10n/app_localizations.dart';
import 'package:retiresmart/core/app_colors.dart';
import 'common_painters.dart';

class RetirementLoader extends StatelessWidget {
  const RetirementLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context)!;
    final colors = AppThemeColors.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        // Ambient Glow
        Positioned(
          top: -100,
          right: -100,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.accentCyan.withOpacity(0.05),
              boxShadow: [
                BoxShadow(
                  color: colors.accentCyan.withOpacity(0.05),
                  blurRadius: 100,
                  spreadRadius: 50,
                ),
              ],
            ),
          ),
        ),

        // Dotted Grid Overlay
        Positioned.fill(
          child: CustomPaint(
            painter: DotGridPainter(
              color: colors.text,
              spacing: 40,
              opacity: isDark ? 0.03 : 0.05,
            ),
          ),
        ),

        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Futuristic Loader
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(seconds: 2),
                builder: (context, value, child) {
                  return Transform.rotate(
                    angle: value * 6.28,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: colors.accentCyan.withOpacity(0.3),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: colors.accentCyan.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Inner pulsating circle
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colors.accentCyan.withOpacity(0.1),
                            ),
                          ),
                          // Spinning indicator
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 8,
                              height: 8,
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: colors.accentCyan,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                onEnd: () {},
              ),

              const SizedBox(height: 40),

              // Text
              Text(
                s.analyzingLabel.toUpperCase(),
                style: TextStyle(
                  color: colors.text,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Processing...",
                style: TextStyle(
                  color: colors.subtext,
                  fontSize: 12,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
