import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData dark() {
    final base = ThemeData.dark();

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.workspaceBg,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.sliderActive,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 3,
        ),
        border: OutlineInputBorder(),
      ),
      sliderTheme: base.sliderTheme.copyWith(
        activeTrackColor: AppColors.sliderActive,
        inactiveTrackColor: AppColors.sliderInactive,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.controlLabel,
          textStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}