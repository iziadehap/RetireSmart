import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/RetireSmart/presentation/controllers/retirement_controller.dart';
import 'package:retiresmart/l10n/app_localizations.dart';

void showRetirementDialog({
  required BuildContext context,
  required Color accent,
}) {
  final s = AppLocalizations.of(context)!;

  Get.defaultDialog(
    title: s.recalculate,
    titleStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    middleText: s.resetConfirmation,
    middleTextStyle: const TextStyle(color: Colors.white70),
    backgroundColor: const Color(0xFF1E293B),
    radius: 16,
    textConfirm: s.yesReset,
    textCancel: s.noCancel,
    confirmTextColor: Colors.white,
    cancelTextColor: Colors.white70,
    buttonColor: accent,
    onConfirm: () {
      Get.find<RetirementController>().reset();
      Get.find<RetirementController>().currentStep.value = 0;
      Get.find<RetirementController>().pageController.jumpToPage(0);
      Get.back(); // Close dialog
      Get.back(); // Go back to wizard
    },
  );
}
