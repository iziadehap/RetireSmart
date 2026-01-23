import 'package:retiresmart/RetireSmart/data/dataSources/retire_dataSources.dart';
import 'package:retiresmart/RetireSmart/data/models/inflation_model.dart';
import 'package:retiresmart/RetireSmart/domain/repo/retire_repo.dart';

class RetireRepoImpl implements RetireRepo {
  final RetireDataSources _retireDataSources;
  RetireRepoImpl(this._retireDataSources);
  @override
  Future<InflationModel> getInflation({
    int years = 20,
    String risk = 'medium',
  }) {
    return _retireDataSources.getInflation(years: years, risk: risk);
  }
}