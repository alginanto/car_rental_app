// lib/theme/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary100 = Color(0xFFEFF5BD);
  static const Color primary200 = Color(0xFFE4ED9C);
  static const Color primary300 = Color(0xFFD6E47C);
  static const Color primary400 = Color(0xFFCDDF5B);
  static const Color primary500 = Color(0xFFBED839);
  static const Color primary600 = Color(0xFF9CB523);
  static const Color primary700 = Color(0xFF7C941E);
  static const Color primary800 = Color(0xFF5D7118);
  static const Color primary900 = Color(0xFF3E4D12);

  // Secondary Colors
  static const Color secondary100 = Color(0xFFCFFAE9);
  static const Color secondary200 = Color(0xFFAAF5D8);
  static const Color secondary300 = Color(0xFF84F0C8);
  static const Color secondary400 = Color(0xFF5CEAB7);
  static const Color secondary500 = Color(0xFF36E5A6);
  static const Color secondary600 = Color(0xFF1DB988);
  static const Color secondary700 = Color(0xFF158E6B);
  static const Color secondary800 = Color(0xFF0D634B);
  static const Color secondary900 = Color(0xFF053A2C);

  // Tertiary Colors
  static const Color tertiary100 = Color(0xFFF8CFDF);
  static const Color tertiary200 = Color(0xFFF29BC4);
  static const Color tertiary300 = Color(0xFFEC65A9);
  static const Color tertiary400 = Color(0xFFE62E8E);
  static const Color tertiary500 = Color(0xFFFF7A5E);
  static const Color tertiary600 = Color(0xFFB30060);
  static const Color tertiary700 = Color(0xFF85004F);
  static const Color tertiary800 = Color(0xFF57003E);
  static const Color tertiary900 = Color(0xFF2A002D);

  // Light Theme Colors
  static const Color lightDark500 = Color(0xFF1E2714);
  static const Color lightDark90 = Color(0xFF252C1A);
  static const Color lightDark80 = Color(0xFF343C29);
  static const Color lightDark20 = Color(0xFFB3B7AB);
  static const Color lightDark10 = Color(0xFFD9DBD5);
  static const Color lightDark5 = Color(0xFFECEDEA);

  static const Color lightGray500 = Color(0xFF808A7A);
  static const Color lightGray90 = Color(0xFF939B8D);
  static const Color lightGray80 = Color(0xFFA7ADA1);
  static const Color lightGray20 = Color(0xFFD8DBD4);
  static const Color lightGray10 = Color(0xFFEBEDE9);
  static const Color lightGray5 = Color(0xFFF5F6F4);

  static const Color lightLight500 = Color(0xFFDFE2DB);
  static const Color lightLight90 = Color(0xFFE2E5DF);
  static const Color lightLight80 = Color(0xFFE6E8E3);
  static const Color lightLight20 = Color(0xFFF2F3F1);
  static const Color lightLight10 = Color(0xFFF8F9F7);
  static const Color lightLight5 = Color(0xFFFBFCFB);

  static const Color lightWhite500 = Color(0xFFFFFFFF);
  static const Color lightWhite90 = Color(0xFFFAFAFA);
  static const Color lightWhite80 = Color(0xFFF5F5F5);
  static const Color lightWhite20 = Color(0xFFE6E6E6);
  static const Color lightWhite10 = Color(0xFFF2F2F2);
  static const Color lightWhite5 = Color(0xFFF9F9F9);

  // Dark Theme Colors
  static const Color darkDark500 = Color(0xFF121A0A);
  static const Color darkDark90 = Color(0xFF171F0F);
  static const Color darkDark80 = Color(0xFF1C241A);
  static const Color darkDark20 = Color(0xFF4A4F43);
  static const Color darkDark10 = Color(0xFF252A1E);
  static const Color darkDark5 = Color(0xFF1E211A);

  static const Color darkGray500 = Color(0xFF4D564A);
  static const Color darkGray90 = Color(0xFF5A6357);
  static const Color darkGray80 = Color(0xFF676F64);
  static const Color darkGray20 = Color(0xFF9EA098);
  static const Color darkGray10 = Color(0xFF7A7E76);
  static const Color darkGray5 = Color(0xFF6A6E67);

  static const Color darkLight500 = Color(0xFF2A2D26);
  static const Color darkLight90 = Color(0xFF30332C);
  static const Color darkLight80 = Color(0xFF363A31);
  static const Color darkLight20 = Color(0xFF555953);
  static const Color darkLight10 = Color(0xFF44483F);
  static const Color darkLight5 = Color(0xFF3B3F37);

  static const Color darkWhite500 = Color(0xFF1A1A1A);
  static const Color darkWhite90 = Color(0xFF212121);
  static const Color darkWhite80 = Color(0xFF282828);
  static const Color darkWhite20 = Color(0xFF333333);
  static const Color darkWhite10 = Color(0xFF2E2E2E);
  static const Color darkWhite5 = Color(0xFF2A2A2A);

  // Color Options
  static const Color option1 = Color(0xFF2ECC71);
  static const Color option2 = Color(0xFF16A085);
  static const Color option3 = Color(0xFF5E35B1);
  static const Color option4 = Color(0xFF1565C0);

  // Gradients
  static final LinearGradient gradient1 = LinearGradient(
    colors: [primary500, secondary500],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final LinearGradient gradient2 = LinearGradient(
    colors: [secondary500, Color(0xFF2196F3)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final LinearGradient gradient3 = LinearGradient(
    colors: [secondary500, tertiary500],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
