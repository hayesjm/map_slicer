import 'package:flutter/material.dart';

class AppColors {
  static const double themeHue = 180.0;

  static Color hsl(double saturation, double lightness) {
    return HSLColor.fromAHSL(1.0, themeHue, saturation, lightness).toColor();
  }

  static Color hsla(double saturation, double lightness, double alpha) {
    return HSLColor.fromAHSL(alpha, themeHue, saturation, lightness).toColor();
  }

  // Workspace
  static final workspaceBg = hsl(0.08, 0.10);

  // Panels
  static final panelHeaderBg = hsl(0.15, 0.15);
  static final panelHeaderFontColor = hsl(0.15, 0.60);
  static final panelBorder = hsla(0.10, 0.10, 0.08);
  static final panelBg = hsl(0.05, 0.25);

  // Control text
  static final controlLabel = hsl(0.15, 0.0);
  static final controlValue = hsl(0.15, 0.60);
  static final controlUnits = hsl(0.15, 0.60);
  static final valueBorder = hsl(0.15, 0.50);

  // Slider
  static final sliderActive = hsl(0.20, 0.62);
  static final sliderInactive = hsla(0.35, 0.42, 0.35);

  // Reset button states
  static final resetIdleBorder = hsl(0.15, 0.50);
  static final resetIdleFill = hsl(0.15, 0.35);

  static final resetDirtyBorder = hsl(0.15, 0.75);
  static final resetDirtyFill = hsl(0.15, 0.50);

}