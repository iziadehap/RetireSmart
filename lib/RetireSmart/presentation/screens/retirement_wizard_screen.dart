import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For TextInputFormatter
import 'package:get_x/get.dart';
import '../controllers/retirement_controller.dart';
import '../../domain/entities/retirement_entities.dart';
import '../widgets/retirement_loader.dart';
import '../widgets/retire_widgets.dart';
import 'package:retiresmart/l10n/app_localizations.dart';

class RetirementWizardScreen extends StatelessWidget {
  const RetirementWizardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject Controller
    final RetirementController controller = Get.put(RetirementController());
    final s = AppLocalizations.of(context)!;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF0A0A0A),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const RetirementLoader();
        }
        return Stack(
          children: [
            // Ambient Glow (fixed background)
            Positioned.fill(
              child: Stack(
                children: [
                  Positioned(
                    top: -100,
                    left: -100,
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF00F5FF).withOpacity(0.05),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF00F5FF).withOpacity(0.05),
                            blurRadius: 100,
                            spreadRadius: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: CustomPaint(
                      painter: DotGridPainter(
                        color: Colors.white,
                        spacing: 40,
                        opacity: 0.03,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SafeArea(
              child: Column(
                children: [
                  // Custom AppBar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 16.0,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.1),
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          s.appTitle, // "Retirement Planner"
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Progress Indicator
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(controller.totalSteps, (index) {
                        bool isActive = index <= controller.currentStep.value;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: isActive ? 24 : 12,
                          height: 4,
                          decoration: BoxDecoration(
                            color: isActive
                                ? const Color(0xFF00F5FF)
                                : Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: isActive
                                ? [
                                    BoxShadow(
                                      color: const Color(
                                        0xFF00F5FF,
                                      ).withOpacity(0.5),
                                      blurRadius: 4,
                                    ),
                                  ]
                                : [],
                          ),
                        );
                      }),
                    ),
                  ),

                  // Content Area
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.03),
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.08),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: PageView(
                          controller: controller.pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            _buildStepContent(
                              _buildStep1(
                                controller,
                                const Color(0xFF00F5FF),
                                s,
                              ),
                            ),
                            _buildStepContent(
                              _buildStep2(
                                controller,
                                const Color(0xFF00F5FF),
                                s,
                              ),
                            ),
                            _buildStepContent(
                              _buildStep3(
                                controller,
                                const Color(0xFF00F5FF),
                                s,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Navigation Buttons
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                    child: Row(
                      children: [
                        if (controller.currentStep.value > 0)
                          Expanded(
                            flex: 1,
                            child: _buildNavButton(
                              onTap: controller.previousStep,
                              label: s.backButton,
                              isPrimary: false,
                            ),
                          ),

                        if (controller.currentStep.value > 0)
                          const SizedBox(width: 16),

                        Expanded(
                          flex: 2,
                          child: _buildNavButton(
                            onTap: controller.nextStep,
                            label:
                                controller.currentStep.value ==
                                    controller.totalSteps - 1
                                ? s.generatePlanButton
                                : s.continueButton,
                            isPrimary: true,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Error Toast
                  if (controller.errorMessage.isNotEmpty)
                    FadeIn(
                      delay: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 10,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.redAccent.withOpacity(0.1),
                          border: Border.all(
                            color: Colors.redAccent.withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.redAccent,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                controller.errorMessage.value,
                                style: const TextStyle(color: Colors.redAccent),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildStepContent(Widget content) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: FadeIn(delay: 200, child: content),
    );
  }

  Widget _buildNavButton({
    required VoidCallback onTap,
    required String label,
    required bool isPrimary,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: isPrimary
              ? const LinearGradient(
                  colors: [Color(0xFF00F5FF), Color(0xFF00E0E6)],
                )
              : null,
          color: isPrimary ? null : Colors.white.withOpacity(0.05),
          border: isPrimary
              ? null
              : Border.all(color: Colors.white.withOpacity(0.1)),
          boxShadow: isPrimary
              ? [
                  BoxShadow(
                    color: const Color(0xFF00F5FF).withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: -2,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: isPrimary ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildStep1(
    RetirementController controller,
    Color accent,
    AppLocalizations s,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.person_pin_circle_outlined,
          color: Color(0xFF00F5FF),
          size: 48,
        ),
        const SizedBox(height: 16),
        Text(
          s.step1Title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 30),
        _buildModernTextField(
          controller: controller.ageController,
          label: s.currentAgeLabel,
          icon: Icons.cake_outlined,
          accent: accent,
        ),
        const SizedBox(height: 20),
        _buildModernTextField(
          controller: controller.retirementAgeController,
          label: s.targetRetirementAgeLabel,
          icon: Icons.flag_outlined,
          accent: accent,
        ),
      ],
    );
  }

  Widget _buildStep2(
    RetirementController controller,
    Color accent,
    AppLocalizations s,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.account_balance_wallet_outlined,
          color: Color(0xFF00F5FF),
          size: 48,
        ),
        const SizedBox(height: 16),
        Text(
          s.incomeExpensesTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          s.gapDescription,
          style: TextStyle(color: Colors.white.withOpacity(0.6), height: 1.4),
        ),
        const SizedBox(height: 30),
        _buildModernTextField(
          controller: controller.mainIncomeController,
          label: s.monthlyIncomeLabel,
          icon: Icons.attach_money,
          accent: accent,
        ),
        const SizedBox(height: 20),
        _buildModernTextField(
          controller: controller.additionalIncomeController,
          label: s.additionalIncomeLabel,
          icon: Icons.add_circle_outline,
          accent: accent,
        ),
        const SizedBox(height: 20),
        _buildModernTextField(
          controller: controller.expensesController,
          label: s.monthlyExpensesLabel,
          icon: Icons.money_off_outlined,
          accent: accent,
        ),
      ],
    );
  }

  Widget _buildStep3(
    RetirementController controller,
    Color accent,
    AppLocalizations s,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.query_stats, color: Color(0xFF00F5FF), size: 48),
        const SizedBox(height: 16),
        Text(
          s.assetsStrategyTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        _buildModernTextField(
          controller: controller.savingsController,
          label: s.currentSavingsLabel,
          icon: Icons.savings_outlined,
          accent: accent,
        ),
        const SizedBox(height: 30),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              s.riskAppetiteLabel,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed('/riskQuiz'),
              child: Text(
                s.riskQuizPrompt,
                style: const TextStyle(
                  color: Color(0xFF00F5FF),
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        Obx(
          () => Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<RiskLevel>(
                value: controller.selectedRiskLevel.value,
                dropdownColor: const Color(0xFF1A1A1A),
                icon: Icon(Icons.keyboard_arrow_down, color: accent),
                isExpanded: true,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                ),
                items: RiskLevel.values.map((RiskLevel risk) {
                  String name = risk.name;
                  if (risk == RiskLevel.high) name = s.riskHigh;
                  if (risk == RiskLevel.medium) name = s.riskMedium;
                  if (risk == RiskLevel.low) name = s.riskLow;
                  return DropdownMenuItem<RiskLevel>(
                    value: risk,
                    child: Text(name),
                  );
                }).toList(),
                onChanged: controller.updateRiskLevel,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Obx(() {
          Color riskColor;
          String riskDesc;
          IconData riskIcon;

          switch (controller.selectedRiskLevel.value) {
            case RiskLevel.high:
              riskColor = const Color(0xFFFF5252);
              riskDesc = s.riskHighDesc;
              riskIcon = Icons.trending_up;
              break;
            case RiskLevel.medium:
              riskColor = const Color(0xFF40C4FF);
              riskDesc = s.riskMediumDesc;
              riskIcon = Icons.trending_flat;
              break;
            case RiskLevel.low:
              riskColor = const Color(0xFF69F0AE);
              riskDesc = s.riskLowDesc;
              riskIcon = Icons.shield_outlined;
              break;
          }
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: riskColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: riskColor.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Icon(riskIcon, color: riskColor, size: 24),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    riskDesc,
                    style: TextStyle(
                      color: riskColor,
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildModernTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required Color accent,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [ThousandsSeparatorInputFormatter()],
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black.withOpacity(0.3),
            prefixIcon: Icon(icon, color: accent.withOpacity(0.7)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: accent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
            ),
          ),
        ),
      ],
    );
  }
}
