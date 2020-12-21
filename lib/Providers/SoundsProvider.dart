import 'package:flutter/cupertino.dart';
import 'package:niniland/Models/SoundsModel.dart';

class SoundsProvider extends ChangeNotifier {
  int _activeDurationIndex = 0;
  List<SoundsModel> _soundsData = new List<SoundsModel>();
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

  ///Can be used for either filling sounds data or reset data
  void fillSoundsData(String state){
    if(state == "sound"){
      _soundsData = [
        SoundsModel("باران", "assets/audios/sounds/rain_sound.mp3", false),
        SoundsModel("رودخانه", "assets/audios/sounds/river_sound.mp3", false),
        SoundsModel("دریا", "assets/audios/sounds/sea_sound.mp3", false),
        SoundsModel("شوش", "assets/audios/sounds/female_shush_sound.mp3", false),
        SoundsModel("شوش با موسیقی", "assets/audios/sounds/shush_music_sound.mp3", false),
        SoundsModel("رحم", "assets/audios/sounds/utero_sound.mp3", false),
        SoundsModel("جعبه موسیقی", "assets/audios/sounds/music_box_sound.mp3", false),
        SoundsModel("جاروبرقی", "assets/audios/sounds/vacuum_cleaner_sound.mp3", false),
        SoundsModel("ماشین", "assets/audios/sounds/car_engine_sound.mp3", false),
        SoundsModel("قلب", "assets/audios/sounds/heartbeat_sound.mp3", false),
        SoundsModel("کابین هواپیما", "assets/audios/sounds/airplane_cabin_sound.mp3", false),
        SoundsModel("لباسشویی", "assets/audios/sounds/washing_machine_sound.mp3", false),
        SoundsModel("سشوار", "assets/audios/sounds/hairdryer_sound.mp3", false),
        SoundsModel("دوش حمام", "assets/audios/sounds/shower_sound.mp3", false),
      ];
    }else if(state == "lullaby"){
      _soundsData = [
        SoundsModel("لالایی گل لالا", "assets/audios/lullabies/lalayi_gole_lala.mp3", false),
        SoundsModel("عروسک من", "assets/audios/lullabies/aroosake_ghashange_man.mp3", false),
        SoundsModel("گنجشک لالا", "assets/audios/lullabies/gonjishk_lala.mp3", false),
        SoundsModel("لالایی گل پونه", "assets/audios/lullabies/lalayi_gole_pone.mp3", false),
        SoundsModel("لالایی گل زیره", "assets/audios/lullabies/gole_zire.mp3", false),
        SoundsModel("موسیقی اول", "assets/audios/lullabies/music1.mp3", false),
        SoundsModel("موسیقی دوم", "assets/audios/lullabies/music2.mp3", false),
        SoundsModel("موسیقی سوم", "assets/audios/lullabies/music3.mp3", false),
        SoundsModel("موسیقی چهارم", "assets/audios/lullabies/music4.mp3", false),
      ];
    }
    notifyListeners();
  }

}
