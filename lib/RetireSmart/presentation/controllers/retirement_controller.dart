import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/RetireSmart/data/models/inflation_model.dart';
import 'package:retiresmart/RetireSmart/domain/repo/retire_repo.dart';
import 'package:retiresmart/RetireSmart/domain/usecases/retirement_delete_cash.dart';
import '../../domain/entities/retirement_entities.dart';
import '../../domain/usecases/retirement_calculator.dart';
import 'package:retiresmart/l10n/app_localizations.dart';
import '../screens/retirement_result_screen.dart';

class RetirementController extends GetxController {
  // Wizard Navigation
  var isLoading = false.obs;
  var currentStep = 0.obs;
  final int totalSteps = 3;
  late PageController pageController;

  // Input Controllers
  final ageController = TextEditingController();
  final retirementAgeController = TextEditingController(text: "60");
  final mainIncomeController = TextEditingController();
  final additionalIncomeController = TextEditingController();
  final expensesController = TextEditingController();
  final savingsController = TextEditingController();

  // Reactive State for Validation & UI
  var selectedRiskLevel = RiskLevel.medium.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    checkSavedSession();
  }

  void checkSavedSession() async {
    try {
      final repo = Get.find<RetireRepo>();
      final cachedData = await repo.getFromCache();

      if (cachedData != null && cachedData['result'] is RetirementResult) {
        final result = cachedData['result'] as RetirementResult;
        // Small delay to ensure UI is ready or just go immediately
        // Using 0 delay to let the controller finish init
        await Future.delayed(Duration.zero);
        print('find result and go to result screen now ===================');
        Get.off(
          () => RetirementResultScreen(
            result: result,
            inflationModel: cachedData['inflationModel'] as InflationModel,
          ),
        );
      }
    } catch (e) {
      print('error checking saved session ===================');
      debugPrint("Error checking saved session: $e");
    }
  }

  @override
  void onClose() {
    ageController.dispose();
    retirementAgeController.dispose();
    mainIncomeController.dispose();
    additionalIncomeController.dispose();
    expensesController.dispose();
    savingsController.dispose();
    pageController.dispose();
    super.onClose();
  }

  void nextStep() {
    errorMessage.value = '';
    if (validateStep(currentStep.value)) {
      if (currentStep.value < totalSteps - 1) {
        currentStep.value++;
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      } else {
        submitCalculation();
      }
    }
  }

  void previousStep() {
    errorMessage.value = '';
    if (currentStep.value > 0) {
      currentStep.value--;
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  bool validateStep(int step) {
    if (Get.context == null) return false;
    final s = AppLocalizations.of(Get.context!)!;

    switch (step) {
      case 0: // Basic Info
        int? age = int.tryParse(ageController.text.replaceAll(',', ''));
        int? retAge = int.tryParse(
          retirementAgeController.text.replaceAll(',', ''),
        );
        if (age == null || retAge == null) {
          errorMessage.value = s.errorValidAges;
          return false;
        }
        if (age < 0 || retAge < 0) {
          errorMessage.value = s.errorNegativeAges;
          return false;
        }
        if (age >= retAge) {
          errorMessage.value = s.errorAgeLogic;
          return false;
        }
        return true;
      case 1: // Income & Expenses
        double? income = double.tryParse(
          mainIncomeController.text.replaceAll(',', ''),
        );
        double? expenses = double.tryParse(
          expensesController.text.replaceAll(',', ''),
        );
        if (income == null || expenses == null) {
          errorMessage.value = s.errorValidAmounts;
          return false;
        }
        if (income < 0 || expenses < 0) {
          errorMessage.value = s.errorNegativeAmounts;
          return false;
        }
        return true;
      case 2: // Savings & Risk
        double? savings = double.tryParse(
          savingsController.text.replaceAll(',', ''),
        );
        if (savings == null) {
          errorMessage.value = s.errorValidSavings;
          return false;
        }
        if (savings < 0) {
          errorMessage.value = s.errorNegativeSavings;
          return false;
        }
        return true;
      default:
        return false;
    }
  }

  void submitCalculation() async {
    isLoading.value = true;

    try {
      final input = RetirementInput(
        currentAge: int.parse(ageController.text.replaceAll(',', '')),
        retirementAge: int.parse(
          retirementAgeController.text.replaceAll(',', ''),
        ),
        monthlyExpenses: double.parse(
          expensesController.text.replaceAll(',', ''),
        ),
        currentSavings: double.parse(
          savingsController.text.replaceAll(',', ''),
        ),
        mainMonthlyIncome: double.parse(
          mainIncomeController.text.replaceAll(',', ''),
        ),
        additionalMonthlyIncome:
            double.tryParse(
              additionalIncomeController.text.replaceAll(',', ''),
            ) ??
            0,
        riskLevel: selectedRiskLevel.value,
      );

      final result = await RetirementCalculator.calculate(
        input,
        Get.find<RetireRepo>(),
      );

      isLoading.value = false;

      // Navigate to results
      Get.off(
        () => RetirementResultScreen(
          result: result,
          inflationModel: result.inflationModel,
        ),
      );
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        Get.context != null
            ? AppLocalizations.of(Get.context!)!.errorGeneric
            : "Error",
        e.toString(),
        snackPosition: SnackPosition.bottom,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  void updateRiskLevel(RiskLevel? level) {
    if (level != null) {
      selectedRiskLevel.value = level;
    }
  }

  void reset() async {
    await RetirementDeleteCash().call(); // delete cash
    ageController.clear();
    retirementAgeController.text = "60";
    mainIncomeController.clear();
    additionalIncomeController.clear();
    expensesController.clear();
    savingsController.clear();
    errorMessage.value = '';
    currentStep.value = 0;
    if (pageController.hasClients) {
      pageController.jumpToPage(0);
    }
    selectedRiskLevel.value = RiskLevel.medium;
  }
}
