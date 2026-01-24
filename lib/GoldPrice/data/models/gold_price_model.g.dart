// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gold_price_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoldPriceModelAdapter extends TypeAdapter<GoldPriceModel> {
  @override
  final int typeId = 0;

  @override
  GoldPriceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GoldPriceModel(
      gold24k: fields[0] as PriceDetails,
      gold21k: fields[1] as PriceDetails,
      gold18k: fields[2] as PriceDetails,
      currency: fields[3] as String,
      unit: fields[4] as String,
      source: fields[5] as String,
      lastUpdated: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, GoldPriceModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.gold24k)
      ..writeByte(1)
      ..write(obj.gold21k)
      ..writeByte(2)
      ..write(obj.gold18k)
      ..writeByte(3)
      ..write(obj.currency)
      ..writeByte(4)
      ..write(obj.unit)
      ..writeByte(5)
      ..write(obj.source)
      ..writeByte(6)
      ..write(obj.lastUpdated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoldPriceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PriceDetailsAdapter extends TypeAdapter<PriceDetails> {
  @override
  final int typeId = 1;

  @override
  PriceDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PriceDetails(
      buy: fields[0] as double,
      sell: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, PriceDetails obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.buy)
      ..writeByte(1)
      ..write(obj.sell);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
