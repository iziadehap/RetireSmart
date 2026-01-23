import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:retiresmart/core/colors.dart';

class GoldShimmerScreen extends StatelessWidget {
  const GoldShimmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dark theme base colors
    final baseColor = Colors.white.withOpacity(0.05);
    final highlightColor = Colors.white.withOpacity(0.1);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [bgStart, bgEnd],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Card Placeholder
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                const SizedBox(height: 30),
                // Title Placeholder
                Container(height: 12, width: 150, color: Colors.white),
                const SizedBox(height: 16),
                // Grid Placeholders
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: List.generate(4, (index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 30),
                // Details Card Placeholder
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
