import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islamic/core/utils/app_string.dart';
import 'package:islamic/models/radio_model.dart';

class ApiManager {
  /// Get Radio
  static Future<List<Radios>> getRadioData({String lang = 'ar'}) async {
    try {
      Uri uri = Uri.parse('${AppString.apiRadio}?language=$lang');
      var res = await http.get(uri);
      var json = jsonDecode(res.body);
      RadioModel model = RadioModel.fromJson(json ?? '');
      return model.radios ?? [];
    } catch (e) {
      throw e;
    }
  }
}
