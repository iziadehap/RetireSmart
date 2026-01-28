import 'package:get_x/get.dart';
import '../../domain/entities/retirement_entities.dart';
import './retirement_controller.dart';

class RiskQuizController extends GetxController {
  var currentQuestionIndex = 0.obs;
  var selectedAnswers =
      <int>[].obs; // Stores the point value of each answer (1, 2, or 3)
  var isQuizFinished = false.obs;

  final totalQuestions = 4;

  void selectAnswer(int points) {
    if (selectedAnswers.length > currentQuestionIndex.value) {
      selectedAnswers[currentQuestionIndex.value] = points;
    } else {
      selectedAnswers.add(points);
    }

    if (currentQuestionIndex.value < totalQuestions - 1) {
      currentQuestionIndex.value++;
    } else {
      isQuizFinished.value = true;
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex.value > 0) {
      currentQuestionIndex.value--;
      isQuizFinished.value = false;
    }
  }

  RiskLevel calculateRiskLevel() {
    if (selectedAnswers.isEmpty) return RiskLevel.medium;

    double average =
        selectedAnswers.fold(0, (sum, item) => sum + item) /
        selectedAnswers.length;

    if (average <= 1.5) {
      return RiskLevel.low;
    } else if (average <= 2.5) {
      return RiskLevel.medium;
    } else {
      return RiskLevel.high;
    }
  }

  void applyResultAndExit() {
    final RiskLevel calculatedLevel = calculateRiskLevel();
    final RetirementController retirementController =
        Get.find<RetirementController>();
    retirementController.updateRiskLevel(calculatedLevel);
    Get.back();
  }
}
