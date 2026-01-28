import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:retiresmart/RetireSmart/domain/usecases/retirement_delete_cash.dart';
import 'package:retiresmart/RetireSmart/presentation/widgets/common_painters.dart';
import 'package:retiresmart/l10n/app_localizations.dart';
import 'package:retiresmart/core/app_colors.dart';

void showRetirementDialog({required BuildContext context, Color? accent}) {
  final s = AppLocalizations.of(context)!;
  final colors = AppThemeColors.of(context);
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final effectiveAccent = accent ?? colors.accentCyan;

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
                  effectiveAccent.withOpacity(0.3),
                  colors.text.withOpacity(0.05),
                ],
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: colors.card.withOpacity(isDark ? 0.9 : 0.95),
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
                        color: effectiveAccent.withOpacity(0.1),
                        boxShadow: [
                          BoxShadow(
                            color: effectiveAccent.withOpacity(0.1),
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
                        color: colors.text,
                        spacing: 30,
                        opacity: isDark ? 0.03 : 0.06,
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
                            color: effectiveAccent.withOpacity(0.1),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: effectiveAccent.withOpacity(0.2),
                            ),
                          ),
                          child: Icon(
                            Icons.refresh_rounded,
                            color: effectiveAccent,
                            size: 32,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Title
                        Text(
                          s.recalculate.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: colors.text,
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
                            color: colors.subtext,
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
                                context: context,
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
                                context: context,
                                label: s.yesReset,
                                isPrimary: true,
                                accent: effectiveAccent,
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
  required BuildContext context,
  required String label,
  required bool isPrimary,
  Color? accent,
  required VoidCallback onTap,
}) {
  final colors = AppThemeColors.of(context);
  final isDark = Theme.of(context).brightness == Brightness.dark;

  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: isPrimary && accent != null
            ? LinearGradient(colors: [accent, accent.withOpacity(0.8)])
            : null,
        color: isPrimary ? null : colors.text.withOpacity(0.05),
        border: isPrimary
            ? null
            : Border.all(color: colors.text.withOpacity(0.1)),
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
          color: isPrimary
              ? (isDark ? Colors.black : Colors.white)
              : colors.subtext,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    ),
  );
}
