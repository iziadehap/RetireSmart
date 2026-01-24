import 'package:get_x/get.dart';
import 'package:retiresmart/RetireSmart/data/dataSources/retire_dataSources.dart';
import 'package:retiresmart/RetireSmart/data/repo/retire_repoimpl.dart';
import 'package:retiresmart/RetireSmart/domain/repo/retire_repo.dart';
import 'package:retiresmart/RetireSmart/presentation/controllers/retirement_controller.dart';

class RetirementBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RetireRepo>(RetireRepoImpl(RetireDataSources()));
    Get.put<RetirementController>(RetirementController());
  }
}
