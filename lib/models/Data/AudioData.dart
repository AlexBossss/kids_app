import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:ocarina/ocarina.dart';

class AudioData extends ChangeNotifier {
  OcarinaPlayer _mainThemePlayer;
  AudioCache _audioController;
  String _status = 'off';

  String get status => _status;

  AudioCache get audioController => _audioController;

  OcarinaPlayer get mainThemePlayer => _mainThemePlayer;

  void playRight() {
    if (_audioController != null) {
      _audioController.play('memorygame/sounds/success.mp3');
    }
  }

  void playWrong() {
    if (_audioController != null) {
      _audioController.play('memorygame/sounds/fail.mp3');
    }
  }

  void switchPlayerOff() {
    _mainThemePlayer.dispose();
    _mainThemePlayer = null;
    _audioController = null;
    _status = 'off';
    notifyListeners();
  }

  void startMainPlayer() async {
    _mainThemePlayer = OcarinaPlayer(loop: true, asset: 'assets/kids.mp3');
    await _mainThemePlayer.load();
    _mainThemePlayer.play();
    _audioController = AudioCache();
    _status = 'on';
    notifyListeners();
  }
}
