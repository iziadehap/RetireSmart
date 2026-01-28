import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/l10n/app_localizations.dart';
import 'package:retiresmart/core/app_colors.dart';
import '../controller/goal_selection_controller.dart';
import '../widgets/modern_menu_card.dart';

class GoalSelectionPage extends StatelessWidget {
  const GoalSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context)!;
    final colors = AppThemeColors.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: colors.background,
      body: Stack(
        children: [
          // Ambient Background Light
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.primaryGold.withOpacity(0.05),
                boxShadow: [
                  BoxShadow(
                    color: colors.primaryGold.withOpacity(0.05),
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

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  // Header
                  FadeIn(
                    delay: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          s.welcomeBack,
                          style: TextStyle(
                            color: colors.subtext,
                            fontSize: 16,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "RetireSmart",
                          style: TextStyle(
                            color: colors.text,
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Recent Plan Section
                  GetX<GoalSelectionController>(
                    builder: (controller) {
                      if (controller.recentCalculation.value == null) {
                        return const SizedBox.shrink();
                      }

                      return FadeIn(
                        delay: 300,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                colors.accentCyan.withOpacity(0.1),
                                Colors.transparent,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: colors.accentCyan.withOpacity(0.2),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed('/retirement');
                            },
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: colors.accentCyan.withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.history_rounded,
                                    color: colors.accentCyan,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Recent Plan Found",
                                        style: TextStyle(
                                          color: colors.subtext,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "Click to resume your retirement blueprint",
                                        style: TextStyle(
                                          color: colors.text,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: colors.border,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // Menu Options
                  FadeIn(
                    delay: 400,
                    child: ModernMenuCard(
                      title: s.goldInvestment,
                      subtitle: s.goldInvestmentDesc,
                      icon: Icons.monetization_on_outlined,
                      accentColor: colors.primaryGold,
                      onTap: () => Get.toNamed('/gold'),
                    ),
                  ),
                  const SizedBox(height: 24),

                  FadeIn(
                    delay: 600,
                    child: ModernMenuCard(
                      title: s.retirementPlanning,
                      subtitle: s.retirementPlanningDesc,
                      icon: Icons.rocket_launch_outlined,
                      accentColor: colors.accentCyan,
                      onTap: () => Get.toNamed('/retirement'),
                    ),
                  ),

                  const Spacer(),

                  // Settings (Bottom)
                  FadeIn(
                    delay: 800,
                    child: ModernMenuCard(
                      title: s.settings,
                      subtitle: "",
                      icon: Icons.settings_outlined,
                      accentColor: colors.text,
                      isSettings: true,
                      onTap: () => Get.toNamed('/settings'),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Simple Fade In Animation Wrapper
class FadeIn extends StatefulWidget {
  final Widget child;
  final int delay;

  const FadeIn({super.key, required this.child, required this.delay});

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _translate;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _translate = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _translate,
      child: FadeTransition(opacity: _opacity, child: widget.child),
    );
  }
}

class DotGridPainter extends CustomPainter {
  final Color color;
  final double spacing;
  final double opacity;

  DotGridPainter({
    this.color = Colors.white,
    this.spacing = 30.0, // Space between dots
    this.opacity = 0.05, // Very subtle opacity
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color.withOpacity(opacity)
      ..style = PaintingStyle.fill;

    // Radius of each dot
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
