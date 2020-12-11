import 'package:flutter/cupertino.dart';
import 'package:niniland/Models/SoundsModel.dart';

class SoundsProvider extends ChangeNotifier {
  int _activeDurationIndex = 0;
  List<SoundsModel> _soundsData = [
    SoundsModel("باران", "assets/audios/rain_sound.mp3", false),
    SoundsModel("رودخانه", "assets/audios/river_sound.mp3", false),
    SoundsModel("دریا", "assets/audios/sea_sound.mp3", false),
    SoundsModel("شوش", "assets/audios/female_shush_sound.mp3", false),
    SoundsModel("شوش با موسیقی", "assets/audios/shush_music_sound.mp3", false),
    SoundsModel("رحم", "assets/audios/utero_sound.mp3", false),
    SoundsModel("جعبه موسیفی", "assets/audios/music_box_sound.mp3", false),
    SoundsModel("جاروبرقی", "assets/audios/vacuum_cleaner_sound.mp3", false),
    SoundsModel("ماشین", "assets/audios/car_engine_sound.mp3", false),
    SoundsModel("قلب", "assets/audios/heartbeat_sound.mp3", false),
    SoundsModel("کابین هواپیما", "assets/audios/airplane_cabin_sound.mp3", false),
    SoundsModel("لباسشویی", "assets/audios/washing_machine_sound.mp3", false),
    SoundsModel("سشوار", "assets/audios/hairdryer_sound.mp3", false),
    SoundsModel("دوش حمام", "assets/audios/shower_sound.mp3", false),
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
      SoundsModel("باران", "assets/audios/rain_sound.mp3", false),
      SoundsModel("رودخانه", "assets/audios/river_sound.mp3", false),
      SoundsModel("دریا", "assets/audios/sea_sound.mp3", false),
      SoundsModel("شوش", "assets/audios/female_shush_sound.mp3", false),
      SoundsModel("شوش با موسیقی", "assets/audios/shush_music_sound.mp3", false),
      SoundsModel("رحم", "assets/audios/utero_sound.mp3", false),
      SoundsModel("جعبه موسیقی", "assets/audios/music_box_sound.mp3", false),
      SoundsModel("جاروبرقی", "assets/audios/vacuum_cleaner_sound.mp3", false),
      SoundsModel("ماشین", "assets/audios/car_engine_sound.mp3", false),
      SoundsModel("قلب", "assets/audios/heartbeat_sound.mp3", false),
      SoundsModel("کابین هواپیما", "assets/audios/airplane_cabin_sound.mp3", false),
      SoundsModel("لباسشویی", "assets/audios/washing_machine_sound.mp3", false),
      SoundsModel("سشوار", "assets/audios/hairdryer_sound.mp3", false),
      SoundsModel("دوش حمام", "assets/audios/shower_sound.mp3", false),
    ];
    notifyListeners();
  }
}
