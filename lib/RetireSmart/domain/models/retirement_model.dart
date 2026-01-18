class RetirementInput {
  final int currentAge;
  final double monthlyExpenses;
  final double currentSavings;

  RetirementInput({
    required this.currentAge,
    required this.monthlyExpenses,
    required this.currentSavings,
  });
}

class RetirementResult {
  final double monthlySavingsNeeded;
  final double requiredNestEgg;
  final double
  futureMonthlyExpenses; // Calculated from future annual / 12 for display context if needed
  final int yearsToRetirement;

  RetirementResult({
    required this.monthlySavingsNeeded,
    required this.requiredNestEgg,
    required this.futureMonthlyExpenses,
    required this.yearsToRetirement,
  });
}
