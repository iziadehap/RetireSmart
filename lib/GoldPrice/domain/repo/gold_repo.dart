import 'package:retiresmart/GoldPrice/data/models/gold_price_model.dart';

abstract class GoldRepo {
  Future<GoldPriceModel> getGoldPrices();
}
