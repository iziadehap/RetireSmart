import 'package:retiresmart/GoldPrice/domain/models/gold_price_model.dart';

abstract class GoldRepo {
  Future<GoldPriceModel> getGoldPrices();
}
