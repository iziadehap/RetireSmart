import 'dart:ui';

import 'package:get_x/get.dart';
import 'package:retiresmart/core/rockCode/cash_serves.dart';
import 'package:retiresmart/core/text_core.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await _getLanguage();
    _navigateToHome();
  }

  void _navigateToHome() async {
    // Wait for animations and initialization
    await Future.delayed(const Duration(seconds: 1));

    final cache = CacheService();
    bool? isOnboardingDone = await cache.getFromCash('is_onboarding_done');

    if (isOnboardingDone == true) {
      Get.offAllNamed('/home');
    } else {
      Get.offAllNamed('/onboarding');
    }
  }

  Future<void> _getLanguage() async {
    final cache = CacheService();
    String? language = await cache.getFromCash(TextCore.lanKey);
    if (language != null) {
      Get.updateLocale(Locale(language));
    } else {
      cache.saveToCash(key: TextCore.lanKey, data: TextCore.lan);
      Get.updateLocale(Locale(TextCore.lan));
    }
  }
}
