import 'package:retiresmart/GoldPrice/data/models/gold_price_model.dart';
import 'package:retiresmart/RetireSmart/domain/entities/retirement_entities.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CacheService {
  // We use a constant for the box name to avoid typos

  static const String _boxName = 'app_cache';

  /// Initialize Hive (Call this in main.dart)
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(GoldPriceModelAdapter());
    Hive.registerAdapter(PriceDetailsAdapter());
    Hive.registerAdapter(RiskLevelAdapter());
    Hive.registerAdapter(RetirementInputAdapter());
    Hive.registerAdapter(RetirementResultAdapter());
    await Hive.openBox(_boxName);
  }

  /// Save data: saveToCash(key: 'myKey', data: myData)
  Future<void> saveToCash({required String key, required dynamic data}) async {
    final box = Hive.box(_boxName);
    await box.put(key, data);
  }

  /// Get data: getFromCash('myKey')
  dynamic getFromCash(String key) {
    final box = Hive.box(_boxName);
    return box.get(key);
  }

  /// Delete data if needed
  Future<void> removeFromCash(String key) async {
    final box = Hive.box(_boxName);
    await box.delete(key);
  }
}

/* how to use it

//! main.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize your core service
  await CacheService.init(); 

  runApp(const MyApp());
}

//! any where in the app

final cache = CacheService();

// --- SAVING ---
await cache.saveToCash(key: 'user_id', data: 12345);
await cache.saveToCash(key: 'username', data: 'mohamed_dev');

// --- GETTING ---
final id = cache.getFromCash('user_id');
final name = cache.getFromCash('username');

print(name); // Output: mohamed_dev

*/
