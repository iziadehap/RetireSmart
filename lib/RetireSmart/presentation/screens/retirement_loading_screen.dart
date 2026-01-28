import 'package:flutter/material.dart';
import 'package:retiresmart/RetireSmart/presentation/widgets/retirement_loader.dart';
import 'package:retiresmart/core/app_colors.dart';

class RetirementLoadingScreen extends StatelessWidget {
  const RetirementLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppThemeColors.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      body: const RetirementLoader(),
    );
  }
}
