import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islamic/core/api/api_manager.dart';
import 'package:islamic/models/radio_model.dart';

class RadioTabProvider extends ChangeNotifier {
  List<Radios> radios = [];
  final player = AudioPlayer();
  /// Radios
  getRadioData() async {
    radios = await ApiManager.getRadioData();
    notifyListeners();
  }

  /// Play
  play(int index) async{
    await player.play(UrlSource(radios[index].url ?? ""));
    notifyListeners();
  }

  /// pause
  pause() {
    player.pause();
    notifyListeners();
  }
}
