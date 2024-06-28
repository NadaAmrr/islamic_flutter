import 'package:flutter/material.dart';
import 'package:islamic/core/utils/app_assets.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLang = 'ar';
  ThemeMode appTheme = ThemeMode.light;

  /// Lang
  void changeLang(String lang) {
    if (appLang == lang) {
      return;
    }
    appLang = lang;
    notifyListeners();
  }

  /// theme
  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }

  bool isEng() {
    return appLang == "en";
  }

  /// Light
  bool isLightMode() {
    return appTheme == ThemeMode.light;
  }

  /// Dark
  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }
  /// Head Sebha
  String getSebhaHeadPath() {
    if (isLightMode()) {
      return AppAssets.headSebhaLogo;
    } else {
      return AppAssets.headSebhaDarkLogo;
    }
  }
  /// Body Sebha
  String getSebhaBodyPath() {
    if (isLightMode()) {
      return AppAssets.bodySebhaLogo;
    } else {
      return AppAssets.bodySebhaDarkLogo;
    }
  }
}
