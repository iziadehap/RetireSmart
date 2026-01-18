import 'dart:math';
import '../../domain/models/retirement_model.dart';

class RetirementCalculator {
  static const int retirementAge = 60;
  static const double annualInflationRate = 0.10; // 10%
  static const double annualInvestmentReturn = 0.12; // 12%
  static const double safeWithdrawalRate = 0.04; // 4%

  static RetirementResult calculate(RetirementInput input) {
    if (input.currentAge >= retirementAge) {
      throw Exception("Age must be less than $retirementAge");
    }

    final int yearsToRetirement = retirementAge - input.currentAge;

    // 1. Future Annual Expenses
    // Formula: PV * (1 + inflation)^years * 12 months
    final double futureAnnualExpenses =
        (input.monthlyExpenses * 12) *
        pow(1 + annualInflationRate, yearsToRetirement);

    // 2. Required Nest Egg at 60
    final double requiredNestEgg = futureAnnualExpenses / safeWithdrawalRate;

    // 3. Monthly Savings Needed (Future Value of Annuity with initial lump sum)

    // Monthly return rate
    final double monthlyReturnRate = annualInvestmentReturn / 12;
    final int monthsToRetirement = yearsToRetirement * 12;

    // FV of current savings
    // Formula: PV * (1 + r)^n
    final double fvCurrentSavings =
        input.currentSavings * pow(1 + monthlyReturnRate, monthsToRetirement);

    // Gap to fill
    final double gapToFill = requiredNestEgg - fvCurrentSavings;

    double monthlySavingsNeeded = 0;
    if (gapToFill > 0) {
      // Periodic Payment Formula (PMT) for FV
      // FV = PMT * [ ((1 + r)^n - 1) / r ]
      // PMT = FV * r / ((1 + r)^n - 1)

      final double compoundFactor = pow(
        1 + monthlyReturnRate,
        monthsToRetirement,
      ).toDouble();
      monthlySavingsNeeded =
          gapToFill * monthlyReturnRate / (compoundFactor - 1);
    }

    return RetirementResult(
      monthlySavingsNeeded: monthlySavingsNeeded > 0 ? monthlySavingsNeeded : 0,
      requiredNestEgg: requiredNestEgg,
      futureMonthlyExpenses: futureAnnualExpenses / 12,
      yearsToRetirement: yearsToRetirement,
    );
  }
}
