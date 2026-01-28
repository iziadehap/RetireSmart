import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:get_x/get_core/src/get_main.dart';
import 'package:retiresmart/RetireSmart/data/models/inflation_model.dart';
import 'package:retiresmart/RetireSmart/presentation/controllers/retirement_controller.dart';
import 'package:retiresmart/RetireSmart/presentation/widgets/retirement_defaoutdialog.dart';
import 'package:screenshot/screenshot.dart';
import '../../domain/entities/retirement_entities.dart';
import 'package:retiresmart/l10n/app_localizations.dart';

// New Modular Imports
import '../widgets/common_painters.dart';
import '../widgets/fade_in_animation.dart';
import '../widgets/retirement_result_widgets.dart';

class RetirementResultScreen extends StatelessWidget {
  final RetirementResult result;
  final InflationModel inflationModel;
  final RetirementController controller;

  // 2026 Theme Colors
  final Color accent = const Color(0xFF00F5FF); // Cyan Neon
  final Color success = const Color(0xFF00E676); // Neon Green
  final Color warning = const Color(0xFFFFEA00); // Neon Yellow

  RetirementResultScreen({
    super.key,
    required this.result,
    required this.inflationModel,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Screenshot(
        controller: controller.screenshotController,
        child: buildReportContent(context, s),
      ),
    );
  }

  Widget buildReportContent(
    BuildContext context,
    AppLocalizations s, {
    bool isForSharing = false,
  }) {
    return Stack(
      children: [
        // Ambient Glow (Success Green)
        Positioned(
          top: -100,
          right: -100,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: success.withOpacity(0.05),
              boxShadow: [
                BoxShadow(
                  color: success.withOpacity(0.05),
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
              color: Colors.white,
              spacing: 40,
              opacity: 0.03,
            ),
          ),
        ),

        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (!isForSharing)
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.1),
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      )
                    else
                      const SizedBox(width: 40),
                    Text(
                      s.blueprintTitle.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 40), // Balance spacing
                  ],
                ),

                const SizedBox(height: 30),

                // Main Result Hero
                FadeIn(
                  delay: isForSharing ? 0 : 200,
                  child: ResultHeroCard(
                    result: result,
                    accent: accent,
                    success: success,
                    warning: warning,
                    s: s,
                  ),
                ),

                const SizedBox(height: 24),

                // Secondary Metrics
                FadeIn(
                  delay: isForSharing ? 0 : 400,
                  child: ResultMetricsGrid(result: result, s: s),
                ),

                const SizedBox(height: 24),

                // Inflation Chart
                FadeIn(
                  delay: isForSharing ? 0 : 500,
                  child: ResultInflationChart(
                    inflationModel: inflationModel,
                    warning: warning,
                    s: s,
                  ),
                ),

                const SizedBox(height: 24),

                // Distribution Chart
                FadeIn(
                  delay: isForSharing ? 0 : 600,
                  child: ResultPortfolioCard(
                    result: result,
                    accent: accent,
                    s: s,
                  ),
                ),

                if (!isForSharing) ...[
                  const SizedBox(height: 40),

                  // Actions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FadeIn(
                          delay: 800,
                          child: ElevatedButton(
                            onPressed: () {
                              showRetirementDialog(
                                context: context,
                                accent: accent,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: accent,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 10,
                              shadowColor: accent.withOpacity(0.4),
                            ),
                            child: Text(
                              s.createNewPlanButton,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      FadeIn(
                        delay: 1000,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.shareResult(
                              context,
                              result,
                              inflationModel,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: accent,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 10,
                            shadowColor: accent.withOpacity(0.4),
                          ),
                          child: const Icon(
                            Icons.share,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
