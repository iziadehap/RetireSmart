import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/GoldPrice/presentation/widgets/connectivity_bar.dart';
import 'package:retiresmart/GoldPrice/presentation/widgets/gold_failure_widget.dart';
import 'package:retiresmart/GoldPrice/presentation/widgets/gold_shimmer_screen.dart';
import 'package:retiresmart/GoldPrice/presentation/widgets/build_price_card.dart';
import 'package:retiresmart/GoldPrice/presentation/widgets/gold_karat_card.dart';
import 'package:retiresmart/GoldPrice/presentation/widgets/gold_details_section.dart';
import 'package:retiresmart/GoldPrice/presentation/controller/gold_controller.dart';
import 'package:retiresmart/core/app_colors.dart';
import 'package:retiresmart/l10n/app_localizations.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppLocalizations.of(context)!;
    final colors = AppThemeColors.of(context);

    // Controller is injected via Binding in GetPage
    final GoldController controller = Get.find<GoldController>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          s.goldPrices,
          style: TextStyle(
            color: colors.text,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20, color: colors.text),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        color: colors.background,
        child: SafeArea(
          child: Column(
            children: [
              const GoldConnectivityBar(),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const GoldShimmerScreen();
                  }

                  if (controller.isFailed.value != null) {
                    return GoldFailureWidget(type: controller.isFailed.value!);
                  }

                  if (controller.goldPrice.value == null) {
                    return Center(
                      child: Text(
                        s.failedToLoadGoldData,
                        style: TextStyle(color: colors.subtext),
                      ),
                    );
                  }

                  final data = controller.goldPrice.value!;

                  return RefreshIndicator(
                    onRefresh: () async => controller.getGoldData(),
                    color: colors.accentCyan,
                    backgroundColor: colors.card,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header Card
                          GoldMainPriceCard(
                            data: data,
                            s: s,
                            isFromCash: controller.isFromCash.value,
                          ),
                          const SizedBox(height: 30),
                          Text(
                            s.karatPrices,
                            style: TextStyle(
                              color: colors.text.withOpacity(0.5),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Grid for karats
                          GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            children: [
                              GoldKaratCard(
                                label: "24k",
                                priceDetails: data.gold24k,
                                s: s,
                              ),
                              GoldKaratCard(
                                label: "22k",
                                priceDetails: data.gold21k,
                                s: s,
                              ),
                              GoldKaratCard(
                                label: "21k",
                                priceDetails: data.gold21k,
                                s: s,
                              ),
                              GoldKaratCard(
                                label: "18k",
                                priceDetails: data.gold18k,
                                s: s,
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          // Extra details
                          GoldDetailsSection(data: data, s: s),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
