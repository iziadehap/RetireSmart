import 'package:hive/hive.dart';

part 'retirement_entities.g.dart';

@HiveType(typeId: 2)
enum RiskLevel {
  @HiveField(0)
  high,
  @HiveField(1)
  medium,
  @HiveField(2)
  low,
}

@HiveType(typeId: 3)
class RetirementInput {
  @HiveField(0)
  final int currentAge;
  @HiveField(1)
  final int retirementAge;
  @HiveField(2)
  final double monthlyExpenses;
  @HiveField(3)
  final double currentSavings;
  @HiveField(4)
  final double mainMonthlyIncome;
  @HiveField(5)
  final double? additionalMonthlyIncome;
  @HiveField(6)
  final RiskLevel riskLevel;

  RetirementInput({
    required this.currentAge,
    required this.retirementAge,
    required this.monthlyExpenses,
    required this.currentSavings,
    required this.mainMonthlyIncome,
    this.additionalMonthlyIncome,
    required this.riskLevel,
  });
}

@HiveType(typeId: 4)
class RetirementResult {
  @HiveField(0)
  final double monthlySavingsNeeded;
  @HiveField(1)
  final double requiredNestEgg;
  @HiveField(2)
  final double futureMonthlyExpenses;
  @HiveField(3)
  final int yearsToRetirement;
  @HiveField(4)
  final double availableSavings;
  @HiveField(5)
  final Map<String, double> investmentDistribution;

  RetirementResult({
    required this.monthlySavingsNeeded,
    required this.requiredNestEgg,
    required this.futureMonthlyExpenses,
    required this.yearsToRetirement,
    required this.availableSavings,
    required this.investmentDistribution,
  });
}
