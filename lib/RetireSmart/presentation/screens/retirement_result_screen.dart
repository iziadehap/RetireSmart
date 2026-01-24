import 'package:flutter/material.dart';
import 'package:retiresmart/RetireSmart/presentation/screens/retirement_defaoutdialog.dart';
import 'package:retiresmart/core/text_core.dart';
import '../../domain/entities/retirement_entities.dart';
import 'package:retiresmart/l10n/app_localizations.dart';

class RetirementResultScreen extends StatelessWidget {
  final RetirementResult result;
  

  // 2026 Theme Colors
  final Color accent = const Color(0xFF00F5FF); // Cyan Neon
  final Color success = const Color(0xFF00E676); // Neon Green
  final Color warning = const Color(0xFFFFEA00); // Neon Yellow

  const RetirementResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Stack(
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
                      GestureDetector(
                        onTap: () {
                          showRetirementDialog(
                            context: context,
                            accent: accent,
                          );
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
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
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
                  FadeIn(delay: 200, child: _buildHeroCard(s)),

                  const SizedBox(height: 24),

                  // Secondary Metrics
                  FadeIn(delay: 400, child: _buildMetricsGrid(s)),

                  const SizedBox(height: 24),

                  // Distribution Chart
                  FadeIn(delay: 600, child: _buildPortfolioCard(s)),

                  const SizedBox(height: 40),

                  // Actions
                  FadeIn(
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
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroCard(AppLocalizations s) {
    bool isRisk = result.monthlySavingsNeeded > result.availableSavings;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.05),
            Colors.white.withOpacity(0.02),
          ],
        ),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
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
            style: const TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.w900,
              height: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            s.requiredSavingsLabel,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 13,
            ),
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

  Widget _buildMetricsGrid(AppLocalizations s) {
    return Row(
      children: [
        Expanded(
          child: _buildMetricItem(
            s.nestEggLabel,
            "${TextCore.egpCoin}${(result.requiredNestEgg / 1000000).toStringAsFixed(2)}M",
            Icons.savings_outlined,
            const Color(0xFFF472B6), // Pink accent
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildMetricItem(
            s.timelineLabel,
            "${result.yearsToRetirement} YRS",
            Icons.hourglass_bottom,
            const Color(0xFFA78BFA), // Purple accent
          ),
        ),
      ],
    );
  }

  Widget _buildMetricItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
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
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
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

  Widget _buildPortfolioCard(AppLocalizations s) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
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
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.pie_chart_outline, color: accent),
            ],
          ),
          const SizedBox(height: 24),
          ...result.investmentDistribution.entries.map((entry) {
            Color barColor = _getColorForAsset(entry.key);
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
                      color: barColor,
                      backgroundColor: Colors.white.withOpacity(0.1),
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
        return const Color(0xFF38BDF8);
      case 'Gold':
        return const Color(0xFFFBBF24);
      case 'Certificates':
        return const Color(0xFF94A3B8);
      default:
        return Colors.white;
    }
  }
}

// Local Utils
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
    this.spacing = 30.0,
    this.opacity = 0.05,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color.withOpacity(opacity)
      ..style = PaintingStyle.fill;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1.0, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
