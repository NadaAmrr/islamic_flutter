

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/models/hadeth_model.dart';

class HadethTabProvider extends ChangeNotifier{
  List<HadethModel> hadethList = [];

  void loadFile() async {
    String ahadeth = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> list = ahadeth.split('#\r\n');
    for (int i = 0; i < list.length; i++) {
      List<String> content = list[i].split('\n');
      String header = content[0];
      content.removeAt(0);
      HadethModel hadethModel = HadethModel(header: header, content: content);
      hadethList.add(hadethModel);
    }
    notifyListeners();
  }
}