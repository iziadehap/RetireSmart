import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/RetireSmart/domain/usecases/retirement_delete_cash.dart';
import 'package:retiresmart/RetireSmart/presentation/widgets/retire_widgets.dart';
import 'package:retiresmart/l10n/app_localizations.dart';

void showRetirementDialog({
  required BuildContext context,
  required Color accent,
}) {
  final s = AppLocalizations.of(context)!;

  Get.dialog(
    BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: const EdgeInsets.all(2), // For gradient border
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  accent.withOpacity(0.3),
                  Colors.white.withOpacity(0.05),
                ],
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0D1117).withOpacity(0.9),
                borderRadius: BorderRadius.circular(22),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  // Ambient Glow
                  Positioned(
                    top: -50,
                    right: -50,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: accent.withOpacity(0.1),
                        boxShadow: [
                          BoxShadow(
                            color: accent.withOpacity(0.1),
                            blurRadius: 40,
                            spreadRadius: 20,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Dotted Grid
                  Positioned.fill(
                    child: CustomPaint(
                      painter: DotGridPainter(
                        color: Colors.white,
                        spacing: 30,
                        opacity: 0.03,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Icon Header
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: accent.withOpacity(0.1),
                            shape: BoxShape.circle,
                            border: Border.all(color: accent.withOpacity(0.2)),
                          ),
                          child: Icon(
                            Icons.refresh_rounded,
                            color: accent,
                            size: 32,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Title
                        Text(
                          s.recalculate.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Content
                        Text(
                          s.resetConfirmation,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Actions
                        Row(
                          children: [
                            Expanded(
                              child: _buildDialogButton(
                                label: s.noCancel,
                                isPrimary: false,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildDialogButton(
                                label: s.yesReset,
                                isPrimary: true,
                                accent: accent,
                                onTap: () {
                                  try {
                                    RetirementDeleteCash().call();
                                    Navigator.pop(context);
                                    Get.offNamed('/retirement');
                                  } catch (e) {
                                    Get.snackbar(
                                      "Error",
                                      e.toString(),
                                      snackPosition: SnackPosition.bottom,
                                      backgroundColor: Colors.redAccent,
                                      colorText: Colors.white,
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    transitionCurve: Curves.easeOutBack,
  );
}

Widget _buildDialogButton({
  required String label,
  required bool isPrimary,
  Color? accent,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: isPrimary && accent != null
            ? LinearGradient(colors: [accent, accent.withOpacity(0.8)])
            : null,
        color: isPrimary ? null : Colors.white.withOpacity(0.05),
        border: isPrimary
            ? null
            : Border.all(color: Colors.white.withOpacity(0.1)),
        boxShadow: isPrimary && accent != null
            ? [
                BoxShadow(
                  color: accent.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          color: isPrimary ? Colors.black : Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    ),
  );
}
