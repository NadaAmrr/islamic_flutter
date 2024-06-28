
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraDetailsProvider extends ChangeNotifier {
  List<String> data = [];
  /// functions
  void loadFile(int index) async {
    String file = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = file.split('\n');
    // for (var i = 0; i < lines.length; ++i) {
    //   var o = lines[i];
    //
    // }
    data = lines;
    notifyListeners();
  }
}