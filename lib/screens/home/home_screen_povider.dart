
import 'package:flutter/material.dart';

class HomeScreenPovider extends ChangeNotifier {
  int selectedIndex = 0;
  getIndexTab(index) {
    selectedIndex = index;
    notifyListeners();
  }

}