import 'package:flutter/material.dart';
import '../models/goal_option.dart';

class GoalOptionCard extends StatelessWidget {
  final GoalOption option;
  final VoidCallback onTap;

  const GoalOptionCard({super.key, required this.option, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Determine colors based on type
    final isGold = option.cardColorType == 'gold';
    final primaryColor = isGold
        ? const Color(0xFFF2B90D)
        : const Color(0xFF00F5FF);
    final glowColor = isGold
        ? const Color(0xFFF2B90D).withOpacity(0.6)
        : const Color(0xFF00F5FF).withOpacity(0.6);
    final glassBg = isGold
        ? const Color(0xFFF2B90D).withOpacity(0.05)
        : const Color(0xFF00F5FF).withOpacity(0.05);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: glassBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: primaryColor.withOpacity(0.2), width: 1),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Blur effect replacement/simulation
              // In Flutter, BackdropFilter applies to what's BEHIND the widget.
              // For a card background, we usually just use a semi-transparent color if we don't need to blur the actual activity background.
              // Given the design is on a dark solid background, simple semi-transparent color is fine.

              // Gradient Blob effect (Top Right)
              Positioned(
                top: -40,
                right: -40,
                child: Container(
                  width: 128,
                  height: 128,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor.withOpacity(0.2),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        _getIconData(option.iconPath),
                        color: primaryColor,
                        size: 32,
                        shadows: [Shadow(color: glowColor, blurRadius: 8)],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Title
                    Text(
                      option.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Description
                    Text(
                      option.description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[400],
                        height: 1.5,
                      ),
                    ),
                    // Footer / Stats
                    // Footer / Stats
                    Container(
                      padding: const EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: primaryColor.withOpacity(0.1)),
                        ),
                      ),
                      child: Row(
                        // Using Row to layout "Live Price" label and value
                        crossAxisAlignment:
                            CrossAxisAlignment.end, // Align text baselines
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                isGold ? "LIVE PRICE" : "GOAL REACH",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(height: 2),
                              // Placeholder values as per design, normally these would come from the model too if dynamic
                              Text(
                                isGold ? "\$2,034.50" : "64%",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                          if (isGold)
                            Row(
                              children: [
                                const Icon(
                                  Icons.trending_up,
                                  color: Colors.greenAccent,
                                  size: 14,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  "1.2%",
                                  style: TextStyle(
                                    color: Colors.greenAccent[400],
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          if (!isGold)
                            Container(
                              width: 32,
                              height: 32,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.rocket_launch,
                                color: primaryColor.withOpacity(0.4),
                                size: 24,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom Highlight Line
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(height: 4, color: primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper to map string Icon names (from API/JSON) to IconData
  // Since we are using Material Symbols in the design, we map to standard Material Icons for now.
  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'payments':
        return Icons.payments;
      case 'query_stats':
        return Icons.query_stats;
      default:
        return Icons.circle;
    }
  }
}
