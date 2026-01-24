import 'package:flutter/material.dart';
import 'package:get_x/get.dart';

class SettingsController extends GetxController {
  // Logic to determine initial language could be improved by checking Get.deviceLocale or Storage
  // For now, defaulting to English or checking current Get.locale
  final RxString currentStartLang = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.locale != null) {
      currentStartLang.value = Get.locale!.languageCode;
    }
  }

  void changeLanguage(String languageCode) {
    if (languageCode == currentStartLang.value) return;

    currentStartLang.value = languageCode;
    Get.updateLocale(Locale(languageCode));
  }
}
