import 'package:retiresmart/RetireSmart/data/dataSources/retire_dataSources.dart';
import 'package:retiresmart/RetireSmart/data/models/inflation_model.dart';
import 'package:retiresmart/RetireSmart/domain/entities/retirement_entities.dart';
import 'package:retiresmart/RetireSmart/domain/repo/retire_repo.dart';
import 'package:retiresmart/core/rockCode/cash_serves.dart';
import 'package:retiresmart/core/text_core.dart';

class RetireRepoImpl implements RetireRepo {
  final cache = CacheService();

  final RetireDataSources _retireDataSources;
  RetireRepoImpl(this._retireDataSources);
  @override
  Future<InflationModel> getInflation({
    int years = 20,
    String risk = 'medium',
  }) {
    return _retireDataSources.getInflation(years: years, risk: risk);
  }

  @override
  Future<bool> saveResult(
    RetirementResult result,
    RetirementInput input,
  ) async {
    final data = {'result': result, 'input': input};

    print('save result to cache ===================');

    await cache.saveToCash(key: TextCore.retirementResultKey, data: data);

    return true;
  }

  @override
  Future<Map<dynamic, dynamic>?> getFromCache() async {
    final data = await cache.getFromCash(TextCore.retirementResultKey);
    print('get from cache ${data.runtimeType} ===================');
    if (data != null) {
      return data;
    }
    return null;
  }
}
