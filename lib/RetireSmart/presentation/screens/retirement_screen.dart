import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import '../controllers/retirement_controller.dart';

class RetirementScreen extends StatelessWidget {
  const RetirementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject dependency lazily
    final RetirementController controller = Get.put(RetirementController());

    return Scaffold(
      appBar: AppBar(title: const Text('RetireSmart'), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Plan Your Future",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "Find out how much you need to save daily/monthly to maintain your lifestyle after 60.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // --- INPUTS ---
            _buildTextField(
              controller: controller.ageController,
              label: "Current Age (years)",
              hint: "e.g. 30",
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: controller.expensesController,
              label: "Desired Monthly Expenses (At Retire)",
              hint: "e.g. 15000",
              prefix: "EGP ",
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: controller.savingsController,
              label: "Current Savings",
              hint: "e.g. 50000",
              prefix: "EGP ",
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),

            const SizedBox(height: 24),

            // --- ACTION ---
            ElevatedButton(
              onPressed: controller.calculate,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text("Calculate Plan"),
            ),

            const SizedBox(height: 24),

            // --- RESULTS ---
            Obx(() {
              if (controller.errorMessage.isNotEmpty) {
                return _buildErrorCard(controller.errorMessage.value);
              }
              if (controller.result.value != null) {
                return _buildResultCard(controller.result.value!);
              }
              return const SizedBox.shrink(); // Empty state
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    String? prefix,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixText: prefix,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }

  Widget _buildErrorCard(String error) {
    return Card(
      color: Colors.red.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          error,
          style: const TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildResultCard(dynamic result) {
    // result is of type RetirementResult from our domain model
    // Using dynamic to avoid tight coupling in 'build' but logic ensures type.

    // Formatting numbers for display
    final monthlySavings = result.monthlySavingsNeeded.toStringAsFixed(2);
    final nestEgg = result.requiredNestEgg.toStringAsFixed(2);
    final futureExpenses = result.futureMonthlyExpenses.toStringAsFixed(2);

    return Card(
      elevation: 4,
      color: Colors.teal.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Result",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const SizedBox(height: 8),
            Text(
              "You need to save:",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            Text(
              "$monthlySavings EGP / month",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 16),
            _buildDetailRow(
              "Years until retirement:",
              "${result.yearsToRetirement} years",
            ),
            _buildDetailRow("Future monthly expenses:", "$futureExpenses EGP"),
            const SizedBox(height: 8),
            _buildDetailRow("Required Nest Egg (Age 60):", "$nestEgg EGP"),

            const SizedBox(height: 16),
            const Text(
              "Disclaimer: This is an estimate based on 10% inflation and 12% investment return. Consult a financial advisor.",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label, style: const TextStyle(fontSize: 14))),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
