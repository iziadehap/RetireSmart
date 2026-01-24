import 'package:get_x/get.dart';
import 'goal_selection_controller.dart';

class GoalSelectionBinding extends Bindings {
  @override
  void dependencies() {
    // Controller
    Get.lazyPut(() => GoalSelectionController());
  }
}
