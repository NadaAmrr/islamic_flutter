

import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLang = 'en';
  void changeLang(String lang) {
    if (appLang == lang) {
      return;
    }
    appLang = lang;
    notifyListeners();
  }
}