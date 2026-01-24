import 'package:get_x/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() async {
    // Wait for animations and initialization
    await Future.delayed(const Duration(seconds: 4));
    Get.offAllNamed('/home');
  }
}
