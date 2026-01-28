import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import '../../domain/entities/retirement_entities.dart';
import '../../data/models/inflation_model.dart';
import '../../../core/text_core.dart';
import '../../../l10n/app_localizations.dart';
import '../../../core/app_colors.dart';
import './common_painters.dart';

class ResultHeroCard extends StatelessWidget {
  final RetirementResult result;
  final Color accent;
  final Color success;
  final Color warning;
  final AppLocalizations s;

  const ResultHeroCard({
    super.key,
    required this.result,
    required this.accent,
    required this.success,
    required this.warning,
    required this.s,
  });

  @override
  Widget build(BuildContext context) {
    bool isRisk = result.monthlySavingsNeeded > result.availableSavings;
    final colors = AppThemeColors.of(context);

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: colors.text.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.4)
                : colors.text.withOpacity(0.08),
            blurRadius: 30,
            offset: const Offset(0, 15),
            spreadRadius: -5,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            s.monthlyTargetLabel.toUpperCase(),
            style: TextStyle(
              color: accent,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "${TextCore.egpCoin} ${result.monthlySavingsNeeded.toStringAsFixed(0)}",
            style: TextStyle(
              color: colors.text,
              fontSize: 42,
              fontWeight: FontWeight.w900,
              height: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            s.requiredSavingsLabel,
            style: TextStyle(color: colors.subtext, fontSize: 13),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: (isRisk ? warning : success).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: (isRisk ? warning : success).withOpacity(0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isRisk
                      ? Icons.warning_amber_rounded
                      : Icons.check_circle_outline,
                  color: isRisk ? warning : success,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  isRisk ? s.exceedsIncomeLabel : s.withinBudgetLabel,
                  style: TextStyle(
                    color: isRisk ? warning : success,
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
}

class ResultMetricsGrid extends StatelessWidget {
  final RetirementResult result;
  final AppLocalizations s;

  const ResultMetricsGrid({super.key, required this.result, required this.s});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _MetricItem(
            label: s.nestEggLabel,
            value:
                "${TextCore.egpCoin}${(result.requiredNestEgg / 1000000).toStringAsFixed(2)}M",
            icon: Icons.savings_outlined,
            color: const Color(0xFFF472B6), // Pink accent
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _MetricItem(
            label: s.timelineLabel,
            value: "${result.yearsToRetirement} YRS",
            icon: Icons.hourglass_bottom,
            color: const Color(0xFFA78BFA), // Purple accent
          ),
        ),
      ],
    );
  }
}

class _MetricItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _MetricItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppThemeColors.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colors.text.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: colors.text.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: TextStyle(
              color: colors.text,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: TextStyle(
              color: colors.subtext,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class ResultPortfolioCard extends StatelessWidget {
  final RetirementResult result;
  final Color accent;
  final AppLocalizations s;

  const ResultPortfolioCard({
    super.key,
    required this.result,
    required this.accent,
    required this.s,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppThemeColors.of(context);
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colors.text.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: colors.text.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                s.assetAllocationLabel,
                style: TextStyle(
                  color: colors.text,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.pie_chart_outline, color: accent),
            ],
          ),
          const SizedBox(height: 24),
          ...result.investmentDistribution.entries.map((entry) {
            Color barColor = _getColorForAsset(entry.key, colors);
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        entry.key,
                        style: TextStyle(
                          color: colors.text.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "${(entry.value * 100).toInt()}%",
                        style: TextStyle(
                          color: colors.text,
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
                      color: barColor,
                      backgroundColor: colors.text.withOpacity(0.1),
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => Get.toNamed('/needHelp'),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: accent.withOpacity(0.05),
                border: Border.all(color: accent.withOpacity(0.2)),
                boxShadow: [
                  BoxShadow(
                    color: accent.withOpacity(0.05),
                    blurRadius: 10,
                    spreadRadius: -2,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: accent.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.auto_awesome_outlined,
                      color: accent,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      s.investmentGuideTitle,
                      style: TextStyle(
                        color: colors.text,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: colors.text.withOpacity(0.3),
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Color _getColorForAsset(String asset, AppThemeColors colors) {
    switch (asset) {
      case 'Stocks':
        return const Color(0xFF38BDF8);
      case 'Gold':
        return const Color(0xFFFBBF24);
      case 'Certificates':
        return const Color(0xFF94A3B8);
      default:
        return colors.text;
    }
  }
}

class ResultInflationChart extends StatelessWidget {
  final InflationModel inflationModel;
  final Color warning;
  final AppLocalizations s;

  const ResultInflationChart({
    super.key,
    required this.inflationModel,
    required this.warning,
    required this.s,
  });

  @override
  Widget build(BuildContext context) {
    if (inflationModel.estimates == null || inflationModel.estimates!.isEmpty) {
      return const SizedBox.shrink();
    }

    final colors = AppThemeColors.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colors.text.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: colors.text.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                s.inflationProjectionLabel,
                style: TextStyle(
                  color: colors.text,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.auto_graph_rounded, color: warning, size: 20),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 180,
            width: double.infinity,
            child: CustomPaint(
              painter: InflationChartPainter(
                estimates: inflationModel.estimates!,
                lineColor: warning,
                gridColor: colors.text,
                dotStrokeColor: colors.background,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${inflationModel.estimates!.first.year}",
                style: TextStyle(color: colors.subtext, fontSize: 10),
              ),
              Text(
                "${inflationModel.estimates!.last.year}",
                style: TextStyle(color: colors.subtext, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
