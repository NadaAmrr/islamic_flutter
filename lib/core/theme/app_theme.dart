import 'package:flutter/material.dart';
import 'package:islamic/core/utils/app_colors.dart';

class AppTheme {
  /// === AppBar base theme
  static const AppBarTheme _appBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
  );

  /// ==== Base text theme
  static const TextTheme _baseTextTheme = TextTheme(
    /// Title large
    titleLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),

    /// Title Medium
    titleMedium: TextStyle(
        fontSize: 25, fontFamily: 'ElMessiri', fontWeight: FontWeight.w600),

    /// Title Small
    titleSmall: TextStyle(
        fontSize: 25, fontFamily: 'Inter', fontWeight: FontWeight.w400),

    /// Body Large
    bodyLarge: TextStyle(
        fontSize: 25, fontFamily: 'Inter', fontWeight: FontWeight.w400),

    /// Body Medium
    bodyMedium: TextStyle(
        fontSize: 25, fontFamily: 'Inter', fontWeight: FontWeight.w400),

    /// Body small
    bodySmall: TextStyle(
        fontSize: 20, fontFamily: 'Inter', fontWeight: FontWeight.w400),
  );

  /// ==== Base theme
  static final ThemeData _baseTheme = ThemeData(
    primaryColor: AppColors.main,
    primaryColorDark: AppColors.mainDark,
    appBarTheme: _appBarTheme,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: _baseTextTheme,
  );

  /// ==== Divider base theme
  static const DividerThemeData _divider = DividerThemeData(
    thickness: 3,
  );

  /// ==== Light theme
  static ThemeData lightTheme = _baseTheme.copyWith(
    primaryColor: AppColors.main,
    /// App Bar
    appBarTheme: _appBarTheme.copyWith(
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    /// text theme
    textTheme: _baseTextTheme.copyWith(
      titleLarge:
          _baseTextTheme.titleLarge?.copyWith(color: AppColors.textMain),
      titleMedium:
          _baseTextTheme.titleLarge?.copyWith(color: AppColors.textMain),
      titleSmall:
          _baseTextTheme.titleLarge?.copyWith(color: AppColors.textMain),
      bodyLarge: _baseTextTheme.titleLarge?.copyWith(color: AppColors.white),
      bodyMedium:
          _baseTextTheme.titleLarge?.copyWith(color: AppColors.textMain),
      bodySmall: _baseTextTheme.titleLarge?.copyWith(color: AppColors.textMain),
    ),

    /// bottom nav bar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.main,
        unselectedItemColor: AppColors.iconMain,
        selectedItemColor: AppColors.iconMainSelected,
        selectedLabelStyle: _baseTextTheme.bodySmall?.copyWith(fontSize: 12)),

    /// divider
    dividerTheme: _divider.copyWith(color: AppColors.main),

    /// card
    cardTheme: CardTheme(color: AppColors.cardLight),
  );

  /// ==== Dark theme
  static ThemeData darkTheme = _baseTheme.copyWith(
    primaryColor: AppColors.mainDark,
    /// App Bar
    appBarTheme: _appBarTheme.copyWith(
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    /// text theme
    textTheme: _baseTextTheme.copyWith(
      titleLarge:
          _baseTextTheme.titleLarge?.copyWith(color: AppColors.textDarkMain),
      titleMedium:
          _baseTextTheme.titleLarge?.copyWith(color: AppColors.textDarkMain),
      titleSmall:
          _baseTextTheme.titleLarge?.copyWith(color: AppColors.textDarkYellow),
      bodyLarge:
          _baseTextTheme.titleLarge?.copyWith(color: AppColors.textDarkMain),
      bodyMedium:
          _baseTextTheme.titleLarge?.copyWith(color: AppColors.textDarkMain),
      bodySmall:
          _baseTextTheme.titleLarge?.copyWith(color: AppColors.textDarkYellow),
    ),

    /// bottom nav bar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.mainDark,
        unselectedItemColor: AppColors.iconMainDark,
        selectedItemColor: AppColors.iconMainDarkSelected,
        selectedLabelStyle: _baseTextTheme.bodySmall
            ?.copyWith(fontSize: 12, color: AppColors.textDarkYellow)),

    /// divider
    dividerTheme: _divider.copyWith(color: AppColors.mainDark),

    /// card
    cardTheme: CardTheme(color: AppColors.cardDark),
  );
}
