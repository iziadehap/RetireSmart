import 'package:retiresmart/core/rockCode/cash_serves.dart';
import 'package:retiresmart/GoldPrice/data/models/gold_price_model.dart';
import 'package:retiresmart/core/text_core.dart';

class GetLastGoldDataFormcash {
  final cache = CacheService();

  Future<GoldPriceModel?> getLastGoldData() async {
    return cache.getFromCash(TextCore.goldPriceKey) as GoldPriceModel?;

  }
  Future<String?> getGoldLastUpdate() async {
    return cache.getFromCash(TextCore.goldPriceUpdateKey);
  }
}