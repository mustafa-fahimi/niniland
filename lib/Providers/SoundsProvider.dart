import 'package:flutter/cupertino.dart';
import 'package:niniland/Models/SoundsModel.dart';

class SoundsProvider extends ChangeNotifier {
  int _activeDurationIndex = 0;
  List<SoundsModel> _soundsData = [
    SoundsModel("دوش حمام", "assets/audios/shower_sound.mp3", false),
    SoundsModel("جاروبرقی", "assets/audios/shower_sound.mp3", false),
    SoundsModel("قلب", "assets/audios/shower_sound.mp3", false),
  ];
  int _lastSoundPlayingIndex = -1;

  int get activeDurationIndex => _activeDurationIndex;
  int get soundsDataLength => _soundsData.length;
  int get lastSoundPlayingIndex => _lastSoundPlayingIndex;
  SoundsModel soundsData(index) => _soundsData[index];

  void setActiveDurationIndex(int value) {
    _activeDurationIndex = value;
    notifyListeners();
  }

  void setLastSoundPlayingIndex(int value){
    _lastSoundPlayingIndex = value;
    notifyListeners();
  }

  void toggleSoundsPlayState(int value){
    _soundsData[value].playState = !_soundsData[value].playState;
    notifyListeners();
  }

  void resetSoundsData(){
    _soundsData = [
      SoundsModel("دوش حمام", "assets/audios/shower_sound.mp3", false),
      SoundsModel("جاروبرقی", "assets/audios/shower_sound.mp3", false),
      SoundsModel("قلب", "assets/audios/shower_sound.mp3", false),
    ];
    notifyListeners();
  }
}
