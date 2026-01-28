import 'package:dartz/dartz.dart';
import 'package:retiresmart/GoldPrice/data/models/gold_price_failure_model.dart';
import 'package:retiresmart/GoldPrice/data/models/gold_price_model.dart';

abstract class GoldRepo {
  Future<Either<Failure,GoldPriceModel>> getGoldPricesFromApi();
  Future<Either<Failure,GoldPriceModel>> getGoldPricesFromCache();
}
