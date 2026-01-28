import 'package:dartz/dartz.dart';
import 'package:retiresmart/GoldPrice/data/dataSources/get_gold_data.dart';
import 'package:retiresmart/GoldPrice/data/models/gold_price_failure_model.dart';
import 'package:retiresmart/GoldPrice/data/models/gold_price_model.dart';
import 'package:retiresmart/GoldPrice/domain/repo/gold_repo.dart';
import 'package:retiresmart/core/rockCode/cash_serves.dart';
import 'package:retiresmart/core/text_core.dart';

class GoldRepoimpl implements GoldRepo {
  final cache = CacheService();

  @override
  Future<Either<Failure, GoldPriceModel>> getGoldPricesFromApi() async {
    final response = await GoldApi().getGoldPrices();

    await response.fold(
      (failure) async {
        // Just log or handle failure if needed
      },
      (model) async {
        try {
          await cache.saveToCash(
            key: TextCore.goldPriceKey,
            data: model.toJson(),
          );
          print("get from api--repoimpl and saved to cash");
        } catch (e) {
          print("there are problem with cash--repoimpl ${e.toString()}");
        }
      },
    );

    return response;
  }

  @override
  Future<Either<Failure, GoldPriceModel>> getGoldPricesFromCache() async {
    final response = await GoldApi().getGoldPricesFromCash();
    print("get from cash--repoimpl");
    return response;
  }
}
