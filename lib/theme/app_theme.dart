// lib/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  // Get Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppTypography.fontFamily,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightWhite500,
      
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary500,
        onPrimary: Colors.white,
        secondary: AppColors.secondary500,
        onSecondary: Colors.white,
        tertiary: AppColors.tertiary500,
        onTertiary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: AppColors.lightWhite500,
        onBackground: AppColors.lightDark500,
        surface: AppColors.lightWhite500,
        onSurface: AppColors.lightDark500,
      ),
      
      textTheme: AppTypography.lightTextTheme,
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary500,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      
      cardTheme: CardTheme(
        color: AppColors.lightWhite500,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightWhite500,
        foregroundColor: AppColors.lightDark500,
        elevation: 0,
      ),
      
      // Add more component themes as needed
    );
  }
  
  // Get Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppTypography.fontFamily,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkWhite500,
      
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primary500, // Keep accent color the same
        onPrimary: Colors.black,
        secondary: AppColors.secondary500,
        onSecondary: Colors.black,
        tertiary: AppColors.tertiary500,
        onTertiary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        background: AppColors.darkWhite500,
        onBackground: Colors.white,
        surface: AppColors.darkWhite90,
        onSurface: Colors.white,
      ),
      
      textTheme: AppTypography.darkTextTheme,
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary500,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      
      cardTheme: CardTheme(
        color: AppColors.darkWhite90,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkWhite500,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      
      // Add more component themes as needed
    );
  }
}