import 'package:flutter/material.dart';
import '../constants/color_constants.dart';

/// App theme configuration
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 60, 139, 185),
      ),
      useMaterial3: true,
      
      // AppBar theme
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
      ),
      
      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      
      // Input decoration theme
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
      ),
    );
  }
  
  AppTheme._();
}
