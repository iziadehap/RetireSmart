// this to generate X-Timestamp and X-Signature headers those required to call our EPs

// dart dio

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:retiresmart/GoldPrice/data/models/gold_price_failure_model.dart';
import 'package:retiresmart/core/api/get_headers.dart';
import 'package:retiresmart/GoldPrice/data/models/gold_price_model.dart';
import 'package:retiresmart/core/rockCode/cash_serves.dart';
import 'package:retiresmart/core/text_core.dart';

class GoldApi {
  static const _baseUrl =
      'https://egypt-gold-scraper.egypt-gold-scraper.workers.dev';
  final Dio _dio = Dio();

  final cache = CacheService();

  Future<Either<Failure, GoldPriceModel>> getGoldPrices() async {
    try {
      final response = await _dio.get(
        '$_baseUrl/',
        options: Options(headers: ApiAuth.getAuthHeaders()),
      );
      final goldPriceModel = GoldPriceModel.fromJson(response.data, false);
      print("get from api--datasources");
      return Right(goldPriceModel);
    } catch (e) {
      return Left(
        Failure('there is problem with your request', FailureType.requestError),
      );
    }
  }

  Future<Either<Failure, GoldPriceModel>> getGoldPricesFromCash() async {
    try {
      final cachedData = cache.getFromCash(TextCore.goldPriceKey);
      print("get from cash--datasources");
      print(cachedData.runtimeType);
      if (cachedData == null) {
        return Left(Failure('its first open app', FailureType.internetError));
      }

      if (cachedData is GoldPriceModel) {
        print("get from cash (object)");
        return Right(cachedData);
      }

      if (cachedData is Map) {
        final goldPriceModel = GoldPriceModel.fromJson(
          _deepCastMap(cachedData),
          true,
        );
        print("get from cash (map)");
        return Right(goldPriceModel);
      }

      return Left(Failure('Invalid cache format', FailureType.cashError));
    } catch (e) {
      print("Error reading from cash: $e");
      return Left(Failure('there is problem with cash', FailureType.cashError));
    }
  }

  Map<String, dynamic> _deepCastMap(Map<dynamic, dynamic> map) {
    return map.map((key, value) {
      if (value is Map) {
        return MapEntry(key.toString(), _deepCastMap(value));
      }
      return MapEntry(key.toString(), value);
    });
  }
}
