// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inflation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InflationModelAdapter extends TypeAdapter<InflationModel> {
  @override
  final int typeId = 5;

  @override
  InflationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InflationModel(
      estimates: (fields[0] as List?)?.cast<Estimate>(),
      params: fields[1] as Params?,
      sources: (fields[2] as List?)?.cast<String>(),
      disclaimer: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, InflationModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.estimates)
      ..writeByte(1)
      ..write(obj.params)
      ..writeByte(2)
      ..write(obj.sources)
      ..writeByte(3)
      ..write(obj.disclaimer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InflationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EstimateAdapter extends TypeAdapter<Estimate> {
  @override
  final int typeId = 6;

  @override
  Estimate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Estimate(
      year: fields[0] as int?,
      inflation: fields[1] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Estimate obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.year)
      ..writeByte(1)
      ..write(obj.inflation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EstimateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ParamsAdapter extends TypeAdapter<Params> {
  @override
  final int typeId = 7;

  @override
  Params read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Params(
      years: fields[0] as int?,
      risk: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Params obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.years)
      ..writeByte(1)
      ..write(obj.risk);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParamsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
