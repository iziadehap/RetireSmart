import 'package:get_x/get.dart';
import 'package:retiresmart/RetireSmart/data/dataSources/retire_dataSources.dart';
import 'package:retiresmart/RetireSmart/data/repo/retire_repoimpl.dart';
import 'package:retiresmart/RetireSmart/domain/repo/retire_repo.dart';
import 'goal_selection_controller.dart';

class GoalSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RetireRepo>(() => RetireRepoImpl(RetireDataSources()));
    // Controller
    Get.lazyPut(() => GoalSelectionController());
  }
}
