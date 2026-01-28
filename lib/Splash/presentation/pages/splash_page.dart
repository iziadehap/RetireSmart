import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/core/app_colors.dart';
import 'package:retiresmart/RetireSmart/presentation/widgets/common_painters.dart';
import '../controller/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppThemeColors.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: colors.background,
      body: Stack(
        children: [
          // Background Glow
          Positioned(
            top: -150,
            right: -100,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(seconds: 2),
              curve: Curves.easeOut,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: 1.0 + (value * 0.1),
                  child: Opacity(
                    opacity: value,
                    child: Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors.accentCyan.withOpacity(0.08),
                        boxShadow: [
                          BoxShadow(
                            color: colors.accentCyan.withOpacity(0.08),
                            blurRadius: 100,
                            spreadRadius: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Background Dots
          Positioned.fill(
            child: CustomPaint(
              painter: DotGridPainter(
                color: colors.text,
                spacing: 40,
                opacity: isDark ? 0.02 : 0.04,
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Icon
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.elasticOut,
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: colors.surface,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: colors.text.withOpacity(0.1),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: colors.primaryGold.withOpacity(
                                0.2 * value,
                              ),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            'assets/images/appIcon_2.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 30),

                // Text Reveal
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeOut,
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(0, 20 * (1 - value)),
                        child: Column(
                          children: [
                            Text(
                              "RetireSmart",
                              style: TextStyle(
                                color: colors.text,
                                fontSize: 32,
                                fontWeight: FontWeight.w900,
                                letterSpacing: -1,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Future Wealth Planning",
                              style: TextStyle(
                                color: colors.subtext,
                                fontSize: 14,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // Footer Loader
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  color: colors.accentCyan,
                  strokeWidth: 2,
                  backgroundColor: colors.text.withOpacity(0.05),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
