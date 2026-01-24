// this to generate X-Timestamp and X-Signature headers those required to call our EPs

// dart dio

import 'package:dio/dio.dart';
import 'package:retiresmart/core/api/get_headers.dart';
import 'package:retiresmart/GoldPrice/data/models/gold_price_model.dart';

class GoldApi {
  static const _baseUrl =
      'https://egypt-gold-scraper.egypt-gold-scraper.workers.dev';
  final Dio _dio = Dio();

  Future<GoldPriceModel> getGoldPrices() async {
    final response = await _dio.get(
      '$_baseUrl/',
      options: Options(headers: ApiAuth.getAuthHeaders()),
    );
    print('gold price response is ');
    print(response.data);
    // convert response to GoldPriceModel
    final goldPriceModel = GoldPriceModel.fromJson(response.data);
    return goldPriceModel;
  }

  // Future<Map<String, dynamic>> getInflation({
  //   int years = 20,
  //   String risk = 'medium',
  // }) async {
  //   final response = await _dio.get(
  //     '$_baseUrl/estimate-inflation',
  //     queryParameters: {'years': years, 'risk': risk},
  //     options: Options(headers: ApiAuth.getAuthHeaders()),
  //   );
  //   return response.data;
  // }
}
