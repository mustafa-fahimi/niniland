import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:niniland/Components/CloudBackgroundWidget.dart';
import 'package:niniland/Components/DashedContainerWidget.dart';
import 'package:niniland/Helpers/AppTheme.dart';
import 'package:niniland/Helpers/EdgeInsetsShortener.dart';
import 'package:niniland/Screens/SoundPlayScreen.dart';
import 'package:spring/spring.dart';

class SoundsMenuScreen extends StatefulWidget {
  @override
  _SoundsMenuScreenState createState() => _SoundsMenuScreenState();
}

class _SoundsMenuScreenState extends State<SoundsMenuScreen> {
  final _springKeyPestonak = GlobalKey<SpringState>();
  final _springKeyMilk = GlobalKey<SpringState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        body: Container(
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
                          margin: singleMargin(left: 60, top: 10),
                          child: Text(
                            "صداها",
                            style: AppTheme.fontCreator(
                              40,
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
                      child: Container(),
                    ),
                  ],
                ),
              ),

              ///Moon Logo
              Positioned(
                left: ScreenUtil().setWidth(18),
                top: -ScreenUtil().screenHeight * 0.12,
                child: Hero(
                  tag: 'moonHero',
                  transitionOnUserGestures: true,
                  child: SvgPicture.asset(
                    'assets/images/svg/moon_aviz.svg',
                    width: ScreenUtil().setWidth(45),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),

              ///Special sounds Container
              Positioned(
                left: ScreenUtil().setWidth(12),
                right: ScreenUtil().setWidth(12),
                top: ScreenUtil().screenHeight * 0.38,
                child: DashedContainerWidget(
                  height: 65,
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 200),
                        pageBuilder: (_, animation, __) => FadeTransition(
                          opacity: animation,
                          child: SoundPlayScreen("sound"),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    height: ScreenUtil().screenHeight,
                    alignment: Alignment.center,
                    child: Text(
                      "صداهای خاص",
                      style: AppTheme.fontCreator(
                        26,
                        FontWeights.medium,
                        AppTheme.lightPink,
                        AppTheme.asemanFontName,
                      ),
                    ),
                  ),
                ),
              ),

              ///Pestonak logo
              Positioned(
                right: ScreenUtil().setWidth(7),
                top: ScreenUtil().screenHeight * 0.32,
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

              ///Lullabies Container
              Positioned(
                left: ScreenUtil().setWidth(12),
                right: ScreenUtil().setWidth(12),
                top: ScreenUtil().screenHeight * 0.6,
                child: DashedContainerWidget(
                  height: 65,
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 200),
                        pageBuilder: (_, animation, __) => FadeTransition(
                          opacity: animation,
                          child: SoundPlayScreen("lullaby"),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "لالایی و موسیقی",
                      style: AppTheme.fontCreator(
                        26,
                        FontWeights.medium,
                        AppTheme.lightPink,
                        AppTheme.asemanFontName,
                      ),
                    ),
                  ),
                ),
              ),

              ///Milk Bottle logo
              Positioned(
                left: ScreenUtil().setWidth(7),
                top: ScreenUtil().screenHeight * 0.68,
                child: GestureDetector(
                  onTap: () {
                    _springKeyMilk.currentState.animate(motion: Motion.Play);
                  },
                  child: Spring(
                    key: _springKeyMilk,
                    animType: AnimType.FlipX,
                    motion: Motion.Pause,
                    animDuration: Duration(milliseconds: 600),
                    curve: Curves.ease,
                    animStatus: (status) {
                      if (status == AnimationStatus.completed) {
                        _springKeyMilk.currentState.animate(motion: Motion.Reverse);
                      }
                    },
                    child: SvgPicture.asset(
                      'assets/images/svg/milk_bottle.svg',
                      width: ScreenUtil().setWidth(35),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
