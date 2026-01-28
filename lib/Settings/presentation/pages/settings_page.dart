import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../controller/settings_controller.dart';
import 'package:retiresmart/l10n/app_localizations.dart';
import 'package:retiresmart/core/app_colors.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppThemeColors.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      body: Stack(
        children: [
          // Ambient Background Light
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.text.withOpacity(0.05),
                boxShadow: [
                  BoxShadow(
                    color: colors.text.withOpacity(0.05),
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
                opacity: Theme.of(context).brightness == Brightness.dark
                    ? 0.03
                    : 0.05,
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    // Custom Back Button
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: colors.text.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: colors.text.withOpacity(0.1),
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: colors.text,
                          size: 20,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                    // Header
                    FadeIn(
                      delay: 200,
                      child: Text(
                        AppLocalizations.of(context)!.settings,
                        style: TextStyle(
                          color: colors.text,
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Language Section
                    FadeIn(
                      delay: 400,
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: colors.text.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: colors.text.withOpacity(0.1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.language,
                                  color: colors.text,
                                  size: 24,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "Language",
                                  style: TextStyle(
                                    color: colors.text,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),

                            // Language Options
                            Obx(
                              () => Row(
                                children: [
                                  _buildLanguageOption(
                                    context,
                                    "English",
                                    "en",
                                    controller.currentStartLang.value == 'en',
                                  ),
                                  const SizedBox(width: 16),
                                  _buildLanguageOption(
                                    context,
                                    "العربية",
                                    "ar",
                                    controller.currentStartLang.value == 'ar',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Theme Section
                    FadeIn(
                      delay: 450,
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: colors.text.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: colors.text.withOpacity(0.1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.palette_outlined,
                                  color: colors.text,
                                  size: 24,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "App Appearance",
                                  style: TextStyle(
                                    color: colors.text,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Obx(
                              () => Row(
                                children: [
                                  _buildThemeOption(
                                    context,
                                    "Light",
                                    Icons.wb_sunny_rounded,
                                    !controller.isDarkMode.value,
                                    () => controller.toggleTheme(),
                                  ),
                                  const SizedBox(width: 16),
                                  _buildThemeOption(
                                    context,
                                    "Dark",
                                    Icons.nightlight_round,
                                    controller.isDarkMode.value,
                                    () => controller.toggleTheme(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Developers Section
                    FadeIn(
                      delay: 500,
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: colors.text.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: colors.text.withOpacity(0.1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.code_rounded,
                                  color: colors.text,
                                  size: 24,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "Developers",
                                  style: TextStyle(
                                    color: colors.text,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            _buildDevTile(
                              context,
                              "Ziad Ehab",
                              "@iziadehap",
                              () => controller.launchInstagram("iziadehap"),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Divider(
                                color: colors.text.withOpacity(0.1),
                              ),
                            ),
                            _buildDevTile(
                              context,
                              "Bassem Tarek",
                              "@ibassemtarek",
                              () => controller.launchInstagram("ibassemtarek"),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // App Info Placeholder
                    FadeIn(
                      delay: 600,
                      child: Center(
                        child: Text(
                          "Version 1.0.0",
                          style: TextStyle(
                            color: colors.text.withOpacity(0.3),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDevTile(
    BuildContext context,
    String name,
    String handle,
    VoidCallback onTap,
  ) {
    final colors = AppThemeColors.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE1306C).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Bootstrap.instagram,
              color: Color(0xFFE1306C),
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: colors.text,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  handle,
                  style: TextStyle(color: colors.subtext, fontSize: 14),
                ),
              ],
            ),
          ),
          Icon(Icons.open_in_new_rounded, color: colors.border, size: 18),
        ],
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context,
    String label,
    IconData icon,
    bool isSelected,
    VoidCallback onTap,
  ) {
    final colors = AppThemeColors.of(context);

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? colors.text : colors.text.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? Colors.transparent : Colors.transparent,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: colors.text.withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected ? colors.background : colors.text,
                size: 20,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? colors.background : colors.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    String label,
    String code,
    bool isSelected,
  ) {
    final colors = AppThemeColors.of(context);

    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeLanguage(code),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? colors.text : colors.text.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? colors.text : Colors.transparent,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: colors.text.withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? colors.background : colors.text,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
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
