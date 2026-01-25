import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../constants/color_constants.dart';

/// Helper class for color-related utilities
class ColorHelper {
  /// Get color based on remaining seconds
  static Color getColorForSeconds(int seconds) {
    if (seconds > AppConstants.warningThreshold) {
      return ColorConstants.safeColor;
    } else if (seconds > AppConstants.criticalThreshold) {
      return ColorConstants.warningColor;
    } else {
      return ColorConstants.criticalColor;
    }
  }
  
  ColorHelper._();
}
