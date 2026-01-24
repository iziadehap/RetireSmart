// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `RetireSmart AI`
  String get appTitle {
    return Intl.message('RetireSmart AI', name: 'appTitle', desc: '', args: []);
  }

  /// `Let's start with the basics.`
  String get step1Title {
    return Intl.message(
      'Let\'s start with the basics.',
      name: 'step1Title',
      desc: '',
      args: [],
    );
  }

  /// `Current Age`
  String get currentAgeLabel {
    return Intl.message(
      'Current Age',
      name: 'currentAgeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Target Retirement Age`
  String get targetRetirementAgeLabel {
    return Intl.message(
      'Target Retirement Age',
      name: 'targetRetirementAgeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Income & Expenses`
  String get incomeExpensesTitle {
    return Intl.message(
      'Income & Expenses',
      name: 'incomeExpensesTitle',
      desc: '',
      args: [],
    );
  }

  /// `We use this to calculate your gap.`
  String get gapDescription {
    return Intl.message(
      'We use this to calculate your gap.',
      name: 'gapDescription',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Income`
  String get monthlyIncomeLabel {
    return Intl.message(
      'Monthly Income',
      name: 'monthlyIncomeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Additional Income (Optional)`
  String get additionalIncomeLabel {
    return Intl.message(
      'Additional Income (Optional)',
      name: 'additionalIncomeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Expenses`
  String get monthlyExpensesLabel {
    return Intl.message(
      'Monthly Expenses',
      name: 'monthlyExpensesLabel',
      desc: '',
      args: [],
    );
  }

  /// `Assets & Strategy`
  String get assetsStrategyTitle {
    return Intl.message(
      'Assets & Strategy',
      name: 'assetsStrategyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Current Savings`
  String get currentSavingsLabel {
    return Intl.message(
      'Current Savings',
      name: 'currentSavingsLabel',
      desc: '',
      args: [],
    );
  }

  /// `RISK APPETITE`
  String get riskAppetiteLabel {
    return Intl.message(
      'RISK APPETITE',
      name: 'riskAppetiteLabel',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get backButton {
    return Intl.message('Back', name: 'backButton', desc: '', args: []);
  }

  /// `Next`
  String get nextButton {
    return Intl.message('Next', name: 'nextButton', desc: '', args: []);
  }

  /// `Calculate`
  String get calculateButton {
    return Intl.message(
      'Calculate',
      name: 'calculateButton',
      desc: '',
      args: [],
    );
  }

  /// `GENERATE PLAN`
  String get generatePlanButton {
    return Intl.message(
      'GENERATE PLAN',
      name: 'generatePlanButton',
      desc: '',
      args: [],
    );
  }

  /// `CONTINUE`
  String get continueButton {
    return Intl.message('CONTINUE', name: 'continueButton', desc: '', args: []);
  }

  /// `ANALYZING FINANCIAL FUTURE`
  String get analyzingLabel {
    return Intl.message(
      'ANALYZING FINANCIAL FUTURE',
      name: 'analyzingLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please wait moment...`
  String get pleaseWaitLabel {
    return Intl.message(
      'Please wait moment...',
      name: 'pleaseWaitLabel',
      desc: '',
      args: [],
    );
  }

  /// `YOUR BLUEPRINT`
  String get blueprintTitle {
    return Intl.message(
      'YOUR BLUEPRINT',
      name: 'blueprintTitle',
      desc: '',
      args: [],
    );
  }

  /// `MONTHLY TARGET`
  String get monthlyTargetLabel {
    return Intl.message(
      'MONTHLY TARGET',
      name: 'monthlyTargetLabel',
      desc: '',
      args: [],
    );
  }

  /// `REQUIRED SAVINGS`
  String get requiredSavingsLabel {
    return Intl.message(
      'REQUIRED SAVINGS',
      name: 'requiredSavingsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Exceeds Available Income`
  String get exceedsIncomeLabel {
    return Intl.message(
      'Exceeds Available Income',
      name: 'exceedsIncomeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Within Budget`
  String get withinBudgetLabel {
    return Intl.message(
      'Within Budget',
      name: 'withinBudgetLabel',
      desc: '',
      args: [],
    );
  }

  /// `NEST EGG`
  String get nestEggLabel {
    return Intl.message('NEST EGG', name: 'nestEggLabel', desc: '', args: []);
  }

  /// `TIMELINE`
  String get timelineLabel {
    return Intl.message('TIMELINE', name: 'timelineLabel', desc: '', args: []);
  }

  /// `ASSET ALLOCATION`
  String get assetAllocationLabel {
    return Intl.message(
      'ASSET ALLOCATION',
      name: 'assetAllocationLabel',
      desc: '',
      args: [],
    );
  }

  /// `CREATE NEW PLAN`
  String get createNewPlanButton {
    return Intl.message(
      'CREATE NEW PLAN',
      name: 'createNewPlanButton',
      desc: '',
      args: [],
    );
  }

  /// `AI PROJECTION • ESTIMATES BASED ON CURRENT METRICS`
  String get disclaimerText {
    return Intl.message(
      'AI PROJECTION • ESTIMATES BASED ON CURRENT METRICS',
      name: 'disclaimerText',
      desc: '',
      args: [],
    );
  }

  /// `High`
  String get riskHigh {
    return Intl.message('High', name: 'riskHigh', desc: '', args: []);
  }

  /// `Medium`
  String get riskMedium {
    return Intl.message('Medium', name: 'riskMedium', desc: '', args: []);
  }

  /// `Low`
  String get riskLow {
    return Intl.message('Low', name: 'riskLow', desc: '', args: []);
  }

  /// `Aggressive Growth • High Volatility`
  String get riskHighDesc {
    return Intl.message(
      'Aggressive Growth • High Volatility',
      name: 'riskHighDesc',
      desc: '',
      args: [],
    );
  }

  /// `Balanced • Moderate Growth`
  String get riskMediumDesc {
    return Intl.message(
      'Balanced • Moderate Growth',
      name: 'riskMediumDesc',
      desc: '',
      args: [],
    );
  }

  /// `Conservative • Capital Preservation`
  String get riskLowDesc {
    return Intl.message(
      'Conservative • Capital Preservation',
      name: 'riskLowDesc',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid ages.`
  String get errorValidAges {
    return Intl.message(
      'Please enter valid ages.',
      name: 'errorValidAges',
      desc: '',
      args: [],
    );
  }

  /// `Ages cannot be negative.`
  String get errorNegativeAges {
    return Intl.message(
      'Ages cannot be negative.',
      name: 'errorNegativeAges',
      desc: '',
      args: [],
    );
  }

  /// `Current age must be less than retirement age.`
  String get errorAgeLogic {
    return Intl.message(
      'Current age must be less than retirement age.',
      name: 'errorAgeLogic',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid amounts.`
  String get errorValidAmounts {
    return Intl.message(
      'Please enter valid amounts.',
      name: 'errorValidAmounts',
      desc: '',
      args: [],
    );
  }

  /// `Amounts cannot be negative.`
  String get errorNegativeAmounts {
    return Intl.message(
      'Amounts cannot be negative.',
      name: 'errorNegativeAmounts',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid savings amount.`
  String get errorValidSavings {
    return Intl.message(
      'Please enter valid savings amount.',
      name: 'errorValidSavings',
      desc: '',
      args: [],
    );
  }

  /// `Savings cannot be negative.`
  String get errorNegativeSavings {
    return Intl.message(
      'Savings cannot be negative.',
      name: 'errorNegativeSavings',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get errorGeneric {
    return Intl.message('Error', name: 'errorGeneric', desc: '', args: []);
  }

  /// `Gold Prices (Live)`
  String get goldPrices {
    return Intl.message(
      'Gold Prices (Live)',
      name: 'goldPrices',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load gold data.`
  String get failedToLoadGoldData {
    return Intl.message(
      'Failed to load gold data.',
      name: 'failedToLoadGoldData',
      desc: '',
      args: [],
    );
  }

  /// `KARAT PRICES (PER GRAM)`
  String get karatPrices {
    return Intl.message(
      'KARAT PRICES (PER GRAM)',
      name: 'karatPrices',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currency {
    return Intl.message('Currency', name: 'currency', desc: '', args: []);
  }

  /// `Unit`
  String get unit {
    return Intl.message('Unit', name: 'unit', desc: '', args: []);
  }

  /// `Source`
  String get source {
    return Intl.message('Source', name: 'source', desc: '', args: []);
  }

  /// `Last Updated`
  String get lastUpdated {
    return Intl.message(
      'Last Updated',
      name: 'lastUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Buy Price`
  String get buyPrice {
    return Intl.message('Buy Price', name: 'buyPrice', desc: '', args: []);
  }

  /// `Sell Price`
  String get sellPrice {
    return Intl.message('Sell Price', name: 'sellPrice', desc: '', args: []);
  }

  /// `Buy`
  String get buy {
    return Intl.message('Buy', name: 'buy', desc: '', args: []);
  }

  /// `Sell`
  String get sell {
    return Intl.message('Sell', name: 'sell', desc: '', args: []);
  }

  /// `LIVE`
  String get live {
    return Intl.message('LIVE', name: 'live', desc: '', args: []);
  }

  /// `Welcome back,`
  String get welcomeBack {
    return Intl.message(
      'Welcome back,',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Gold Investment`
  String get goldInvestment {
    return Intl.message(
      'Gold Investment',
      name: 'goldInvestment',
      desc: '',
      args: [],
    );
  }

  /// `Retirement Planning`
  String get retirementPlanning {
    return Intl.message(
      'Retirement Planning',
      name: 'retirementPlanning',
      desc: '',
      args: [],
    );
  }

  /// `Plan your golden years with confidence`
  String get retirementPlanningDesc {
    return Intl.message(
      'Plan your golden years with confidence',
      name: 'retirementPlanningDesc',
      desc: '',
      args: [],
    );
  }

  /// `Track live market rates & manage portfolio`
  String get goldInvestmentDesc {
    return Intl.message(
      'Track live market rates & manage portfolio',
      name: 'goldInvestmentDesc',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Recalculate?`
  String get recalculate {
    return Intl.message(
      'Recalculate?',
      name: 'recalculate',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to start over? Current results will be lost.`
  String get resetConfirmation {
    return Intl.message(
      'Are you sure you want to start over? Current results will be lost.',
      name: 'resetConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Yes, Reset`
  String get yesReset {
    return Intl.message('Yes, Reset', name: 'yesReset', desc: '', args: []);
  }

  /// `No, Cancel`
  String get noCancel {
    return Intl.message('No, Cancel', name: 'noCancel', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
