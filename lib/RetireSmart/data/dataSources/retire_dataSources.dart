import 'package:dio/dio.dart';
import 'package:retiresmart/RetireSmart/data/models/inflation_model.dart';
import 'package:retiresmart/core/api/get_headers.dart';

class RetireDataSources {
  static const _baseUrl =
      'https://egypt-gold-scraper.egypt-gold-scraper.workers.dev';
  final Dio _dio = Dio();

  Future<InflationModel> getInflation({
    int years = 20,
    String risk = 'medium',
  }) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/estimate-inflation',
        queryParameters: {'years': years, 'risk': risk},
        options: Options(headers: ApiAuth.getAuthHeaders()),
      );
      return InflationModel.fromJson(response.data);
    } catch (e) {
      print('Error fetching inflation: $e');
      rethrow; // Rethrow so the repository/controller can handle it
    }
  }
}
