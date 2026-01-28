import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/RetireSmart/presentation/widgets/common_painters.dart';
import 'package:retiresmart/RetireSmart/presentation/widgets/fade_in_animation.dart';
import 'package:retiresmart/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:retiresmart/core/app_colors.dart';

class InvestmentGuideScreen extends StatelessWidget {
  const InvestmentGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context)!;
    final isArabic = Get.locale?.languageCode == 'ar';
    final colors = AppThemeColors.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header with Back Button
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: colors.text,
                            size: 20,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          s.investmentGuideTitle,
                          style: TextStyle(
                            color: colors.subtext,
                            fontSize: 14,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Thndr Hero Header
                    FadeIn(
                      delay: 200,
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              colors.text.withOpacity(0.05),
                              colors.text.withOpacity(0.02),
                            ],
                          ),
                          border: Border.all(
                            color: colors.text.withOpacity(0.08),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: colors.accentCyan.withOpacity(0.2),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  "assets/images/thndr.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              s.thndrGuideTitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: colors.text,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: colors.success.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: colors.success.withOpacity(0.3),
                                ),
                              ),
                              child: Text(
                                s.thndrRecommendation,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: colors.success,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Sections
                    _buildSectionCard(
                      context: context,
                      title: s.goldSectionTitle,
                      description: s.goldSectionDesc,
                      icon: Icons.workspace_premium,
                      color: colors.primaryGold,
                      delay: 400,
                    ),

                    const SizedBox(height: 16),

                    _buildSectionCard(
                      context: context,
                      title: s.stocksSectionTitle,
                      description: s.stocksSectionDesc,
                      icon: Icons.trending_up,
                      color: colors.accentCyan,
                      delay: 600,
                    ),

                    const SizedBox(height: 16),

                    _buildSectionCard(
                      context: context,
                      title: s.certificatesSectionTitle,
                      description: s.certificatesSectionDesc,
                      icon: Icons.account_balance,
                      color: const Color(0xFFA78BFA),
                      delay: 800,
                    ),

                    const SizedBox(height: 40),

                    // Actions
                    FadeIn(
                      delay: 1000,
                      child: ElevatedButton(
                        onPressed: () {
                          launchUrl(
                            Uri.parse("https://thndr.app.link/iziadehap"),
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.accentCyan,
                          foregroundColor: isDark ? Colors.black : Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 10,
                          shadowColor: colors.accentCyan.withOpacity(0.4),
                        ),
                        child: Text(
                          s.downloadThndr,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    FadeIn(
                      delay: 1100,
                      child: InkWell(
                        onTap: () {}, // Link to referral
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: colors.text.withOpacity(0.1),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            s.referralMessage,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: colors.subtext,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required BuildContext context,
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required int delay,
  }) {
    final colors = AppThemeColors.of(context);
    return FadeIn(
      delay: delay,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colors.text.withOpacity(0.03),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: colors.text.withOpacity(0.05)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: colors.text,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      color: colors.subtext,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
