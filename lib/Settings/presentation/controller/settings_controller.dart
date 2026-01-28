import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/core/rockCode/cash_serves.dart';
import 'package:retiresmart/core/text_core.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> launchInstagram(String username) async {
    final Uri url = Uri.parse('https://www.instagram.com/$username/');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      Get.snackbar(
        'Error',
        'Could not launch Instagram for $username',
        snackPosition: SnackPosition.bottom,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }
}
