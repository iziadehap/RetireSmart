import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/GoldPrice/gold_controller.dart';
import 'package:retiresmart/GoldPrice/gold_response_model.dart';

import 'package:retiresmart/GoldPrice/gold_shimmer_screen.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure controller is registered
    final GoldController controller = Get.put(GoldController());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Gold Prices (Live)"),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const GoldShimmerScreen();
        }

        if (controller.goldPrice.value == null &&
            controller.isLoading.value == false) {
          return const Center(child: Text("Failed to load gold data."));
        }

        final data = controller.goldPrice.value!;

        return RefreshIndicator(
          onRefresh: () async => controller.getGoldData(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Card
                _buildMainPriceCard(data),
                const SizedBox(height: 20),
                const Text(
                  "Karat Prices (Per Gram)",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                // Grid for other karats
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    _buildKaratCard("24k", data.priceGram24k),
                    _buildKaratCard("22k", data.priceGram22k),
                    _buildKaratCard("21k", data.priceGram21k),
                    _buildKaratCard("18k", data.priceGram18k),
                  ],
                ),
                const SizedBox(height: 20),
                // Extra details
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildDetailRow("Currency", data.currency),
                        const Divider(),
                        _buildDetailRow("Exchange", data.exchange),
                        const Divider(),
                        _buildDetailRow(
                          "Open Time",
                          _formatTime(data.openTime),
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
    );
  }

  Widget _buildMainPriceCard(GoldPriceModel data) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFD700), Color(0xFFFFA000)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
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
                "${data.metal} / ${data.currency}",
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  data.symbol,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "${data.price.toStringAsFixed(2)} ${data.currency}",
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(
                data.ch >= 0 ? Icons.arrow_upward : Icons.arrow_downward,
                color: data.ch >= 0 ? Colors.green[800] : Colors.red[800],
                size: 20,
              ),
              const SizedBox(width: 4),
              Text(
                "${data.ch >= 0 ? "+" : ""}${data.ch.toStringAsFixed(2)}",
                style: TextStyle(
                  color: data.ch >= 0 ? Colors.green[800] : Colors.red[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKaratCard(String label, double price) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.amber[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            price.toStringAsFixed(2),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  String _formatTime(int timestamp) {
    // Basic formatting or dependency on intl could be added here
    // For now returning simple string representation
    return DateTime.fromMillisecondsSinceEpoch(
      timestamp * 1000,
    ).toString().split('.')[0];
  }
}
