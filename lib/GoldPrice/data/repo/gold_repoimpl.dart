import 'package:retiresmart/GoldPrice/data/dataSources/get_gold_data.dart';
import 'package:retiresmart/GoldPrice/data/dataSources/get_last_gold_data_formcash.dart';
import 'package:retiresmart/GoldPrice/data/models/gold_price_model.dart';
import 'package:retiresmart/GoldPrice/domain/repo/gold_repo.dart';
import 'package:retiresmart/core/rockCode/cash_serves.dart';
import 'package:retiresmart/core/text_core.dart';

class GoldRepoimpl implements GoldRepo {
  final cache = CacheService();

  @override
  Future<GoldPriceModel> getGoldPrices() async {
    // final lastUpdate = await GetLastGoldDataFormcash().getLastGoldData();
    final lastUpdateDate = await GetLastGoldDataFormcash().getGoldLastUpdate();

    if (lastUpdateDate != null) {
      final now = DateTime.now();
      final lastUpdateDateformated = DateTime.parse(lastUpdateDate);
      final diff = now.difference(lastUpdateDateformated);

      if (diff.inDays < 1) {
        // get form api after 1 day
        print("get from cash");
        final cachedData = cache.getFromCash(TextCore.goldPriceKey);
        if (cachedData != null) {
          return cachedData as GoldPriceModel;
        }
      }
    }

    final response = await GoldApi().getGoldPrices();
    try {
      await cache.saveToCash(key: TextCore.goldPriceKey, data: response);
      await cache.saveToCash(
        key: TextCore.goldPriceUpdateKey,
        data: DateTime.now().toIso8601String(),
      );
    } catch (e) {
      print('error win try save gold model $e');
    }
    // save to cash
    print("get from api");
    return response;
  }
}
