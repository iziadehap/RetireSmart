import 'package:flutter/material.dart';

class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color background;
  final Color surface;
  final Color card;
  final Color border;
  final Color text;
  final Color subtext;
  final Color accentCyan;
  final Color primaryGold;
  final Color success;
  final Color warning;

  const AppThemeColors({
    required this.background,
    required this.surface,
    required this.card,
    required this.border,
    required this.text,
    required this.subtext,
    required this.accentCyan,
    required this.primaryGold,
    required this.success,
    required this.warning,
  });

  @override
  ThemeExtension<AppThemeColors> copyWith({
    Color? background,
    Color? surface,
    Color? card,
    Color? border,
    Color? text,
    Color? subtext,
    Color? accentCyan,
    Color? primaryGold,
    Color? success,
    Color? warning,
  }) {
    return AppThemeColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      card: card ?? this.card,
      border: border ?? this.border,
      text: text ?? this.text,
      subtext: subtext ?? this.subtext,
      accentCyan: accentCyan ?? this.accentCyan,
      primaryGold: primaryGold ?? this.primaryGold,
      success: success ?? this.success,
      warning: warning ?? this.warning,
    );
  }

  @override
  ThemeExtension<AppThemeColors> lerp(
    ThemeExtension<AppThemeColors>? other,
    double t,
  ) {
    if (other is! AppThemeColors) return this;
    return AppThemeColors(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      card: Color.lerp(card, other.card, t)!,
      border: Color.lerp(border, other.border, t)!,
      text: Color.lerp(text, other.text, t)!,
      subtext: Color.lerp(subtext, other.subtext, t)!,
      accentCyan: Color.lerp(accentCyan, other.accentCyan, t)!,
      primaryGold: Color.lerp(primaryGold, other.primaryGold, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
    );
  }

  // Pre-defined Dark Theme Model
  static const dark = AppThemeColors(
    background: Color(0xFF0A0A0A),
    surface: Color(0xFF1A1A1A),
    card: Color(0xFF161616),
    border: Color(0xFF262626),
    text: Colors.white,
    subtext: Color(0xFF8E8E93),
    accentCyan: Color(0xFF00F5FF),
    primaryGold: Color(0xFFF2B90D),
    success: Color(0xFF00E676),
    warning: Color(0xFFFFEA00),
  );

  // Pre-defined Light Theme Model
  static const light = AppThemeColors(
    background: Color(0xFFF8F9FA),
    surface: Colors.white,
    card: Color(0xFFFFFFFF),
    border: Color(0xFFE5E5EA),
    text: Colors.black,
    subtext: Color(0xFF636366),
    accentCyan: Color(0xFF00B8D4),
    primaryGold: Color(0xFFD4A017),
    success: Color(0xFF00C853),
    warning: Color(0xFFFFD600),
  );

  static AppThemeColors of(BuildContext context) {
    return Theme.of(context).extension<AppThemeColors>() ?? dark;
  }
}
