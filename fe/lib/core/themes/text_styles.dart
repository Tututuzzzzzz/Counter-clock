import 'package:flutter/material.dart';

/// Text styles for the app
class AppTextStyles {
  // Title styles
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  
  static const TextStyle screenTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
  );
  
  // Timer styles
  static TextStyle timerDisplay(Color color) => TextStyle(
    fontSize: 72,
    fontWeight: FontWeight.bold,
    color: color,
    fontFamily: 'monospace',
  );
  
  // Button styles
  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  
  // Body styles
  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
  );
  
  static const TextStyle inputLabel = TextStyle(
    fontSize: 18,
  );
  
  static const TextStyle inputText = TextStyle(
    fontSize: 18,
  );
  
  // Error styles
  static const TextStyle errorText = TextStyle(
    fontSize: 16,
    color: Colors.red,
  );
  
  static const TextStyle errorMessage = TextStyle(
    fontSize: 18,
    color: Colors.red,
  );
  
  // Info card styles
  static const TextStyle infoTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  
  static const TextStyle infoText = TextStyle(
    fontSize: 14,
  );
  
  static const TextStyle infoStatus = TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.italic,
  );
  
  AppTextStyles._();
}
