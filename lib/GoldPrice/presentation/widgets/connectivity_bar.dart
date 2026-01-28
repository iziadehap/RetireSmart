import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/GoldPrice/presentation/controller/gold_controller.dart';
import 'package:retiresmart/l10n/app_localizations.dart';

class GoldConnectivityBar extends StatelessWidget {
  const GoldConnectivityBar({super.key});

  @override
  Widget build(BuildContext context) {
    final GoldController controller = Get.find<GoldController>();
    final s = AppLocalizations.of(context)!;

    return Obx(() {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: controller.isOffline.value ? 40 : 0,
        width: double.infinity,
        color: Colors.redAccent.withOpacity(0.9),
        child: controller.isOffline.value
            ? Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.wifi_off_rounded, color: Colors.white, size: 16),
                    SizedBox(width: 8),
                    Text(
                      s.offline,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      );
    });
  }
}
