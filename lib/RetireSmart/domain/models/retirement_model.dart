enum RiskLevel { high, medium, low }

class RetirementInput {
  final int currentAge;
  final int retirementAge;
  final double monthlyExpenses;
  final double currentSavings;
  final double mainMonthlyIncome;
  final double? additionalMonthlyIncome;
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

class RetirementResult {
  final double monthlySavingsNeeded;
  final double requiredNestEgg;
  final double futureMonthlyExpenses;
  final int yearsToRetirement;
  final double availableSavings;
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
