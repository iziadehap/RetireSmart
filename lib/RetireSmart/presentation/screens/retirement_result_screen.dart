import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/core/text_core.dart';
import '../../domain/models/retirement_model.dart';
import '../controllers/retirement_controller.dart';
import 'package:retiresmart/l10n/app_localizations.dart';

class RetirementResultScreen extends StatelessWidget {
  final RetirementResult result;

  const RetirementResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    // 2026 Theme Colors
    final Color bgStart = const Color(0xFF0F172A);
    final Color bgEnd = const Color(0xFF1E293B);
    final Color accent = const Color(0xFF38BDF8);
    final Color success = const Color(0xFF4ADE80);
    final Color warning = const Color(0xFFFBBF24);

    final s = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          s.blueprintTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontSize: 14,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Get.find<RetirementController>().reset();
            // Navigate back to wizard start
            Get.find<RetirementController>().currentStep.value = 0;
            Get.find<RetirementController>().pageController.jumpToPage(0);
            Get.back();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [bgStart, bgEnd],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeroCard(accent, success, warning, s),
                const SizedBox(height: 24),
                _buildMetricsGrid(accent, s),
                const SizedBox(height: 24),
                _buildPortfolioCard(accent, s),
                const SizedBox(height: 30),
                _buildActionButtons(accent, s),
                const SizedBox(height: 20),
                Text(
                  s.disclaimerText,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.3),
                    fontSize: 10,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroCard(
    Color accent,
    Color success,
    Color warning,
    AppLocalizations s,
  ) {
    bool isRisk = result.monthlySavingsNeeded > result.availableSavings;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blueAccent.withOpacity(0.2),
            Colors.purpleAccent.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: accent.withOpacity(0.1),
            blurRadius: 30,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            s.monthlyTargetLabel,
            style: TextStyle(
              color: accent,
              fontSize: 12,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "${TextCore.egpCoin} ${result.monthlySavingsNeeded.toStringAsFixed(0)}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.w800,
              height: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            s.requiredSavingsLabel,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 20),
          if (isRisk)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: warning.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: warning.withOpacity(0.5)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.warning_amber_rounded, color: warning, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    s.exceedsIncomeLabel,
                    style: TextStyle(
                      color: warning,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )
          else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: success.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: success.withOpacity(0.5)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle_outline, color: success, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    s.withinBudgetLabel,
                    style: TextStyle(
                      color: success,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMetricsGrid(Color accent, AppLocalizations s) {
    return Row(
      children: [
        Expanded(
          child: _buildMetricCard(
            s.nestEggLabel,
            "${TextCore.egpCoin}${(result.requiredNestEgg / 1000000).toStringAsFixed(2)}M",
            Icons.savings_outlined,
            accent,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildMetricCard(
            s.timelineLabel,
            "${result.yearsToRetirement} YRS",
            Icons.timer_outlined,
            const Color(0xFFF472B6),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 10,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioCard(Color accent, AppLocalizations s) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                s.assetAllocationLabel,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.pie_chart_outline, color: accent),
            ],
          ),
          const SizedBox(height: 24),
          ...result.investmentDistribution.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        entry.key,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "${(entry.value * 100).toInt()}%",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: entry.value,
                      minHeight: 6,
                      backgroundColor: Colors.white.withOpacity(0.1),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _getColorForAsset(entry.key),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Color _getColorForAsset(String asset) {
    switch (asset) {
      case 'Stocks':
        return const Color(0xFF38BDF8); // Sky
      case 'Gold':
        return const Color(0xFFFBBF24); // Amber
      case 'Certificates':
        return const Color(0xFF94A3B8); // Slate
      default:
        return Colors.white;
    }
  }

  Widget _buildActionButtons(Color accent, AppLocalizations s) {
    return ElevatedButton(
      onPressed: () {
        Get.find<RetirementController>().reset();
        Get.find<RetirementController>().currentStep.value = 0;
        Get.find<RetirementController>().pageController.jumpToPage(0);
        Get.back();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.1),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        side: BorderSide(color: Colors.white.withOpacity(0.1)),
      ),
      child: Text(
        s.createNewPlanButton,
        style: const TextStyle(
          letterSpacing: 1.5,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
