import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For TextInputFormatter
import 'package:get_x/get.dart';
import '../controllers/retirement_controller.dart';
import '../../domain/entities/retirement_entities.dart';
import '../widgets/retirement_loader.dart';
import '../widgets/retire_widgets.dart';
import '../widgets/common_painters.dart';
import 'package:retiresmart/l10n/app_localizations.dart';
import 'package:retiresmart/core/app_colors.dart';

class RetirementWizardScreen extends StatelessWidget {
  const RetirementWizardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject Controller
    final RetirementController controller = Get.put(RetirementController());
    final s = AppLocalizations.of(context)!;
    final colors = AppThemeColors.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: colors.background,
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
                        color: colors.accentCyan.withOpacity(0.05),
                        boxShadow: [
                          BoxShadow(
                            color: colors.accentCyan.withOpacity(0.05),
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
                        color: colors.text,
                        spacing: 40,
                        opacity: isDark ? 0.03 : 0.05,
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
                              color: colors.text.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: colors.text.withOpacity(0.1),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: colors.text,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          s.appTitle, // "Retirement Planner"
                          style: TextStyle(
                            color: colors.text,
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
                                ? colors.accentCyan
                                : colors.text.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: isActive
                                ? [
                                    BoxShadow(
                                      color: colors.accentCyan.withOpacity(0.5),
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
                        color: colors.text.withOpacity(0.03),
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(
                          color: colors.text.withOpacity(0.08),
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
                                context,
                                controller,
                                colors.accentCyan,
                                s,
                              ),
                            ),
                            _buildStepContent(
                              _buildStep2(
                                context,
                                controller,
                                colors.accentCyan,
                                s,
                              ),
                            ),
                            _buildStepContent(
                              _buildStep3(
                                context,
                                controller,
                                colors.accentCyan,
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
                              context: context,
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
                            context: context,
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
    required BuildContext context,
    required VoidCallback onTap,
    required String label,
    required bool isPrimary,
  }) {
    final colors = AppThemeColors.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: isPrimary
              ? LinearGradient(
                  colors: [
                    colors.accentCyan,
                    colors.accentCyan.withOpacity(0.8),
                  ],
                )
              : null,
          color: isPrimary ? null : colors.text.withOpacity(0.05),
          border: isPrimary
              ? null
              : Border.all(color: colors.text.withOpacity(0.1)),
          boxShadow: isPrimary
              ? [
                  BoxShadow(
                    color: colors.accentCyan.withOpacity(0.3),
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
            color: isPrimary
                ? (isDark ? Colors.black : Colors.white)
                : colors.text,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildStep1(
    BuildContext context,
    RetirementController controller,
    Color accent,
    AppLocalizations s,
  ) {
    final colors = AppThemeColors.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.person_pin_circle_outlined, color: accent, size: 48),
        const SizedBox(height: 16),
        Text(
          s.step1Title,
          style: TextStyle(
            color: colors.text,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 30),
        _buildModernTextField(
          context: context,
          controller: controller.ageController,
          label: s.currentAgeLabel,
          icon: Icons.cake_outlined,
          accent: accent,
        ),
        const SizedBox(height: 20),
        _buildModernTextField(
          context: context,
          controller: controller.retirementAgeController,
          label: s.targetRetirementAgeLabel,
          icon: Icons.flag_outlined,
          accent: accent,
        ),
      ],
    );
  }

  Widget _buildStep2(
    BuildContext context,
    RetirementController controller,
    Color accent,
    AppLocalizations s,
  ) {
    final colors = AppThemeColors.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.account_balance_wallet_outlined, color: accent, size: 48),
        const SizedBox(height: 16),
        Text(
          s.incomeExpensesTitle,
          style: TextStyle(
            color: colors.text,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          s.gapDescription,
          style: TextStyle(color: colors.subtext, height: 1.4),
        ),
        const SizedBox(height: 30),
        _buildModernTextField(
          context: context,
          controller: controller.mainIncomeController,
          label: s.monthlyIncomeLabel,
          icon: Icons.attach_money,
          accent: accent,
        ),
        const SizedBox(height: 20),
        _buildModernTextField(
          context: context,
          controller: controller.additionalIncomeController,
          label: s.additionalIncomeLabel,
          icon: Icons.add_circle_outline,
          accent: accent,
        ),
        const SizedBox(height: 20),
        _buildModernTextField(
          context: context,
          controller: controller.expensesController,
          label: s.monthlyExpensesLabel,
          icon: Icons.money_off_outlined,
          accent: accent,
        ),
      ],
    );
  }

  Widget _buildStep3(
    BuildContext context,
    RetirementController controller,
    Color accent,
    AppLocalizations s,
  ) {
    final colors = AppThemeColors.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.query_stats, color: accent, size: 48),
        const SizedBox(height: 16),
        Text(
          s.assetsStrategyTitle,
          style: TextStyle(
            color: colors.text,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        _buildModernTextField(
          context: context,
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
                color: colors.subtext,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed('/riskQuiz'),
              child: Text(
                s.riskQuizPrompt,
                style: TextStyle(
                  color: accent,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationColor: accent,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        Obx(
          () => Container(
            decoration: BoxDecoration(
              color: colors.text.withOpacity(0.03),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: colors.text.withOpacity(0.1)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<RiskLevel>(
                value: controller.selectedRiskLevel.value,
                dropdownColor: colors.background,
                icon: Icon(Icons.keyboard_arrow_down, color: accent),
                isExpanded: true,
                style: TextStyle(
                  color: colors.text,
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
    required BuildContext context,
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required Color accent,
  }) {
    final colors = AppThemeColors.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(
            color: colors.subtext,
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          style: TextStyle(color: colors.text, fontSize: 16),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [ThousandsSeparatorInputFormatter()],
          decoration: InputDecoration(
            filled: true,
            fillColor: colors.text.withOpacity(0.03),
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
              borderSide: BorderSide(color: colors.text.withOpacity(0.1)),
            ),
          ),
        ),
      ],
    );
  }
}
