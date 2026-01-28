import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'RetireSmart AI'**
  String get appTitle;

  /// No description provided for @step1Title.
  ///
  /// In en, this message translates to:
  /// **'Let\'s start with the basics.'**
  String get step1Title;

  /// No description provided for @currentAgeLabel.
  ///
  /// In en, this message translates to:
  /// **'Current Age'**
  String get currentAgeLabel;

  /// No description provided for @targetRetirementAgeLabel.
  ///
  /// In en, this message translates to:
  /// **'Target Retirement Age'**
  String get targetRetirementAgeLabel;

  /// No description provided for @incomeExpensesTitle.
  ///
  /// In en, this message translates to:
  /// **'Income & Expenses'**
  String get incomeExpensesTitle;

  /// No description provided for @gapDescription.
  ///
  /// In en, this message translates to:
  /// **'We use this to calculate your gap.'**
  String get gapDescription;

  /// No description provided for @monthlyIncomeLabel.
  ///
  /// In en, this message translates to:
  /// **'Monthly Income'**
  String get monthlyIncomeLabel;

  /// No description provided for @additionalIncomeLabel.
  ///
  /// In en, this message translates to:
  /// **'Additional Income (Optional)'**
  String get additionalIncomeLabel;

  /// No description provided for @monthlyExpensesLabel.
  ///
  /// In en, this message translates to:
  /// **'Monthly Expenses'**
  String get monthlyExpensesLabel;

  /// No description provided for @assetsStrategyTitle.
  ///
  /// In en, this message translates to:
  /// **'Assets & Strategy'**
  String get assetsStrategyTitle;

  /// No description provided for @currentSavingsLabel.
  ///
  /// In en, this message translates to:
  /// **'Current Savings'**
  String get currentSavingsLabel;

  /// No description provided for @riskAppetiteLabel.
  ///
  /// In en, this message translates to:
  /// **'RISK APPETITE'**
  String get riskAppetiteLabel;

  /// No description provided for @backButton.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backButton;

  /// No description provided for @nextButton.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextButton;

  /// No description provided for @calculateButton.
  ///
  /// In en, this message translates to:
  /// **'Calculate'**
  String get calculateButton;

  /// No description provided for @generatePlanButton.
  ///
  /// In en, this message translates to:
  /// **'GENERATE PLAN'**
  String get generatePlanButton;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'CONTINUE'**
  String get continueButton;

  /// No description provided for @analyzingLabel.
  ///
  /// In en, this message translates to:
  /// **'ANALYZING FINANCIAL FUTURE'**
  String get analyzingLabel;

  /// No description provided for @pleaseWaitLabel.
  ///
  /// In en, this message translates to:
  /// **'Please wait moment...'**
  String get pleaseWaitLabel;

  /// No description provided for @blueprintTitle.
  ///
  /// In en, this message translates to:
  /// **'YOUR BLUEPRINT'**
  String get blueprintTitle;

  /// No description provided for @monthlyTargetLabel.
  ///
  /// In en, this message translates to:
  /// **'MONTHLY TARGET'**
  String get monthlyTargetLabel;

  /// No description provided for @requiredSavingsLabel.
  ///
  /// In en, this message translates to:
  /// **'REQUIRED SAVINGS'**
  String get requiredSavingsLabel;

  /// No description provided for @exceedsIncomeLabel.
  ///
  /// In en, this message translates to:
  /// **'Exceeds Available Income'**
  String get exceedsIncomeLabel;

  /// No description provided for @withinBudgetLabel.
  ///
  /// In en, this message translates to:
  /// **'Within Budget'**
  String get withinBudgetLabel;

  /// No description provided for @nestEggLabel.
  ///
  /// In en, this message translates to:
  /// **'NEST EGG'**
  String get nestEggLabel;

  /// No description provided for @timelineLabel.
  ///
  /// In en, this message translates to:
  /// **'TIMELINE'**
  String get timelineLabel;

  /// No description provided for @assetAllocationLabel.
  ///
  /// In en, this message translates to:
  /// **'ASSET ALLOCATION'**
  String get assetAllocationLabel;

  /// No description provided for @createNewPlanButton.
  ///
  /// In en, this message translates to:
  /// **'CREATE NEW PLAN'**
  String get createNewPlanButton;

  /// No description provided for @disclaimerText.
  ///
  /// In en, this message translates to:
  /// **'AI PROJECTION • ESTIMATES BASED ON CURRENT METRICS'**
  String get disclaimerText;

  /// No description provided for @riskHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get riskHigh;

  /// No description provided for @riskMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get riskMedium;

  /// No description provided for @riskLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get riskLow;

  /// No description provided for @riskHighDesc.
  ///
  /// In en, this message translates to:
  /// **'Aggressive Growth • High Volatility'**
  String get riskHighDesc;

  /// No description provided for @riskMediumDesc.
  ///
  /// In en, this message translates to:
  /// **'Balanced • Moderate Growth'**
  String get riskMediumDesc;

  /// No description provided for @riskLowDesc.
  ///
  /// In en, this message translates to:
  /// **'Conservative • Capital Preservation'**
  String get riskLowDesc;

  /// No description provided for @errorValidAges.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid ages.'**
  String get errorValidAges;

  /// No description provided for @errorNegativeAges.
  ///
  /// In en, this message translates to:
  /// **'Ages cannot be negative.'**
  String get errorNegativeAges;

  /// No description provided for @errorAgeLogic.
  ///
  /// In en, this message translates to:
  /// **'Current age must be less than retirement age.'**
  String get errorAgeLogic;

  /// No description provided for @errorValidAmounts.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid amounts.'**
  String get errorValidAmounts;

  /// No description provided for @errorNegativeAmounts.
  ///
  /// In en, this message translates to:
  /// **'Amounts cannot be negative.'**
  String get errorNegativeAmounts;

  /// No description provided for @errorValidSavings.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid savings amount.'**
  String get errorValidSavings;

  /// No description provided for @errorNegativeSavings.
  ///
  /// In en, this message translates to:
  /// **'Savings cannot be negative.'**
  String get errorNegativeSavings;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorGeneric;

  /// No description provided for @goldPrices.
  ///
  /// In en, this message translates to:
  /// **'Gold Prices'**
  String get goldPrices;

  /// No description provided for @failedToLoadGoldData.
  ///
  /// In en, this message translates to:
  /// **'Failed to load gold data.'**
  String get failedToLoadGoldData;

  /// No description provided for @karatPrices.
  ///
  /// In en, this message translates to:
  /// **'KARAT PRICES (PER GRAM)'**
  String get karatPrices;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// No description provided for @unit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get unit;

  /// No description provided for @source.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get source;

  /// No description provided for @lastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last Updated'**
  String get lastUpdated;

  /// No description provided for @buyPrice.
  ///
  /// In en, this message translates to:
  /// **'Buy Price'**
  String get buyPrice;

  /// No description provided for @sellPrice.
  ///
  /// In en, this message translates to:
  /// **'Sell Price'**
  String get sellPrice;

  /// No description provided for @buy.
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get buy;

  /// No description provided for @sell.
  ///
  /// In en, this message translates to:
  /// **'Sell'**
  String get sell;

  /// No description provided for @live.
  ///
  /// In en, this message translates to:
  /// **'LIVE'**
  String get live;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back,'**
  String get welcomeBack;

  /// No description provided for @goldInvestment.
  ///
  /// In en, this message translates to:
  /// **'Gold Investment'**
  String get goldInvestment;

  /// No description provided for @retirementPlanning.
  ///
  /// In en, this message translates to:
  /// **'Retirement Planning'**
  String get retirementPlanning;

  /// No description provided for @retirementPlanningDesc.
  ///
  /// In en, this message translates to:
  /// **'Plan your golden years with confidence'**
  String get retirementPlanningDesc;

  /// No description provided for @goldInvestmentDesc.
  ///
  /// In en, this message translates to:
  /// **'Track live market rates & manage portfolio'**
  String get goldInvestmentDesc;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @recalculate.
  ///
  /// In en, this message translates to:
  /// **'Recalculate?'**
  String get recalculate;

  /// No description provided for @resetConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to start over? Current results will be lost.'**
  String get resetConfirmation;

  /// No description provided for @yesReset.
  ///
  /// In en, this message translates to:
  /// **'Yes, Reset'**
  String get yesReset;

  /// No description provided for @noCancel.
  ///
  /// In en, this message translates to:
  /// **'No, Cancel'**
  String get noCancel;

  /// No description provided for @inflationProjectionLabel.
  ///
  /// In en, this message translates to:
  /// **'Inflation Projection'**
  String get inflationProjectionLabel;

  /// No description provided for @connectionLost.
  ///
  /// In en, this message translates to:
  /// **'Connection Lost'**
  String get connectionLost;

  /// No description provided for @couldntReachTheGoldServers.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t reach the gold servers. Please check your internet connection.'**
  String get couldntReachTheGoldServers;

  /// No description provided for @serverError.
  ///
  /// In en, this message translates to:
  /// **'Server Error'**
  String get serverError;

  /// No description provided for @problemWithTheRequest.
  ///
  /// In en, this message translates to:
  /// **'There was a problem with the request. Please try again later.'**
  String get problemWithTheRequest;

  /// No description provided for @storageError.
  ///
  /// In en, this message translates to:
  /// **'Storage Error'**
  String get storageError;

  /// No description provided for @failedToLoadCachedData.
  ///
  /// In en, this message translates to:
  /// **'Failed to load cached data. Please try refreshing.'**
  String get failedToLoadCachedData;

  /// No description provided for @backOnline.
  ///
  /// In en, this message translates to:
  /// **'BACK ONLINE'**
  String get backOnline;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'TRY AGAIN'**
  String get tryAgain;

  /// No description provided for @lastSeen.
  ///
  /// In en, this message translates to:
  /// **'Last Seen'**
  String get lastSeen;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'You are offline. Showing cached data.'**
  String get offline;

  /// No description provided for @sharePlanMessage.
  ///
  /// In en, this message translates to:
  /// **'Here is my retirement plan from RetireSmart AI!'**
  String get sharePlanMessage;

  /// No description provided for @sharePlanSubject.
  ///
  /// In en, this message translates to:
  /// **'My Retirement Plan'**
  String get sharePlanSubject;

  /// No description provided for @investmentGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'Investment Guide'**
  String get investmentGuideTitle;

  /// No description provided for @thndrGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'Investment Guide via Thndr'**
  String get thndrGuideTitle;

  /// No description provided for @thndrRecommendation.
  ///
  /// In en, this message translates to:
  /// **'Thndr is the recommended app for investing in Egypt – easy and secure'**
  String get thndrRecommendation;

  /// No description provided for @goldSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Gold'**
  String get goldSectionTitle;

  /// No description provided for @goldSectionDesc.
  ///
  /// In en, this message translates to:
  /// **'To invest in gold, buy into a gold fund like \'Thndr Gold Fund\' – it tracks the global gold price.'**
  String get goldSectionDesc;

  /// No description provided for @stocksSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Stocks'**
  String get stocksSectionTitle;

  /// No description provided for @stocksSectionDesc.
  ///
  /// In en, this message translates to:
  /// **'For stocks, buy into an equity fund like \'Thndr Egypt Stock Fund\' – it invests in Egyptian Stock Exchange shares. Expected annual return 10-15% depending on the market.'**
  String get stocksSectionDesc;

  /// No description provided for @certificatesSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Certificates'**
  String get certificatesSectionTitle;

  /// No description provided for @certificatesSectionDesc.
  ///
  /// In en, this message translates to:
  /// **'For certificates, choose bank certificates like \'Thndr Bank Certificates\' – fixed return up to 20%, safe and guaranteed.'**
  String get certificatesSectionDesc;

  /// No description provided for @downloadThndr.
  ///
  /// In en, this message translates to:
  /// **'Download Thndr'**
  String get downloadThndr;

  /// No description provided for @referralMessage.
  ///
  /// In en, this message translates to:
  /// **'Use my referral link to sign up: https://thndr.app.link/iziadehap and you\'ll get a reward, and I\'ll get a commission after your first deposit.'**
  String get referralMessage;

  /// No description provided for @riskQuizPrompt.
  ///
  /// In en, this message translates to:
  /// **'Don\'t know your risk? Try this quiz'**
  String get riskQuizPrompt;

  /// No description provided for @riskQuizTitle.
  ///
  /// In en, this message translates to:
  /// **'Risk Assessment'**
  String get riskQuizTitle;

  /// No description provided for @riskQuizQuestion1.
  ///
  /// In en, this message translates to:
  /// **'When do you plan to start withdrawing your retirement savings?'**
  String get riskQuizQuestion1;

  /// No description provided for @riskQuizQ1Option1.
  ///
  /// In en, this message translates to:
  /// **'In less than 5 years'**
  String get riskQuizQ1Option1;

  /// No description provided for @riskQuizQ1Option2.
  ///
  /// In en, this message translates to:
  /// **'In 5 to 15 years'**
  String get riskQuizQ1Option2;

  /// No description provided for @riskQuizQ1Option3.
  ///
  /// In en, this message translates to:
  /// **'In more than 15 years'**
  String get riskQuizQ1Option3;

  /// No description provided for @riskQuizQuestion2.
  ///
  /// In en, this message translates to:
  /// **'If your investments dropped 20% in value overnight, what would you do?'**
  String get riskQuizQuestion2;

  /// No description provided for @riskQuizQ2Option1.
  ///
  /// In en, this message translates to:
  /// **'Sell everything immediately to protect my remaining money'**
  String get riskQuizQ2Option1;

  /// No description provided for @riskQuizQ2Option2.
  ///
  /// In en, this message translates to:
  /// **'Wait and see if it recovers, but avoid adding more'**
  String get riskQuizQ2Option2;

  /// No description provided for @riskQuizQ2Option3.
  ///
  /// In en, this message translates to:
  /// **'Stay calm or even invest more while prices are low'**
  String get riskQuizQ2Option3;

  /// No description provided for @riskQuizQuestion3.
  ///
  /// In en, this message translates to:
  /// **'What is your primary financial goal for this plan?'**
  String get riskQuizQuestion3;

  /// No description provided for @riskQuizQ3Option1.
  ///
  /// In en, this message translates to:
  /// **'Protecting my initial savings at all costs'**
  String get riskQuizQ3Option1;

  /// No description provided for @riskQuizQ3Option2.
  ///
  /// In en, this message translates to:
  /// **'A balanced growth while keeping risk moderate'**
  String get riskQuizQ3Option2;

  /// No description provided for @riskQuizQ3Option3.
  ///
  /// In en, this message translates to:
  /// **'Maximizing long-term growth even with high volatility'**
  String get riskQuizQ3Option3;

  /// No description provided for @riskQuizQuestion4.
  ///
  /// In en, this message translates to:
  /// **'How would you describe your investment experience?'**
  String get riskQuizQuestion4;

  /// No description provided for @riskQuizQ4Option1.
  ///
  /// In en, this message translates to:
  /// **'Beginner - I am new to investing'**
  String get riskQuizQ4Option1;

  /// No description provided for @riskQuizQ4Option2.
  ///
  /// In en, this message translates to:
  /// **'Intermediate - I understand stocks and bonds'**
  String get riskQuizQ4Option2;

  /// No description provided for @riskQuizQ4Option3.
  ///
  /// In en, this message translates to:
  /// **'Advanced - I follow the markets and manage my portfolio'**
  String get riskQuizQ4Option3;

  /// No description provided for @riskQuizResultLow.
  ///
  /// In en, this message translates to:
  /// **'Your results suggest a CONSERVATIVE risk profile.'**
  String get riskQuizResultLow;

  /// No description provided for @riskQuizResultMedium.
  ///
  /// In en, this message translates to:
  /// **'Your results suggest a BALANCED risk profile.'**
  String get riskQuizResultMedium;

  /// No description provided for @riskQuizResultHigh.
  ///
  /// In en, this message translates to:
  /// **'Your results suggest an AGGRESSIVE risk profile.'**
  String get riskQuizResultHigh;

  /// No description provided for @setRiskLevelButton.
  ///
  /// In en, this message translates to:
  /// **'SET RISK LEVEL'**
  String get setRiskLevelButton;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Plan Your Future'**
  String get onboardingTitle1;

  /// No description provided for @onboardingDesc1.
  ///
  /// In en, this message translates to:
  /// **'Take control of your retirement with AI-powered financial projections.'**
  String get onboardingDesc1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Track Gold Prices'**
  String get onboardingTitle2;

  /// No description provided for @onboardingDesc2.
  ///
  /// In en, this message translates to:
  /// **'Stay updated with live gold market rates and investment opportunities.'**
  String get onboardingDesc2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Localized Experience'**
  String get onboardingTitle3;

  /// No description provided for @onboardingDesc3.
  ///
  /// In en, this message translates to:
  /// **'Access all features in both Arabic and English tailored for your needs.'**
  String get onboardingDesc3;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
