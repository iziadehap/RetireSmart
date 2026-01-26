import 'package:retiresmart/RetireSmart/data/models/inflation_model.dart';
import 'package:retiresmart/RetireSmart/domain/entities/retirement_entities.dart';

abstract class RetireRepo {
  Future<InflationModel> getInflation({
    int years = 20,
    String risk = 'medium',
  });
  Future<bool> saveResult(RetirementResult result, InflationModel inflationModel);
  Future<Map<dynamic, dynamic>?> getFromCache();
}