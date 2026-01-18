import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import '../../domain/models/retirement_model.dart';
import '../../domain/usecases/retirement_calculator.dart';

class RetirementController extends GetxController {
  // Text Controllers for Input
  final ageController = TextEditingController();
  final expensesController = TextEditingController();
  final savingsController = TextEditingController();

  // Reactive State
  var age = 0.obs;
  var monthlyExpenses = 0.0.obs;
  var currentSavings = 0.0.obs;

  var result = Rxn<RetirementResult>();
  var errorMessage = ''.obs;

  @override
  void onClose() {
    ageController.dispose();
    expensesController.dispose();
    savingsController.dispose();
    super.onClose();
  }

  void calculate() {
    errorMessage.value = '';

    // Basic Parsing & Validation
    final int? parsedAge = int.tryParse(ageController.text);
    final double? parsedExpenses = double.tryParse(expensesController.text);
    final double? parsedSavings = double.tryParse(savingsController.text);

    if (parsedAge == null || parsedExpenses == null || parsedSavings == null) {
      errorMessage.value = "Please enter valid numbers in all fields.";
      return;
    }

    if (parsedAge >= 60) {
      errorMessage.value = "Age must be less than 60 to plan for retirement.";
      return;
    }

    if (parsedAge < 0 || parsedExpenses < 0 || parsedSavings < 0) {
      errorMessage.value = "Values cannot be negative.";
      return;
    }

    // Update observables (optional, for debugging or other UI reactions)
    age.value = parsedAge;
    monthlyExpenses.value = parsedExpenses;
    currentSavings.value = parsedSavings;

    try {
      final input = RetirementInput(
        currentAge: parsedAge,
        monthlyExpenses: parsedExpenses,
        currentSavings: parsedSavings,
      );

      result.value = RetirementCalculator.calculate(input);
    } catch (e) {
      errorMessage.value = "Calculation Error: ${e.toString()}";
    }
  }

  void reset() {
    ageController.clear();
    expensesController.clear();
    savingsController.clear();
    result.value = null;
    errorMessage.value = '';
  }
}
