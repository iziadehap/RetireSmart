import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/l10n/app_localizations.dart';
import '../controller/onboarding_controller.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
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
                color: const Color(0xFF00F5FF).withOpacity(0.05),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00F5FF).withOpacity(0.05),
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
                color: Colors.white,
                spacing: 40,
                opacity: 0.03,
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
                      style: const TextStyle(color: Colors.grey),
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
                        color: const Color(0xFF00F5FF),
                      ),
                      _buildPage(
                        context,
                        title: s.onboardingTitle2,
                        description: s.onboardingDesc2,
                        icon: Icons.monetization_on_outlined,
                        color: const Color(0xFFF2B90D),
                      ),
                      _buildPage(
                        context,
                        title: s.onboardingTitle3,
                        description: s.onboardingDesc3,
                        icon: Icons.language_outlined,
                        color: Colors.white,
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
                                    ? const Color(0xFF00F5FF)
                                    : Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4),
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
                            backgroundColor: const Color(0xFF00F5FF),
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
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
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class DotGridPainter extends CustomPainter {
  final Color color;
  final double spacing;
  final double opacity;

  DotGridPainter({
    this.color = Colors.white,
    this.spacing = 30.0,
    this.opacity = 0.05,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color.withOpacity(opacity)
      ..style = PaintingStyle.fill;
    const double dotRadius = 1.0;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
