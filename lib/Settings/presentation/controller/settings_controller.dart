import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/core/rockCode/cash_serves.dart';
import 'package:retiresmart/core/text_core.dart';

class SettingsController extends GetxController {
  final RxString currentStartLang = TextCore.lan.obs;

  @override
  void onInit() {
    super.onInit();
    final cache = CacheService();
    currentStartLang.value = cache.getFromCash(TextCore.lanKey) as String;
    if (Get.locale != null) {
      currentStartLang.value = Get.locale!.languageCode;
    }
  }

  void changeLanguage(String languageCode) {
    final cache = CacheService();

    cache.saveToCash(key: TextCore.lanKey, data: languageCode);
    if (languageCode == currentStartLang.value) return;

    currentStartLang.value = languageCode;
    Get.updateLocale(Locale(languageCode));
  }
}
