// lib/theme/app_typography.dart
import 'package:flutter/material.dart';

class AppTypography {
  static const String fontFamily = 'Poppins';
  
  static TextTheme get lightTextTheme {
    return const TextTheme(
      // Headers
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1E2714)), // Header 1
      displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF1E2714)), // Header 2
      displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E2714)), // Header 3
      headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E2714)), // Header 4
      headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E2714)), // Header 5
      titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E2714)), // Header 6
      titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1E2714)), // Header 7
      
      // Body
      bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF1E2714)), // Body 1
      bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF1E2714)), // Body 2
      
      // Caption
      bodySmall: TextStyle(fontSize: 12, color: Color(0xFF343C29)), // Caption
      
      // Small
      labelSmall: TextStyle(fontSize: 10, color: Color(0xFF343C29)), // Small
    );
  }
  
  static TextTheme get darkTextTheme {
    return const TextTheme(
      // Headers
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)), // Header 1
      displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)), // Header 2
      displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)), // Header 3
      headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)), // Header 4
      headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)), // Header 5
      titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)), // Header 6
      titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)), // Header 7
      
      // Body
      bodyLarge: TextStyle(fontSize: 16, color: Color(0xFFECEDEA)), // Body 1
      bodyMedium: TextStyle(fontSize: 14, color: Color(0xFFECEDEA)), // Body 2
      
      // Caption
      bodySmall: TextStyle(fontSize: 12, color: Color(0xFFD9DBD5)), // Caption
      
      // Small
      labelSmall: TextStyle(fontSize: 10, color: Color(0xFFD9DBD5)), // Small
    );
  }
}