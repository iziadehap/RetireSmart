import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/l10n/app_localizations.dart';
import 'package:retiresmart/core/app_colors.dart';
import 'package:retiresmart/RetireSmart/presentation/widgets/common_painters.dart';
import '../controller/onboarding_controller.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context)!;
    final colors = AppThemeColors.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: colors.background,
      body: Stack(
        children: [
          // Ambient Glow
          Positioned(
            top: -100,
            left: -100,
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

          // Dotted Grid
          Positioned.fill(
            child: CustomPaint(
              painter: DotGridPainter(
                color: colors.text,
                spacing: 40,
                opacity: isDark ? 0.02 : 0.04,
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: controller.skip,
                    child: Text(
                      s.skip,
                      style: TextStyle(color: colors.subtext),
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    children: [
                      _buildPage(
                        context,
                        title: s.onboardingTitle1,
                        description: s.onboardingDesc1,
                        icon: Icons.rocket_launch_outlined,
                        color: colors.accentCyan,
                      ),
                      _buildPage(
                        context,
                        title: s.onboardingTitle2,
                        description: s.onboardingDesc2,
                        icon: Icons.monetization_on_outlined,
                        color: colors.primaryGold,
                      ),
                      _buildPage(
                        context,
                        title: s.onboardingTitle3,
                        description: s.onboardingDesc3,
                        icon: Icons.language_outlined,
                        color: colors.text,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 40,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Page Indicators
                      Row(
                        children: List.generate(3, (index) {
                          return Obx(() {
                            bool isActive =
                                controller.currentPage.value == index;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.only(right: 8),
                              height: 8,
                              width: isActive ? 24 : 8,
                              decoration: BoxDecoration(
                                color: isActive
                                    ? colors.accentCyan
                                    : colors.text.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: isActive
                                    ? [
                                        BoxShadow(
                                          color: colors.accentCyan.withOpacity(
                                            0.3,
                                          ),
                                          blurRadius: 8,
                                          spreadRadius: 1,
                                        ),
                                      ]
                                    : [],
                              ),
                            );
                          });
                        }),
                      ),

                      // Next Button
                      Obx(() {
                        bool isLastPage = controller.currentPage.value == 2;
                        return ElevatedButton(
                          onPressed: controller.next,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colors.accentCyan,
                            foregroundColor: isDark
                                ? Colors.black
                                : Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 8,
                            shadowColor: colors.accentCyan.withOpacity(0.4),
                          ),
                          child: Text(
                            isLastPage ? s.getStarted : s.nextButton,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    final colors = AppThemeColors.of(context);
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: color.withOpacity(0.2)),
            ),
            child: Icon(icon, size: 80, color: color),
          ),
          const SizedBox(height: 60),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colors.text,
              fontSize: 32,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(color: colors.subtext, fontSize: 16, height: 1.5),
          ),
        ],
      ),
    );
  }
}
