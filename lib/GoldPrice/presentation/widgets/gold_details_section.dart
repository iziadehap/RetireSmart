import 'package:flutter/material.dart';
import 'package:retiresmart/GoldPrice/data/models/gold_price_model.dart';
import 'package:retiresmart/l10n/app_localizations.dart';
import 'package:retiresmart/core/app_colors.dart';

class GoldDetailsSection extends StatelessWidget {
  final GoldPriceModel data;
  final AppLocalizations s;

  const GoldDetailsSection({super.key, required this.data, required this.s});

  @override
  Widget build(BuildContext context) {
    final colors = AppThemeColors.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: colors.text.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colors.text.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.2 : 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildDetailRow(context, s.currency, data.currency),
            Divider(color: colors.text.withOpacity(0.1)),
            _buildDetailRow(context, s.unit, data.unit),
            Divider(color: colors.text.withOpacity(0.1)),
            _buildDetailRow(context, s.source, data.source),
            Divider(color: colors.text.withOpacity(0.1)),
            _buildDetailRow(
              context,
              s.lastUpdated,
              _formatTime(data.lastUpdated),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    final colors = AppThemeColors.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: colors.subtext, fontSize: 15)),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: colors.text,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime timestamp) {
    return "${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}";
  }
}
