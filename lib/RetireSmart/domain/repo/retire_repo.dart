import 'package:retiresmart/RetireSmart/data/models/inflation_model.dart';

abstract class RetireRepo {
  Future<InflationModel> getInflation({
    int years = 20,
    String risk = 'medium',
  });
}