import 'package:hive/hive.dart';

part 'gold_price_model.g.dart';

@HiveType(typeId: 0)
class GoldPriceModel {
  @HiveField(0)
  final PriceDetails gold24k;
  @HiveField(1)
  final PriceDetails gold21k;
  @HiveField(2)
  final PriceDetails gold18k;
  @HiveField(3)
  final String currency;
  @HiveField(4)
  final String unit;
  @HiveField(5)
  final String source;
  @HiveField(6)
  final DateTime lastUpdated;

  GoldPriceModel({
    required this.gold24k,
    required this.gold21k,
    required this.gold18k,
    required this.currency,
    required this.unit,
    required this.source,
    required this.lastUpdated,
  });

  factory GoldPriceModel.fromJson(Map<String, dynamic> json) {
    return GoldPriceModel(
      gold24k: PriceDetails.fromJson(json['gold_24k']),
      gold21k: PriceDetails.fromJson(json['gold_21k']),
      gold18k: PriceDetails.fromJson(json['gold_18k']),
      currency: json['currency'],
      unit: json['unit'],
      source: json['source'],
      lastUpdated: DateTime.parse(json['last_updated']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gold_24k': gold24k.toJson(),
      'gold_21k': gold21k.toJson(),
      'gold_18k': gold18k.toJson(),
      'currency': currency,
      'unit': unit,
      'source': source,
      'last_updated': lastUpdated.toIso8601String(),
    };
  }
}

@HiveType(typeId: 1)
class PriceDetails {
  @HiveField(0)
  final double buy;
  @HiveField(1)
  final double sell;

  PriceDetails({required this.buy, required this.sell});

  factory PriceDetails.fromJson(Map<String, dynamic> json) {
    return PriceDetails(
      buy: (json['buy'] as num).toDouble(),
      sell: (json['sell'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'buy': buy, 'sell': sell};
  }
}
