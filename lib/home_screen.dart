import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/GoldPrice/presentation/controller/gold_controller.dart';

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
                Get.lazyPut(() => GoldController());
                Get.toNamed('/gold');
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
                Get.lazyPut(() => GoldController());
                Get.toNamed('/retirement');
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

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoldController());
  }
}
