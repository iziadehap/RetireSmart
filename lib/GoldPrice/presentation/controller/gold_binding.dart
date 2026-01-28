import 'package:get_x/get.dart';
import 'package:retiresmart/GoldPrice/data/repo/gold_repoimpl.dart';
import 'package:retiresmart/GoldPrice/domain/repo/gold_repo.dart';
import 'package:retiresmart/GoldPrice/domain/usecases/get_gold_data.dart';
import 'package:retiresmart/GoldPrice/presentation/controller/gold_controller.dart';

class GoldBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoldRepo>(() => GoldRepoimpl());
    Get.lazyPut<GetGoldData>(() => GetGoldData(goldRepo: Get.find<GoldRepo>()));
    Get.lazyPut<GoldController>(
      () => GoldController(getGoldDataUseCase: Get.find<GetGoldData>()),
    );
  }
}
