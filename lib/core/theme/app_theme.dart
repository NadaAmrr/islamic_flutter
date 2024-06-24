import 'package:flutter/material.dart';
import 'package:islamic/core/utils/app_colors.dart';

class AppTheme {
  static const AppBarTheme _appBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
  );

  /// Base text theme
  static const TextTheme _baseTextTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  );

  /// Base theme
  static final ThemeData _baseTheme = ThemeData(
    appBarTheme: _appBarTheme,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: _baseTextTheme,
  );

  /// Light theme
  static ThemeData lightTheme = _baseTheme.copyWith(
    primaryColor: AppColors.main,
    textTheme: _baseTextTheme.copyWith(
      titleLarge:
          _baseTextTheme.titleLarge?.copyWith(color: AppColors.textMain),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.main, selectedItemColor: AppColors.iconMain),
  );

  /// Dark theme
  static ThemeData darkTheme = _baseTheme.copyWith(
    primaryColor: AppColors.mainDark,
    textTheme: _baseTextTheme.copyWith(
      titleLarge:
          _baseTextTheme.titleLarge?.copyWith(color: AppColors.textDarkMain),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.mainDark,
        selectedItemColor: AppColors.iconMainDark),
  );
}
