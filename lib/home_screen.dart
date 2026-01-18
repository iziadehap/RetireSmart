import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/GoldPrice/gold_screen.dart';
import 'RetireSmart/presentation/screens/retirement_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Get.to(() => const GoldScreen());
              },
              child: Container(
                color: Colors.red,
                height: 100,
                width: MediaQuery.of(context).size.width * 0.5,
                child: const Center(child: Text("gold screen")),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Get.to(() => const RetirementScreen());
              },
              child: Container(
                color: Colors.green,
                height: 100,
                width: MediaQuery.of(context).size.width * 0.5,
                child: const Center(child: Text("retire smart screen")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
