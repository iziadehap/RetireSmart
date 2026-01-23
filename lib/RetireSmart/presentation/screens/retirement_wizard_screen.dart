import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/core/colors.dart';
import '../controllers/retirement_controller.dart';
import '../../domain/models/retirement_model.dart';
import 'package:retiresmart/l10n/app_localizations.dart';

class RetirementWizardScreen extends StatelessWidget {
  const RetirementWizardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject Controller
    final RetirementController controller = Get.put(RetirementController());
    final s = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          s.appTitle,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios_new, size: 20),
        //   onPressed: () => Get.back(),
        // ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [bgStart, bgEnd],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Modern Progress Indicator
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 12,
                ),
                child: Obx(
                  () => ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value:
                          (controller.currentStep.value + 1) /
                          controller.totalSteps,
                      minHeight: 8,
                      backgroundColor: Colors.white.withOpacity(0.1),
                      valueColor: AlwaysStoppedAnimation<Color>(accent),
                    ),
                  ),
                ),
              ),

              // Page Content
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: PageView(
                    controller: controller.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildStepContainer(
                        _buildStep1(controller, accent, s),
                        "Profile Setup",
                      ),
                      _buildStepContainer(
                        _buildStep2(controller, accent, s),
                        "Financial Data",
                      ),
                      _buildStepContainer(
                        _buildStep3(controller, accent, s),
                        "Strategy",
                      ),
                    ],
                  ),
                ),
              ),

              // Navigation Actions
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Row(
                  children: [
                    Obx(
                      () => controller.currentStep.value > 0
                          ? Expanded(
                              flex: 1,
                              child: OutlinedButton(
                                onPressed: controller.previousStep,
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 18,
                                  ),
                                  side: BorderSide(
                                    color: Colors.white.withOpacity(0.3),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  foregroundColor: Colors.white,
                                ),
                                child: Text(s.backButton),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                    if (controller.currentStep.value > 0)
                      const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: Obx(
                        () => ElevatedButton(
                          onPressed: controller.nextStep,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            backgroundColor: accent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 8,
                            shadowColor: accent.withOpacity(0.4),
                          ),
                          child: Text(
                            controller.currentStep.value ==
                                    controller.totalSteps - 1
                                ? s.generatePlanButton
                                : s.continueButton,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Floating Error Toast
              Obx(
                () => controller.errorMessage.isNotEmpty
                    ? Container(
                        margin: const EdgeInsets.only(
                          bottom: 20,
                          left: 20,
                          right: 20,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.redAccent.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withOpacity(0.3),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                controller.errorMessage.value,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepContainer(Widget content, String title) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(child: SingleChildScrollView(child: content)),
        ],
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
        Text(
          s.step1Title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        _buildModernTextField(
          controller: controller.ageController,
          label: s.currentAgeLabel,
          icon: Icons.person_outline,
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
          style: TextStyle(color: Colors.white.withOpacity(0.7)),
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
          icon: Icons.account_balance_wallet_outlined,
          accent: accent,
        ),
        const SizedBox(height: 30),
        Text(
          s.riskAppetiteLabel,
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Obx(
          () => Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<RiskLevel>(
                value: controller.selectedRiskLevel.value,
                dropdownColor: const Color(0xFF1E293B),
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down, color: accent),
                items: RiskLevel.values.map((RiskLevel risk) {
                  // Helper to map enum to localized string
                  String name = risk.name;
                  if (risk == RiskLevel.high) name = s.riskHigh;
                  if (risk == RiskLevel.medium) name = s.riskMedium;
                  if (risk == RiskLevel.low) name = s.riskLow;

                  return DropdownMenuItem<RiskLevel>(
                    value: risk,
                    child: Text(
                      name,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  );
                }).toList(),
                onChanged: (RiskLevel? newValue) {
                  controller.updateRiskLevel(newValue);
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Obx(() {
          Color riskColor;
          String riskDesc;
          switch (controller.selectedRiskLevel.value) {
            case RiskLevel.high:
              riskColor = Colors.orangeAccent;
              riskDesc = s.riskHighDesc;
              break;
            case RiskLevel.medium:
              riskColor = Colors.blueAccent;
              riskDesc = s.riskMediumDesc;
              break;
            case RiskLevel.low:
              riskColor = Colors.greenAccent;
              riskDesc = s.riskLowDesc;
              break;
          }
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: riskColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: riskColor.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: riskColor, size: 20),
                const SizedBox(width: 10),
                Text(
                  riskDesc,
                  style: TextStyle(
                    color: riskColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
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
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black.withOpacity(0.3),
            prefixIcon: Icon(icon, color: accent.withOpacity(0.7)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: accent),
            ),
          ),
        ),
      ],
    );
  }
}
