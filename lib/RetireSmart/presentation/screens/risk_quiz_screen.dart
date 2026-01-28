import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/RetireSmart/domain/entities/retirement_entities.dart';
import '../../../l10n/app_localizations.dart';
import '../controllers/risk_quiz_controller.dart';
import '../widgets/fade_in_animation.dart';

class RiskQuizScreen extends StatelessWidget {
  const RiskQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RiskQuizController());
    final s = AppLocalizations.of(context)!;
    const Color accent = Color(0xFF00F5FF);
    const Color bg = Color(0xFF0A0A0A);

    return Scaffold(
      backgroundColor: bg,
      body: Stack(
        children: [
          // Ambient Glow
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: accent.withOpacity(0.05),
                boxShadow: [
                  BoxShadow(
                    color: accent.withOpacity(0.05),
                    blurRadius: 100,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),

          SafeArea(
            child: Obx(
              () => Column(
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          s.riskQuizTitle.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Progress Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value:
                            (controller.currentQuestionIndex.value + 1) /
                            controller.totalQuestions,
                        backgroundColor: Colors.white.withOpacity(0.05),
                        color: accent,
                        minHeight: 6,
                      ),
                    ),
                  ),

                  Expanded(
                    child: controller.isQuizFinished.value
                        ? _buildResult(controller, s, accent)
                        : _buildQuestion(controller, s, accent),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestion(
    RiskQuizController controller,
    AppLocalizations s,
    Color accent,
  ) {
    final questions = [
      _QuizQuestion(
        question: s.riskQuizQuestion1,
        options: [
          _QuizOption(text: s.riskQuizQ1Option1, points: 1),
          _QuizOption(text: s.riskQuizQ1Option2, points: 2),
          _QuizOption(text: s.riskQuizQ1Option3, points: 3),
        ],
      ),
      _QuizQuestion(
        question: s.riskQuizQuestion2,
        options: [
          _QuizOption(text: s.riskQuizQ2Option1, points: 1),
          _QuizOption(text: s.riskQuizQ2Option2, points: 2),
          _QuizOption(text: s.riskQuizQ2Option3, points: 3),
        ],
      ),
      _QuizQuestion(
        question: s.riskQuizQuestion3,
        options: [
          _QuizOption(text: s.riskQuizQ3Option1, points: 1),
          _QuizOption(text: s.riskQuizQ3Option2, points: 2),
          _QuizOption(text: s.riskQuizQ3Option3, points: 3),
        ],
      ),
      _QuizQuestion(
        question: s.riskQuizQuestion4,
        options: [
          _QuizOption(text: s.riskQuizQ4Option1, points: 1),
          _QuizOption(text: s.riskQuizQ4Option2, points: 2),
          _QuizOption(text: s.riskQuizQ4Option3, points: 3),
        ],
      ),
    ];

    final currentQuestion = questions[controller.currentQuestionIndex.value];

    return FadeIn(
      key: ValueKey(controller.currentQuestionIndex.value),
      delay: 0,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "0${controller.currentQuestionIndex.value + 1}",
              style: TextStyle(
                color: accent.withOpacity(0.5),
                fontSize: 40,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              currentQuestion.question,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 48),
            ...currentQuestion.options.map(
              (option) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: _buildOptionButton(option, controller, accent),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(
    _QuizOption option,
    RiskQuizController controller,
    Color accent,
  ) {
    return GestureDetector(
      onTap: () => controller.selectAnswer(option.points),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.03),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.08)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                option.text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: accent.withOpacity(0.5),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResult(
    RiskQuizController controller,
    AppLocalizations s,
    Color accent,
  ) {
    final riskLevel = controller.calculateRiskLevel();
    String resultText;
    IconData resultIcon;
    Color resultColor;

    switch (riskLevel) {
      case RiskLevel.low:
        resultText = s.riskQuizResultLow;
        resultIcon = Icons.shield_outlined;
        resultColor = const Color(0xFF69F0AE); // Green
        break;
      case RiskLevel.medium:
        resultText = s.riskQuizResultMedium;
        resultIcon = Icons.balance;
        resultColor = const Color(0xFF40C4FF); // Blue
        break;
      case RiskLevel.high:
        resultText = s.riskQuizResultHigh;
        resultIcon = Icons.trending_up;
        resultColor = const Color(0xFFFF5252); // Red
        break;
    }

    return FadeIn(
      delay: 200,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: resultColor.withOpacity(0.1),
                border: Border.all(
                  color: resultColor.withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Icon(resultIcon, color: resultColor, size: 64),
            ),
            const SizedBox(height: 32),
            Text(
              resultText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () => controller.applyResultAndExit(),
              style: ElevatedButton.styleFrom(
                backgroundColor: accent,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 48,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                s.setRiskLevelButton,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuizQuestion {
  final String question;
  final List<_QuizOption> options;
  _QuizQuestion({required this.question, required this.options});
}

class _QuizOption {
  final String text;
  final int points;
  _QuizOption({required this.text, required this.points});
}
