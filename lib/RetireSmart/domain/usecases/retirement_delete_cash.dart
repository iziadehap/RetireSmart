import 'package:retiresmart/core/rockCode/cash_serves.dart';
import 'package:retiresmart/core/text_core.dart';

class RetirementDeleteCash {
  final cache = CacheService();

  Future<void> delete() async {
    await cache.removeFromCash(TextCore.retirementResultKey);
  }
}
