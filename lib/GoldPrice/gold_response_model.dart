class GoldPriceModel {
  final int timestamp;
  final String metal;
  final String currency;
  final String exchange;
  final String symbol;
  final int openTime;
  final double price;
  final double ch;
  final double ask;
  final double bid;
  final double priceGram24k;
  final double priceGram22k;
  final double priceGram21k;
  final double priceGram20k;
  final double priceGram18k;
  final double priceGram16k;
  final double priceGram14k;
  final double priceGram10k;

  GoldPriceModel({
    required this.timestamp,
    required this.metal,
    required this.currency,
    required this.exchange,
    required this.symbol,
    required this.openTime,
    required this.price,
    required this.ch,
    required this.ask,
    required this.bid,
    required this.priceGram24k,
    required this.priceGram22k,
    required this.priceGram21k,
    required this.priceGram20k,
    required this.priceGram18k,
    required this.priceGram16k,
    required this.priceGram14k,
    required this.priceGram10k,
  });

  factory GoldPriceModel.fromJson(Map<String, dynamic> json) {
    return GoldPriceModel(
      timestamp: json['timestamp'],
      metal: json['metal'],
      currency: json['currency'],
      exchange: json['exchange'],
      symbol: json['symbol'],
      openTime: json['open_time'],
      price: (json['price'] as num).toDouble(),
      ch: (json['ch'] as num).toDouble(),
      ask: (json['ask'] as num).toDouble(),
      bid: (json['bid'] as num).toDouble(),
      priceGram24k: (json['price_gram_24k'] as num).toDouble(),
      priceGram22k: (json['price_gram_22k'] as num).toDouble(),
      priceGram21k: (json['price_gram_21k'] as num).toDouble(),
      priceGram20k: (json['price_gram_20k'] as num).toDouble(),
      priceGram18k: (json['price_gram_18k'] as num).toDouble(),
      priceGram16k: (json['price_gram_16k'] as num).toDouble(),
      priceGram14k: (json['price_gram_14k'] as num).toDouble(),
      priceGram10k: (json['price_gram_10k'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp,
      'metal': metal,
      'currency': currency,
      'exchange': exchange,
      'symbol': symbol,
      'open_time': openTime,
      'price': price,
      'ch': ch,
      'ask': ask,
      'bid': bid,
      'price_gram_24k': priceGram24k,
      'price_gram_22k': priceGram22k,
      'price_gram_21k': priceGram21k,
      'price_gram_20k': priceGram20k,
      'price_gram_18k': priceGram18k,
      'price_gram_16k': priceGram16k,
      'price_gram_14k': priceGram14k,
      'price_gram_10k': priceGram10k,
    };
  }
}
