// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retirement_entities.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RetirementInputAdapter extends TypeAdapter<RetirementInput> {
  @override
  final int typeId = 3;

  @override
  RetirementInput read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RetirementInput(
      currentAge: fields[0] as int,
      retirementAge: fields[1] as int,
      monthlyExpenses: fields[2] as double,
      currentSavings: fields[3] as double,
      mainMonthlyIncome: fields[4] as double,
      additionalMonthlyIncome: fields[5] as double?,
      riskLevel: fields[6] as RiskLevel,
    );
  }

  @override
  void write(BinaryWriter writer, RetirementInput obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.currentAge)
      ..writeByte(1)
      ..write(obj.retirementAge)
      ..writeByte(2)
      ..write(obj.monthlyExpenses)
      ..writeByte(3)
      ..write(obj.currentSavings)
      ..writeByte(4)
      ..write(obj.mainMonthlyIncome)
      ..writeByte(5)
      ..write(obj.additionalMonthlyIncome)
      ..writeByte(6)
      ..write(obj.riskLevel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RetirementInputAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RetirementResultAdapter extends TypeAdapter<RetirementResult> {
  @override
  final int typeId = 4;

  @override
  RetirementResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RetirementResult(
      inflationModel: fields[6] as InflationModel,
      monthlySavingsNeeded: fields[0] as double,
      requiredNestEgg: fields[1] as double,
      futureMonthlyExpenses: fields[2] as double,
      yearsToRetirement: fields[3] as int,
      availableSavings: fields[4] as double,
      investmentDistribution: (fields[5] as Map).cast<String, double>(),
    );
  }

  @override
  void write(BinaryWriter writer, RetirementResult obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.monthlySavingsNeeded)
      ..writeByte(1)
      ..write(obj.requiredNestEgg)
      ..writeByte(2)
      ..write(obj.futureMonthlyExpenses)
      ..writeByte(3)
      ..write(obj.yearsToRetirement)
      ..writeByte(4)
      ..write(obj.availableSavings)
      ..writeByte(5)
      ..write(obj.investmentDistribution)
      ..writeByte(6)
      ..write(obj.inflationModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RetirementResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RiskLevelAdapter extends TypeAdapter<RiskLevel> {
  @override
  final int typeId = 2;

  @override
  RiskLevel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RiskLevel.high;
      case 1:
        return RiskLevel.medium;
      case 2:
        return RiskLevel.low;
      default:
        return RiskLevel.high;
    }
  }

  @override
  void write(BinaryWriter writer, RiskLevel obj) {
    switch (obj) {
      case RiskLevel.high:
        writer.writeByte(0);
        break;
      case RiskLevel.medium:
        writer.writeByte(1);
        break;
      case RiskLevel.low:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RiskLevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
