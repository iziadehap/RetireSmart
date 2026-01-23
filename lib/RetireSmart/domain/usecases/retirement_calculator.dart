import 'dart:math';
import '../../domain/models/retirement_model.dart';

class RetirementCalculator {
  static const double annualInflationRate = 0.105; // 10.5%
  static const double safeWithdrawalRate = 0.04; // 4%

  static RetirementResult calculate(RetirementInput input) {
    if (input.currentAge >= input.retirementAge) {
      throw Exception("Current age must be less than retirement age");
    }

    final int yearsToRetirement = input.retirementAge - input.currentAge;

    // Determine annual investment return based on risk
    double annualInvestmentReturn;
    Map<String, double> distribution;

    switch (input.riskLevel) {
      case RiskLevel.high:
        annualInvestmentReturn = 0.15;
        distribution = {'Stocks': 0.70, 'Gold': 0.20, 'Certificates': 0.10};
        break;
      case RiskLevel.medium:
        annualInvestmentReturn = 0.12;
        distribution = {'Stocks': 0.50, 'Gold': 0.30, 'Certificates': 0.20};
        break;
      case RiskLevel.low:
        annualInvestmentReturn = 0.08;
        distribution = {'Stocks': 0.20, 'Gold': 0.30, 'Certificates': 0.50};
        break;
    }

    // 1. Future Annual Expenses
    // Formula: PV * (1 + inflation)^years * 12 months
    final double futureAnnualExpenses =
        (input.monthlyExpenses * 12) *
        pow(1 + annualInflationRate, yearsToRetirement);

    // 2. Required Nest Egg
    final double requiredNestEgg = futureAnnualExpenses / safeWithdrawalRate;

    // 3. Monthly Savings Needed (Future Value of Annuity)

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

    // Calculate available savings
    final double totalIncome =
        input.mainMonthlyIncome + (input.additionalMonthlyIncome ?? 0);
    final double availableSavings = totalIncome - input.monthlyExpenses;

    return RetirementResult(
      monthlySavingsNeeded: monthlySavingsNeeded > 0 ? monthlySavingsNeeded : 0,
      requiredNestEgg: requiredNestEgg,
      futureMonthlyExpenses: futureAnnualExpenses / 12,
      yearsToRetirement: yearsToRetirement,
      availableSavings: availableSavings,
      investmentDistribution: distribution,
    );
  }
}
