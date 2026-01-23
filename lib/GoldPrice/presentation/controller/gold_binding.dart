import 'package:get_x/get_core/src/get_main.dart';
import 'package:get_x/get_instance/src/bindings_interface.dart';
import 'package:get_x/get_instance/src/extension_instance.dart';
import 'package:retiresmart/GoldPrice/data/repo/gold_repoimpl.dart';
import 'package:retiresmart/GoldPrice/domain/repo/gold_repo.dart';

// ignore: deprecated_member_use
class GoldBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GoldRepo>(GoldRepoimpl());
  }
}
