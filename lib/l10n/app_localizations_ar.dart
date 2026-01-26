// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'المستشار الذكي للتقاعد';

  @override
  String get step1Title => 'لنبدأ بالأساسيات.';

  @override
  String get currentAgeLabel => 'العمر الحالي';

  @override
  String get targetRetirementAgeLabel => 'سن التقاعد المستهدف';

  @override
  String get incomeExpensesTitle => 'الدخل والمصاريف';

  @override
  String get gapDescription => 'نستخدم هذه المعلومات لحساب الفجوة المالية.';

  @override
  String get monthlyIncomeLabel => 'الدخل الشهري';

  @override
  String get additionalIncomeLabel => 'دخل إضافي (اختياري)';

  @override
  String get monthlyExpensesLabel => 'المصاريف الشهرية';

  @override
  String get assetsStrategyTitle => 'الأصول والإستراتيجية';

  @override
  String get currentSavingsLabel => 'المدخرات الحالية';

  @override
  String get riskAppetiteLabel => 'قابلية المخاطرة';

  @override
  String get backButton => 'رجوع';

  @override
  String get nextButton => 'التالي';

  @override
  String get calculateButton => 'احسب';

  @override
  String get generatePlanButton => 'إنشاء الخطة';

  @override
  String get continueButton => 'متابعة';

  @override
  String get analyzingLabel => 'جاري تحليل مستقبلك المالي';

  @override
  String get pleaseWaitLabel => 'يرجى الانتظار لحظة...';

  @override
  String get blueprintTitle => 'مخططك المالي';

  @override
  String get monthlyTargetLabel => 'الهدف الشهري';

  @override
  String get requiredSavingsLabel => 'المدخرات المطلوبة';

  @override
  String get exceedsIncomeLabel => 'يتجاوز الدخل المتاح';

  @override
  String get withinBudgetLabel => 'ضمن الميزانية';

  @override
  String get nestEggLabel => 'رأس المال المطلوب';

  @override
  String get timelineLabel => 'الجدول الزمني';

  @override
  String get assetAllocationLabel => 'توزيع الأصول';

  @override
  String get createNewPlanButton => 'إنشاء خطة جديدة';

  @override
  String get disclaimerText =>
      'توقعات الذكاء الاصطناعي • تقديرات بناءً على المعطيات الحالية';

  @override
  String get riskHigh => 'مخاطرة عالية';

  @override
  String get riskMedium => 'مخاطرة متوسطة';

  @override
  String get riskLow => 'مخاطرة منخفضة';

  @override
  String get riskHighDesc => 'نمو قوي • تقلبات عالية';

  @override
  String get riskMediumDesc => 'متوازن • نمو معتدل';

  @override
  String get riskLowDesc => 'محافظ • الحفاظ على رأس المال';

  @override
  String get errorValidAges => 'يرجى إدخال أعمار صحيحة.';

  @override
  String get errorNegativeAges => 'لا يمكن أن تكون الأعمار سلبية.';

  @override
  String get errorAgeLogic => 'يجب أن يكون العمر الحالي أقل من سن التقاعد.';

  @override
  String get errorValidAmounts => 'يرجى إدخال مبالغ صحيحة.';

  @override
  String get errorNegativeAmounts => 'لا يمكن للمبالغ أن تكون سلبية.';

  @override
  String get errorValidSavings => 'يرجى إدخال مبلغ ادخار صحيح.';

  @override
  String get errorNegativeSavings => 'لا يمكن للمدخرات أن تكون سلبية.';

  @override
  String get errorGeneric => 'خطأ';

  @override
  String get goldPrices => 'سعر الذهب (live)';

  @override
  String get failedToLoadGoldData => 'فشل في تحميل بيانات الذهب.';

  @override
  String get karatPrices => 'أسعار القيراط (للغرام الواحد)';

  @override
  String get currency => 'العملة';

  @override
  String get unit => 'الوحدة';

  @override
  String get source => 'المصدر';

  @override
  String get lastUpdated => 'آخر تحديث';

  @override
  String get buyPrice => 'سعر الشراء';

  @override
  String get sellPrice => 'سعر البيع';

  @override
  String get buy => 'شراء';

  @override
  String get sell => 'بيع';

  @override
  String get live => 'live';

  @override
  String get welcomeBack => 'مرحبا بعودتك';

  @override
  String get goldInvestment => 'الاستثمار في الذهب';

  @override
  String get retirementPlanning => 'التخطيط للتقاعد';

  @override
  String get retirementPlanningDesc => 'خطط لسنواتك الذهبية بثقة';

  @override
  String get goldInvestmentDesc => 'تتبع أسعار السوق الحية وإدارة محفظتك';

  @override
  String get settings => 'الإعدادات';

  @override
  String get recalculate => 'إعادة الحساب؟';

  @override
  String get resetConfirmation =>
      'هل أنت متأكد من رغبتك في البدء من جديد؟ سيتم فقدان النتائج الحالية.';

  @override
  String get yesReset => 'نعم، إعادة تعيين';

  @override
  String get noCancel => 'لا، إلغاء';

  @override
  String get inflationProjectionLabel => 'توقعات التضخم';
}
