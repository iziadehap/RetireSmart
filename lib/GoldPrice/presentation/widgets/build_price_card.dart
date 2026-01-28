import 'package:flutter/material.dart';
import 'package:retiresmart/GoldPrice/data/models/gold_price_model.dart';
import 'package:retiresmart/l10n/app_localizations.dart';
import 'package:retiresmart/core/app_colors.dart';

class GoldMainPriceCard extends StatelessWidget {
  final GoldPriceModel data;
  final AppLocalizations s;
  final bool isFromCash;

  const GoldMainPriceCard({
    super.key,
    required this.data,
    required this.s,
    required this.isFromCash,
  });

  @override
  Widget build(BuildContext context) {
    final price = data.gold24k.buy;
    final colors = AppThemeColors.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors.primaryGold, colors.primaryGold.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: colors.primaryGold.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
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
                "${s.goldPrices} 24K / ${data.currency}",
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  isFromCash ? s.lastSeen : s.live,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isFromCash ? Colors.black54 : Colors.black87,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "${price.toStringAsFixed(2)} ${data.currency}",
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: Colors.black,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            s.buyPrice,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
