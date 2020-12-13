import "dart:math" show pi;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:niniland/Components/CloudBackgroundWidget.dart';
import 'package:niniland/Components/DashedContainerWidget.dart';
import 'package:niniland/Games/GameMainPage.dart';
import 'package:niniland/Helpers/AppTheme.dart';
import 'package:niniland/Screens/SoundsMenuScreen.dart';
import 'package:spring/spring.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _springKeyDuck = GlobalKey<SpringState>();
  final _springKeyMoon = GlobalKey<SpringState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(207, 368));
    return SafeArea(
      child: Scaffold(
        body: Material(
          type: MaterialType.transparency,
          child: Container(
            width: ScreenUtil().setWidth(207),
            height: ScreenUtil().setHeight(368),
            child: Stack(
              children: [
                ///Cloud Background
                CloudBackgroundWidget(),

                ///Main Logo top
                Positioned(
                  right: ScreenUtil().setWidth(55),
                  left: ScreenUtil().setWidth(55),
                  top: ScreenUtil().screenHeight * 0.04,
                  child: Image.asset(
                    'assets/images/png/main_logo.png',
                    fit: BoxFit.contain,
                  ),
                ),

                ///Sounds Container
                Positioned(
                  left: ScreenUtil().setWidth(12),
                  right: ScreenUtil().setWidth(12),
                  top: ScreenUtil().screenHeight * 0.27,
                  child: DashedContainerWidget(
                    height: 80,
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 800),
                          pageBuilder: (_, animation, __) => FadeTransition(
                            opacity: animation,
                            child: SoundsMenuScreen(),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: ScreenUtil().screenWidth,
                      height: ScreenUtil().screenHeight,
                      alignment: Alignment.center,
                      child: Hero(
                        tag: "sound_text",
                        child: Text(
                          "صداها",
                          style: AppTheme.fontCreator(
                            32,
                            FontWeights.medium,
                            AppTheme.lightPink,
                            AppTheme.asemanFontName,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                ///Moon logo
                Positioned(
                  left: ScreenUtil().setWidth(7),
                  top: ScreenUtil().setHeight(0),
                  child: Spring(
                    key: _springKeyMoon,
                    delay: Duration(milliseconds: 3000),
                    animType: AnimType.Slide_Out_Top,
                    motion: Motion.Play,
                    animDuration: Duration(milliseconds: 4000),
                    animStatus: (status) {
                      if (status == AnimationStatus.completed) {
                        _springKeyMoon.currentState.animate(motion: Motion.Reverse);
                      } else if (status == AnimationStatus.dismissed) {
                        Future.delayed(Duration(milliseconds: 6500)).then((value) {
                          _springKeyMoon.currentState.animate(motion: Motion.Play);
                        });
                      }
                    },
                    curve: Curves.bounceInOut,
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
                ),

                ///Entertainment Container
                Positioned(
                  left: ScreenUtil().setWidth(12),
                  right: ScreenUtil().setWidth(12),
                  top: ScreenUtil().screenHeight * 0.54,
                  child: DashedContainerWidget(
                    height: 80,
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 200),
                          pageBuilder: (_, animation, __) => FadeTransition(
                            opacity: animation,
                            child: GameMainPage(),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "سرگرمی",
                        style: AppTheme.fontCreator(
                          32,
                          FontWeights.medium,
                          AppTheme.lightPink,
                          AppTheme.asemanFontName,
                        ),
                      ),
                    ),
                  ),
                ),

                ///Duck logo
                Positioned(
                  right: ScreenUtil().setWidth(5),
                  top: ScreenUtil().screenHeight * 0.7,
                  child: Spring(
                    key: _springKeyDuck,
                    delay: Duration(milliseconds: 100),
                    animType: AnimType.Bubble,
                    motion: Motion.Mirror,
                    animDuration: Duration(milliseconds: 4000),
                    animStatus: (status) => null,
                    curve: Curves.elasticInOut,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
                      child: SvgPicture.asset(
                        'assets/images/svg/duck.svg',
                        width: ScreenUtil().setWidth(50),
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
