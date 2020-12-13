import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:niniland/Components/CloudBackgroundWidget.dart';
import 'package:niniland/Components/DashedContainerWidget.dart';
import 'package:niniland/Components/TimeContainerWidget.dart';
import 'package:niniland/Helpers/AppTheme.dart';
import 'package:niniland/Helpers/EdgeInsetsShortener.dart';
import 'package:niniland/Providers/SoundsProvider.dart';
import 'package:provider/provider.dart';
import 'package:spring/spring.dart';

class SoundPlayScreen extends StatefulWidget {
  final String state;

  SoundPlayScreen(this.state);

  @override
  _SoundPlayScreenState createState() => _SoundPlayScreenState();
}

class _SoundPlayScreenState extends State<SoundPlayScreen> {
  var soundsProvider;
  var _audioPlayer;
  var _playerTimer;
  final _springKeyPestonak = GlobalKey<SpringState>();
  var durationNamesList = {
    "10 دقیقه",
    "20 دقیقه",
    "40 دقیقه",
    "1 ساعت",
    "2 ساعت",
    "4 ساعت",
    "24 ساعت",
  };

  var durationMinutesList = {
    10,
    20,
    40,
    60,
    120,
    240,
    1440,
  };

  void startTimer() {
    _playerTimer = Timer(
        Duration(
          minutes: durationMinutesList.elementAt(soundsProvider.activeDurationIndex),
        ), () {
      _audioPlayer.stop();
      soundsProvider.resetSoundsData();
    });
  }

  void stopTimer() {
    _playerTimer.cancel();
  }

  @override
  void initState() {
    super.initState();
    _audioPlayer = AssetsAudioPlayer.newPlayer();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      soundsProvider.fillSoundsData(widget.state);
    });
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    if (_playerTimer != null) _playerTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    soundsProvider = Provider.of<SoundsProvider>(context);
    ScreenUtil.init(context, designSize: Size(207, 368));
    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: ScreenUtil().setWidth(207),
            height: ScreenUtil().setHeight(368),
            child: Stack(
              children: [
                ///Cloud Background
                Hero(
                  tag: 'bgHero',
                  child: CloudBackgroundWidget(),
                ),

                ///Top Container
                Positioned(
                  top: -10.h,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: DashedContainerWidget(
                          height: ScreenUtil().screenHeight * 0.16,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomRight: Radius.circular(47.w),
                            bottomLeft: Radius.circular(47.w),
                          ),
                          dotLineBorderRadius: FDottedLineCorner(
                            leftTopCorner: 0,
                            rightTopCorner: 0,
                            leftBottomCorner: 47.w,
                            rightBottomCorner: 47.w,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            margin: singleMargin(bottom: 20),
                            child: Text(
                              widget.state == "sound" ? "صداهای خاص" : "لالایی و موسیقی",
                              style: AppTheme.fontCreator(
                                28,
                                FontWeights.medium,
                                AppTheme.lightPink,
                                AppTheme.asemanFontName,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Container(
                          margin: singleMargin(top: 12),
                          child: Column(
                            children: [
                              ///Dotted Line
                              Padding(
                                padding: singleMargin(
                                  top: 12,
                                  bottom: 5,
                                ),
                                child: FDottedLine(
                                  color: Colors.white,
                                  width: ScreenUtil().screenWidth,
                                  strokeWidth: 2.0,
                                  dottedLength: 10.0,
                                  space: 3.0,
                                ),
                              ),

                              ///Times list
                              Container(
                                width: ScreenUtil().screenWidth,
                                height: 25.h,
                                child: ListView.builder(
                                  padding: singleMargin(
                                    right: 5,
                                    left: 3,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: durationNamesList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: singleMargin(
                                        left: 4,
                                      ),
                                      child: TimeContainerWidget(
                                        60,
                                        25,
                                        40,
                                        index,
                                        durationNamesList.elementAt(index),
                                        () {
                                          soundsProvider.setActiveDurationIndex(index);
                                          _audioPlayer.stop();
                                          soundsProvider.fillSoundsData(widget.state);
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),

                              ///Dotted Line
                              Padding(
                                padding: singleMargin(
                                  top: 7,
                                  bottom: 12,
                                ),
                                child: FDottedLine(
                                  color: Colors.white,
                                  width: ScreenUtil().screenWidth,
                                  strokeWidth: 2.0,
                                  dottedLength: 10.0,
                                  space: 3.0,
                                ),
                              ),

                              ///Musics List
                              Expanded(
                                child: ListView.builder(
                                  itemCount: soundsProvider.soundsDataLength,
                                  padding: allMargin(0),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: singleMargin(
                                        bottom: 10,
                                        right: 12,
                                        left: 12,
                                      ),
                                      child: DashedContainerWidget(
                                        height: 27.h,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                width: 15.w,
                                                height: 15.h,
                                                child: Consumer<SoundsProvider>(
                                                  builder: (context, soundsProv, child) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        ///If player is playing any audio and then click on play or pause icon,
                                                        /// we reset all list playingState to false
                                                        if (_audioPlayer.isPlaying.value) {
                                                          _audioPlayer.stop();
                                                          stopTimer();
                                                          soundsProv.fillSoundsData(widget.state);

                                                          ///If clicked icon wasn't the playing audio so we should play it
                                                          if (soundsProv.lastSoundPlayingIndex != index) {
                                                            print(soundsProv.soundsData(index).soundAddress);
                                                            _audioPlayer.open(
                                                              Audio(soundsProv.soundsData(index).soundAddress),
                                                              loopMode: LoopMode.single,
                                                              playInBackground: PlayInBackground.enabled,
                                                            );
                                                            startTimer();
                                                            soundsProv.setLastSoundPlayingIndex(index);
                                                            soundsProv.toggleSoundsPlayState(index);
                                                          }
                                                        } else {
                                                          print(soundsProv.soundsData(index).soundAddress);
                                                          _audioPlayer.open(
                                                            Audio(soundsProv.soundsData(index).soundAddress),
                                                            loopMode: LoopMode.single,
                                                            playInBackground: PlayInBackground.enabled,
                                                          );
                                                          startTimer();
                                                          soundsProv.setLastSoundPlayingIndex(index);
                                                          soundsProv.toggleSoundsPlayState(index);
                                                        }
                                                      },
                                                      child: SvgPicture.asset(
                                                        soundsProv.soundsData(index).playState
                                                            ? 'assets/images/svg/ic_pause_pink.svg'
                                                            : 'assets/images/svg/ic_play_pink.svg',
                                                        alignment: Alignment.centerLeft,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 7,
                                              child: Container(
                                                height: ScreenUtil().screenHeight,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  soundsProvider.soundsData(index).soundName,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: AppTheme.fontCreator(
                                                    20,
                                                    FontWeights.medium,
                                                    AppTheme.lightPink,
                                                    AppTheme.asemanFontName,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  right: ScreenUtil().screenWidth * 0.4,
                  top: ScreenUtil().screenHeight * 0.19,
                  child: GestureDetector(
                    onTap: () {
                      _springKeyPestonak.currentState.animate(motion: Motion.Play);
                    },
                    child: Spring(
                      key: _springKeyPestonak,
                      animType: AnimType.FlipX,
                      motion: Motion.Pause,
                      animDuration: Duration(milliseconds: 600),
                      curve: Curves.ease,
                      animStatus: (status) {
                        if (status == AnimationStatus.completed) {
                          _springKeyPestonak.currentState.animate(motion: Motion.Reverse);
                        }
                      },
                      child: SvgPicture.asset(
                        'assets/images/svg/pestonak.svg',
                        width: ScreenUtil().setWidth(38),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
