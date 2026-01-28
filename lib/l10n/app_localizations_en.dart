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
  String get goldPrices => 'Gold Prices';

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

  @override
  String get inflationProjectionLabel => 'Inflation Projection';

  @override
  String get connectionLost => 'Connection Lost';

  @override
  String get couldntReachTheGoldServers =>
      'We couldn\'t reach the gold servers. Please check your internet connection.';

  @override
  String get serverError => 'Server Error';

  @override
  String get problemWithTheRequest =>
      'There was a problem with the request. Please try again later.';

  @override
  String get storageError => 'Storage Error';

  @override
  String get failedToLoadCachedData =>
      'Failed to load cached data. Please try refreshing.';

  @override
  String get backOnline => 'BACK ONLINE';

  @override
  String get tryAgain => 'TRY AGAIN';

  @override
  String get lastSeen => 'Last Seen';

  @override
  String get offline => 'You are offline. Showing cached data.';

  @override
  String get sharePlanMessage =>
      'Here is my retirement plan from RetireSmart AI!';

  @override
  String get sharePlanSubject => 'My Retirement Plan';

  @override
  String get investmentGuideTitle => 'Investment Guide';

  @override
  String get thndrGuideTitle => 'Investment Guide via Thndr';

  @override
  String get thndrRecommendation =>
      'Thndr is the recommended app for investing in Egypt – easy and secure';

  @override
  String get goldSectionTitle => 'Gold';

  @override
  String get goldSectionDesc =>
      'To invest in gold, buy into a gold fund like \'Thndr Gold Fund\' – it tracks the global gold price.';

  @override
  String get stocksSectionTitle => 'Stocks';

  @override
  String get stocksSectionDesc =>
      'For stocks, buy into an equity fund like \'Thndr Egypt Stock Fund\' – it invests in Egyptian Stock Exchange shares. Expected annual return 10-15% depending on the market.';

  @override
  String get certificatesSectionTitle => 'Certificates';

  @override
  String get certificatesSectionDesc =>
      'For certificates, choose bank certificates like \'Thndr Bank Certificates\' – fixed return up to 20%, safe and guaranteed.';

  @override
  String get downloadThndr => 'Download Thndr';

  @override
  String get referralMessage =>
      'Use my referral link to sign up: https://thndr.app.link/iziadehap and you\'ll get a reward, and I\'ll get a commission after your first deposit.';

  @override
  String get riskQuizPrompt => 'Don\'t know your risk? Try this quiz';

  @override
  String get riskQuizTitle => 'Risk Assessment';

  @override
  String get riskQuizQuestion1 =>
      'When do you plan to start withdrawing your retirement savings?';

  @override
  String get riskQuizQ1Option1 => 'In less than 5 years';

  @override
  String get riskQuizQ1Option2 => 'In 5 to 15 years';

  @override
  String get riskQuizQ1Option3 => 'In more than 15 years';

  @override
  String get riskQuizQuestion2 =>
      'If your investments dropped 20% in value overnight, what would you do?';

  @override
  String get riskQuizQ2Option1 =>
      'Sell everything immediately to protect my remaining money';

  @override
  String get riskQuizQ2Option2 =>
      'Wait and see if it recovers, but avoid adding more';

  @override
  String get riskQuizQ2Option3 =>
      'Stay calm or even invest more while prices are low';

  @override
  String get riskQuizQuestion3 =>
      'What is your primary financial goal for this plan?';

  @override
  String get riskQuizQ3Option1 => 'Protecting my initial savings at all costs';

  @override
  String get riskQuizQ3Option2 =>
      'A balanced growth while keeping risk moderate';

  @override
  String get riskQuizQ3Option3 =>
      'Maximizing long-term growth even with high volatility';

  @override
  String get riskQuizQuestion4 =>
      'How would you describe your investment experience?';

  @override
  String get riskQuizQ4Option1 => 'Beginner - I am new to investing';

  @override
  String get riskQuizQ4Option2 =>
      'Intermediate - I understand stocks and bonds';

  @override
  String get riskQuizQ4Option3 =>
      'Advanced - I follow the markets and manage my portfolio';

  @override
  String get riskQuizResultLow =>
      'Your results suggest a CONSERVATIVE risk profile.';

  @override
  String get riskQuizResultMedium =>
      'Your results suggest a BALANCED risk profile.';

  @override
  String get riskQuizResultHigh =>
      'Your results suggest an AGGRESSIVE risk profile.';

  @override
  String get setRiskLevelButton => 'SET RISK LEVEL';

  @override
  String get onboardingTitle1 => 'Plan Your Future';

  @override
  String get onboardingDesc1 =>
      'Take control of your retirement with AI-powered financial projections.';

  @override
  String get onboardingTitle2 => 'Track Gold Prices';

  @override
  String get onboardingDesc2 =>
      'Stay updated with live gold market rates and investment opportunities.';

  @override
  String get onboardingTitle3 => 'Localized Experience';

  @override
  String get onboardingDesc3 =>
      'Access all features in both Arabic and English tailored for your needs.';

  @override
  String get getStarted => 'Get Started';

  @override
  String get skip => 'Skip';
}
