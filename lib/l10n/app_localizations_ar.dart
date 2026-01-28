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
  String get goldPrices => 'سعر الذهب';

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

  @override
  String get connectionLost => 'فقد الاتصال';

  @override
  String get couldntReachTheGoldServers =>
      'لا يمكن الوصول إلى خادم الذهب. يرجى التحقق من اتصالك بالإنترنت.';

  @override
  String get serverError => 'خطأ في الخادم';

  @override
  String get problemWithTheRequest =>
      'هناك مشكلة في طلبك. يرجى المحاولة مرة أخرى.';

  @override
  String get storageError => 'خطأ في التخزين';

  @override
  String get failedToLoadCachedData =>
      'فشل في تحميل البيانات المخزنة. يرجى المحاولة مرة أخرى.';

  @override
  String get backOnline => 'تم الاتصال بالإنترنت';

  @override
  String get tryAgain => 'حاول مرة أخرى';

  @override
  String get lastSeen => 'آخر سعر';

  @override
  String get offline => 'غير متصل بالإنترنت';

  @override
  String get sharePlanMessage =>
      'إليك خطتي التقاعدية من تطبيق المستشار الذكي للتقاعد!';

  @override
  String get sharePlanSubject => 'خطتي التقاعدية';

  @override
  String get investmentGuideTitle => 'دليل الاستثمار';

  @override
  String get thndrGuideTitle => 'دليل الاستثمار عبر Thndr';

  @override
  String get thndrRecommendation =>
      'Thndr هو التطبيق الموصى به للاستثمار في مصر – سهل وآمن';

  @override
  String get goldSectionTitle => 'الذهب (Gold)';

  @override
  String get goldSectionDesc =>
      'للاستثمار في الذهب، اشترِ في صندوق الذهب مثل \'Thndr Gold Fund\' – يتابع سعر الذهب العالمي.';

  @override
  String get stocksSectionTitle => 'الأسهم (Stocks)';

  @override
  String get stocksSectionDesc =>
      'للأسهم، اشترِ في صندوق أسهم مثل \'Thndr Egypt Stock Fund\' – يستثمر في أسهم البورصة المصرية. عائد متوقع 10-15% سنويًا حسب السوق';

  @override
  String get certificatesSectionTitle => 'الشهادات (Certificates)';

  @override
  String get certificatesSectionDesc =>
      'للشهادات، اختر شهادات بنوك مثل \'Thndr Bank Certificates\' – عائد ثابت يصل 20%، آمنة ومضمونة';

  @override
  String get downloadThndr => 'تحميل Thndr';

  @override
  String get referralMessage =>
      'استخدم رابطي للتسجيل: https://thndr.app.link/iziadehap وستحصل على مكافأة، وأنا هأخذ عمولة بعد إيداعك الأول';

  @override
  String get riskQuizPrompt => 'مش عارف مستوى مخاطرتك؟ جرب الاختبار ده';

  @override
  String get riskQuizTitle => 'تقييم المخاطر';

  @override
  String get riskQuizQuestion1 => 'إمتى ناوي تبدأ تسحب من مدخراتك للتقاعد؟';

  @override
  String get riskQuizQ1Option1 => 'في أقل من 5 سنين';

  @override
  String get riskQuizQ1Option2 => 'خلال 5 لـ 15 سنة';

  @override
  String get riskQuizQ1Option3 => 'بعد أكتر من 15 سنة';

  @override
  String get riskQuizQuestion2 =>
      'لو استثماراتك قلت قيمتها 20% فجأة في يوم وليلة، هتعمل إيه؟';

  @override
  String get riskQuizQ2Option1 => 'هبيع كل حاجة فوراً عشان أحمي اللي فاضل';

  @override
  String get riskQuizQ2Option2 => 'هستنى وأشوف لو هتتحسن، بس مش هزود استثماري';

  @override
  String get riskQuizQ2Option3 =>
      'هفضل هادي أو حتى هزود استثماري بما إن الأسعار رخيصة';

  @override
  String get riskQuizQuestion3 => 'إيه هو هدفك المالي الأساسي من الخطة دي؟';

  @override
  String get riskQuizQ3Option1 => 'حماية أصل فلوسي بأي تمن';

  @override
  String get riskQuizQ3Option2 => 'نمو متوازن مع الحفاظ على مستوى مخاطرة متوسط';

  @override
  String get riskQuizQ3Option3 =>
      'أقصى نمو ممكن على المدى الطويل حتى لو فيه تقلبات عالية';

  @override
  String get riskQuizQuestion4 => 'تقدر توصف خبرتك في الاستثمار بإيه؟';

  @override
  String get riskQuizQ4Option1 => 'مبتدئ - أنا لسه جديد في موضوع الاستثمار';

  @override
  String get riskQuizQ4Option2 => 'متوسط - فاهم في الأسهم والسندات شوية';

  @override
  String get riskQuizQ4Option3 => 'متقدم - بتابع السوق وبدير محفظتي بنفسي';

  @override
  String get riskQuizResultLow =>
      'نتايجك بتقول إن مستوى مخاطرتك (محافظ/منخفض).';

  @override
  String get riskQuizResultMedium =>
      'نتايجك بتقول إن مستوى مخاطرتك (متوازن/متوسط).';

  @override
  String get riskQuizResultHigh => 'نتايجك بتقول إن مستوى مخاطرتك (جريء/عالي).';

  @override
  String get setRiskLevelButton => 'تعيين مستوى المخاطرة';
}
