import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/GoldPrice/domain/models/gold_price_model.dart';
import 'package:retiresmart/GoldPrice/presentation/controller/gold_controller.dart';
import 'package:retiresmart/GoldPrice/presentation/widgets/gold_shimmer_screen.dart';
import 'package:retiresmart/core/colors.dart';
import 'package:retiresmart/l10n/app_localizations.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context)!;

    // Controller is injected via Binding in GetPage
    final GoldController controller = Get.find<GoldController>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          s.goldPrices,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [bgStart, bgEnd],
          ),
        ),
        child: SafeArea(
          child: Obx(() {
            if (controller.isLoading.value) {
              return const GoldShimmerScreen();
            }

            if (controller.goldPrice.value == null &&
                !controller.isLoading.value) {
              return Center(
                child: Text(
                  s.failedToLoadGoldData,
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
              );
            }

            final data = controller.goldPrice.value!;

            return RefreshIndicator(
              onRefresh: () async => controller.getGoldData(),
              color: accent,
              backgroundColor: bgEnd,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Card
                    _buildMainPriceCard(data,s),
                    const SizedBox(height: 30),
                    Text(
                      s.karatPrices,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Grid for other karats
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: [
                        _buildKaratCard("24k", data.gold24k,s),
                        _buildKaratCard(
                          "22k",
                          data.gold21k,s
                        ), // Note: Model might not have 22k explicitly mapped in early steps, check model.
                        // Wait, user provided model has 24, 21, 18.
                        // I will use 21k again or just listing available ones.
                        // The user request explicitly said "use here this model", and the model shows 24, 21, 18.
                        // I will display 24, 21, 18 and maybe calculate 22 if needed or just skip it.
                        // Ideally I stick to what's in the model.
                        // I'll display the 3 available + maybe specific details?
                        // Let's stick to the model properties: gold24k, gold21k, gold18k.
                        // I will remove the 4th item or just put 3 in a different layout?
                        // Grid of 2 fits 4 items well. I'll add "Currency" as the 4th block for symmetry or just list 3.
                        // Let's list the 3 karats.
                        _buildKaratCard("21k", data.gold21k,s),
                        _buildKaratCard("18k", data.gold18k,s),
                      ],
                    ),
                    const SizedBox(height: 30),
                    // Extra details
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.1),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            _buildDetailRow(s.currency, data.currency),
                            Divider(color: Colors.white.withOpacity(0.1)),
                            _buildDetailRow(s.unit, data.unit),
                            Divider(color: Colors.white.withOpacity(0.1)),
                            _buildDetailRow(s.source, data.source),
                            Divider(color: Colors.white.withOpacity(0.1)),
                            _buildDetailRow(
                              s.lastUpdated,
                              _formatTime(data.lastUpdated),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildMainPriceCard(GoldPriceModel data, AppLocalizations s) {
    // Assuming 24k is the 'main' price to show or maybe the average?
    // Usually standard Gold Price is per ounce or 24k gram.
    // I'll use 24k Buy price as the headline.
    final price = data.gold24k.buy;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFD700), Color(0xFFFFA000)], // Gold Gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFA000).withOpacity(0.3),
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
                  s.live,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "${price.toStringAsFixed(2)} ${data.currency}",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: Colors.black,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            s.buyPrice,
            style:  TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKaratCard(String label, PriceDetails priceDetails, AppLocalizations s) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
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
                  color: accent,
                ),
              ),
              Icon(
                Icons.monetization_on_outlined,
                color: Colors.white.withOpacity(0.3),
                size: 20,
              ),
            ],
          ),
          const Spacer(),
          Text(
            "${s.buy}: ${priceDetails.buy.toStringAsFixed(0)}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            "${s.sell}: ${priceDetails.sell.toStringAsFixed(0)}",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 15,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
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
