import 'package:flutter/material.dart';

class AppColors {
  /// Base
  static const main = Color(0xffB7935F);
  static const mainDark = Color(0xff141A2E);
  static const white = Color(0xffffffff);
  static const black = Color(0xff000000);
  static const yellow = Color(0xffFACC1D);

  /// Text
  static const textMain = Color(0xff242424);
  static const textDarkMain = Color(0xffF8F8F8);
  static const textDarkYellow = yellow;

  /// Icon
  static const iconMain = white;
  static const iconMainSelected = black;
  static const iconMainDark = white;
  static const iconMainDarkSelected  = yellow;

  /// Card
  static Color cardLight = white.withOpacity(0.7);
  static Color cardDark = black.withOpacity(0.7);
}
