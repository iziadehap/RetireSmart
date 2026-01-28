import 'package:flutter/material.dart';
import 'package:retiresmart/GoldPrice/data/models/gold_price_model.dart';
import 'package:retiresmart/core/app_colors.dart';
import 'package:retiresmart/l10n/app_localizations.dart';

class GoldKaratCard extends StatelessWidget {
  final String label;
  final PriceDetails priceDetails;
  final AppLocalizations s;

  const GoldKaratCard({
    super.key,
    required this.label,
    required this.priceDetails,
    required this.s,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppThemeColors.of(context);

    return Container(
      decoration: BoxDecoration(
        color: colors.text.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.text.withOpacity(0.1)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: colors.primaryGold,
                ),
              ),
              Icon(
                Icons.monetization_on_outlined,
                color: colors.text.withOpacity(0.3),
                size: 20,
              ),
            ],
          ),
          const Spacer(),
          Text(
            "${s.buy}: ${priceDetails.buy.toStringAsFixed(0)}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: colors.text,
            ),
          ),
          Text(
            "${s.sell}: ${priceDetails.sell.toStringAsFixed(0)}",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: colors.subtext,
            ),
          ),
        ],
      ),
    );
  }
}
