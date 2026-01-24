import 'dart:math';
import 'package:retiresmart/RetireSmart/data/models/inflation_model.dart';
import 'package:retiresmart/RetireSmart/domain/repo/retire_repo.dart';
import '../entities/retirement_entities.dart';

class RetirementCalculator {
  static Future<RetirementResult> calculate(
    RetirementInput input,
    RetireRepo repo,
  ) async {
    final getfromCache = await repo.getFromCache();

    if (getfromCache != null) {
      print('find result and go to result screen now 1===================');
      // return cached result
      if (input == getfromCache['input']) {
        print('find result and go to result screen now 2===================');
        return getfromCache['result'];
      }
    }

    final InflationModel inflationRate = await repo.getInflation();

    // No need for average anymore; we'll use year-by-year in startCalculation
    double safeWithdrawalRate = 0.04; // 4%

    final RetirementResult result = _startCalculation(
      input: input,
      safeWithdrawalRate: safeWithdrawalRate,
      inflationRate: inflationRate, // Pass the full model
    );

    // save result to cache
    await repo.saveResult(result, input);
    print('result get form api ===================');

    return result;
  }

  // calculate

  static RetirementResult _startCalculation({
    required RetirementInput input,
    required double safeWithdrawalRate,
    required InflationModel inflationRate, // Added to use year-by-year
  }) {
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

    // 1. Future Annual Expenses - Now using year-by-year inflation for more accuracy
    double futureAnnualExpenses = input.monthlyExpenses * 12;

    if (inflationRate.estimates != null &&
        inflationRate.estimates!.isNotEmpty) {
      // Loop through each year's inflation rate
      for (var estimate in inflationRate.estimates!) {
        if (estimate.inflation != null) {
          futureAnnualExpenses *= (1 + estimate.inflation!);
        }
      }
    } else {
      // Fallback to average if no estimates (calculate average here if needed)
      final double fallbackAverage = _calculateAverageInflationRate(
        inflationRate,
      );
      futureAnnualExpenses *= pow(1 + fallbackAverage, yearsToRetirement);
    }

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
    // last step
    final result = RetirementResult(
      monthlySavingsNeeded: monthlySavingsNeeded > 0 ? monthlySavingsNeeded : 0,
      requiredNestEgg: requiredNestEgg,
      futureMonthlyExpenses: futureAnnualExpenses / 12,
      yearsToRetirement: yearsToRetirement,
      availableSavings: availableSavings,
      investmentDistribution: distribution,
    );
    return result;
  }

  // Keep this for fallback or average calculation
  static double _calculateAverageInflationRate(InflationModel inflationRate) {
    if (inflationRate.estimates == null || inflationRate.estimates!.isEmpty) {
      return 0;
    }
    double sum = 0;
    int count = 0;
    for (int i = 0; i < inflationRate.estimates!.length; i++) {
      if (inflationRate.estimates![i].inflation != null) {
        sum += inflationRate.estimates![i].inflation!;
        count++;
      }
    }

    if (count == 0) {
      return 0;
    }

    final averageInflationRate = sum / count;

    return averageInflationRate;
  }
}
