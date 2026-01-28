import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/l10n/app_localizations.dart';
import '../controller/gold_controller.dart';
import '../../data/models/gold_price_failure_model.dart';

class GoldFailureWidget extends StatelessWidget {
  final FailureType type;
  const GoldFailureWidget({super.key, required this.type});



  @override
  Widget build(BuildContext context) {
      final s = AppLocalizations.of(context)!;
    final GoldController controller = Get.find<GoldController>();

    IconData icon;
    String title;
    String message;
    Color accentColor;

    switch (type) {
      case FailureType.internetError:
        icon = Icons.signal_wifi_off_rounded;
        title = s.connectionLost;
        message =
            s.couldntReachTheGoldServers;
        accentColor = Colors.redAccent;
        break;
      case FailureType.requestError:
        icon = Icons.cloud_off_rounded;
        title = s.serverError;
        message =
            s.problemWithTheRequest;
        accentColor = Colors.orangeAccent;
        break;
      case FailureType.cashError:
        icon = Icons.storage_rounded;
        title = s.storageError;
        message = s.failedToLoadCachedData;
        accentColor = Colors.amberAccent;
        break;
    }

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              color: accentColor.withOpacity(0.05),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: accentColor.withOpacity(0.1),
                    boxShadow: [
                      BoxShadow(
                        color: accentColor.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
                Icon(icon, color: accentColor, size: 40),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            Obx(() {
              final isBackOnline = controller.isBackOnline.value;
              final buttonColor = isBackOnline
                  ? Colors.greenAccent
                  : accentColor;
              final buttonText = isBackOnline ? s.backOnline : s.tryAgain;
              final iconData = isBackOnline
                  ? Icons.check_circle_rounded
                  : Icons.refresh_rounded;

              return GestureDetector(
                onTap: controller.getGoldData,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [buttonColor, buttonColor.withOpacity(0.8)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: buttonColor.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(iconData, color: Colors.white, size: 20),
                      const SizedBox(width: 12),
                      Text(
                        buttonText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
