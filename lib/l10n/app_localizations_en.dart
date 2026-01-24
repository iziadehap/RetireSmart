// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'RetireSmart AI';

  @override
  String get step1Title => 'Let\'s start with the basics.';

  @override
  String get currentAgeLabel => 'Current Age';

  @override
  String get targetRetirementAgeLabel => 'Target Retirement Age';

  @override
  String get incomeExpensesTitle => 'Income & Expenses';

  @override
  String get gapDescription => 'We use this to calculate your gap.';

  @override
  String get monthlyIncomeLabel => 'Monthly Income';

  @override
  String get additionalIncomeLabel => 'Additional Income (Optional)';

  @override
  String get monthlyExpensesLabel => 'Monthly Expenses';

  @override
  String get assetsStrategyTitle => 'Assets & Strategy';

  @override
  String get currentSavingsLabel => 'Current Savings';

  @override
  String get riskAppetiteLabel => 'RISK APPETITE';

  @override
  String get backButton => 'Back';

  @override
  String get nextButton => 'Next';

  @override
  String get calculateButton => 'Calculate';

  @override
  String get generatePlanButton => 'GENERATE PLAN';

  @override
  String get continueButton => 'CONTINUE';

  @override
  String get analyzingLabel => 'ANALYZING FINANCIAL FUTURE';

  @override
  String get pleaseWaitLabel => 'Please wait moment...';

  @override
  String get blueprintTitle => 'YOUR BLUEPRINT';

  @override
  String get monthlyTargetLabel => 'MONTHLY TARGET';

  @override
  String get requiredSavingsLabel => 'REQUIRED SAVINGS';

  @override
  String get exceedsIncomeLabel => 'Exceeds Available Income';

  @override
  String get withinBudgetLabel => 'Within Budget';

  @override
  String get nestEggLabel => 'NEST EGG';

  @override
  String get timelineLabel => 'TIMELINE';

  @override
  String get assetAllocationLabel => 'ASSET ALLOCATION';

  @override
  String get createNewPlanButton => 'CREATE NEW PLAN';

  @override
  String get disclaimerText =>
      'AI PROJECTION • ESTIMATES BASED ON CURRENT METRICS';

  @override
  String get riskHigh => 'High';

  @override
  String get riskMedium => 'Medium';

  @override
  String get riskLow => 'Low';

  @override
  String get riskHighDesc => 'Aggressive Growth • High Volatility';

  @override
  String get riskMediumDesc => 'Balanced • Moderate Growth';

  @override
  String get riskLowDesc => 'Conservative • Capital Preservation';

  @override
  String get errorValidAges => 'Please enter valid ages.';

  @override
  String get errorNegativeAges => 'Ages cannot be negative.';

  @override
  String get errorAgeLogic => 'Current age must be less than retirement age.';

  @override
  String get errorValidAmounts => 'Please enter valid amounts.';

  @override
  String get errorNegativeAmounts => 'Amounts cannot be negative.';

  @override
  String get errorValidSavings => 'Please enter valid savings amount.';

  @override
  String get errorNegativeSavings => 'Savings cannot be negative.';

  @override
  String get errorGeneric => 'Error';

  @override
  String get goldPrices => 'Gold Prices (Live)';

  @override
  String get failedToLoadGoldData => 'Failed to load gold data.';

  @override
  String get karatPrices => 'KARAT PRICES (PER GRAM)';

  @override
  String get currency => 'Currency';

  @override
  String get unit => 'Unit';

  @override
  String get source => 'Source';

  @override
  String get lastUpdated => 'Last Updated';

  @override
  String get buyPrice => 'Buy Price';

  @override
  String get sellPrice => 'Sell Price';

  @override
  String get buy => 'Buy';

  @override
  String get sell => 'Sell';

  @override
  String get live => 'LIVE';

  @override
  String get welcomeBack => 'Welcome back,';

  @override
  String get goldInvestment => 'Gold Investment';

  @override
  String get retirementPlanning => 'Retirement Planning';

  @override
  String get retirementPlanningDesc => 'Plan your golden years with confidence';

  @override
  String get goldInvestmentDesc => 'Track live market rates & manage portfolio';

  @override
  String get settings => 'Settings';

  @override
  String get recalculate => 'Recalculate?';

  @override
  String get resetConfirmation =>
      'Are you sure you want to start over? Current results will be lost.';

  @override
  String get yesReset => 'Yes, Reset';

  @override
  String get noCancel => 'No, Cancel';
}
