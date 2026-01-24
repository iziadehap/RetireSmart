import 'package:get_x/get.dart';
import '../models/goal_option.dart';

class GoalSelectionController extends GetxController {
  final RxList<GoalOption> goalOptions = <GoalOption>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadOptions();
  }

  void loadOptions() {
    isLoading.value = true;
    // Simulating data load or just setting static data
    goalOptions.assignAll([
      GoalOption(
        title: 'Gold Investment',
        description: 'Monitor spot prices and physical holdings in real-time.',
        iconPath: 'payments',
        route: '/gold',
        cardColorType: 'gold',
      ),
      GoalOption(
        title: 'Retirement Planning',
        description: 'Forecast your wealth and manage your long-term goals.',
        iconPath: 'query_stats',
        route: '/retirement',
        cardColorType: 'cyan',
      ),
    ]);
    isLoading.value = false;
  }

  void navigateToOption(GoalOption option) {
    Get.toNamed(option.route);
  }
}
