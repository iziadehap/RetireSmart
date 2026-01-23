import 'package:retiresmart/GoldPrice/data/dataSources/get_gold_data.dart';
import 'package:retiresmart/GoldPrice/domain/models/gold_price_model.dart';
import 'package:retiresmart/GoldPrice/domain/repo/gold_repo.dart';

class GoldRepoimpl implements GoldRepo {
  @override
  Future<GoldPriceModel> getGoldPrices() {
    return GoldApi().getGoldPrices();
  }
}