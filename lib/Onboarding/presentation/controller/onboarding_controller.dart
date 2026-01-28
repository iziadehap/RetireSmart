import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/core/rockCode/cash_serves.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;
  final PageController pageController = PageController();
  final String onboardingKey = 'is_onboarding_done';

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void skip() {
    _completeOnboarding();
  }

  void next() {
    if (currentPage.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _completeOnboarding() async {
    final cache = CacheService();
    await cache.saveToCash(key: onboardingKey, data: true);
    Get.offAllNamed('/home');
  }
}
