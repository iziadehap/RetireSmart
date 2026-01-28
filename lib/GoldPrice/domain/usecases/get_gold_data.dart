import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:retiresmart/GoldPrice/data/models/gold_price_failure_model.dart';
import 'package:retiresmart/GoldPrice/data/models/gold_price_model.dart';
import 'package:retiresmart/GoldPrice/domain/repo/gold_repo.dart';

class GetGoldData {
  final GoldRepo goldRepo;
  GetGoldData({required this.goldRepo});
  Future<Either<Failure, GoldPriceModel>> call() async {
    final bool isConnected = await InternetConnection().hasInternetAccess;
    if (isConnected) {
      print('isConnected');
      return goldRepo.getGoldPricesFromApi();
    } else {
      print('isNotConnected');
      return goldRepo.getGoldPricesFromCache();
    }
  }
}
