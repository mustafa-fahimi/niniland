import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:niniland/Components/DashedContainer.dart';
import 'package:niniland/Helpers/AppTheme.dart';
import 'package:niniland/Helpers/EdgeInsetsShortener.dart';
import "dart:math" show pi;

import 'BuyDialog.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(207, 368));
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: ScreenUtil().setWidth(207),
          height: ScreenUtil().setHeight(368),
          color: AppTheme.lightBlue,
          child: Stack(
            children: [
              ///Cloud
              Positioned(
                left: ScreenUtil().setWidth(-14),
                top: ScreenUtil().setHeight(-10),
                child: SvgPicture.asset(
                  'assets/images/svg/cloud.svg',
                  width: ScreenUtil().setWidth(50),
                  fit: BoxFit.fitWidth,
                ),
              ),

              ///Cloud
              Positioned(
                right: ScreenUtil().setWidth(-30),
                top: ScreenUtil().setHeight(10),
                child: SvgPicture.asset(
                  'assets/images/svg/cloud.svg',
                  width: ScreenUtil().setWidth(60),
                  fit: BoxFit.fitWidth,
                ),
              ),

              ///Cloud
              Positioned(
                left: ScreenUtil().setWidth(-50),
                top: ScreenUtil().setHeight(140),
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(-5 / 360),
                  child: SvgPicture.asset(
                    'assets/images/svg/cloud.svg',
                    width: ScreenUtil().setWidth(130),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),

              ///Cloud
              Positioned(
                right: ScreenUtil().setWidth(-30),
                top: ScreenUtil().setHeight(185),
                child: Container(
                  child: RotationTransition(
                    turns: new AlwaysStoppedAnimation(-7 / 360),
                    child: SvgPicture.asset(
                      'assets/images/svg/cloud.svg',
                      width: ScreenUtil().setWidth(80),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),

              ///Cloud
              Positioned(
                left: ScreenUtil().setWidth(-30),
                bottom: ScreenUtil().setHeight(60),
                child: Container(
                  child: RotationTransition(
                    turns: new AlwaysStoppedAnimation(-10 / 360),
                    child: SvgPicture.asset(
                      'assets/images/svg/cloud.svg',
                      width: ScreenUtil().setWidth(60),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),

              ///Cloud
              Positioned(
                left: ScreenUtil().setWidth(-20),
                bottom: ScreenUtil().setHeight(-22),
                child: Container(
                  child: SvgPicture.asset(
                    'assets/images/svg/cloud.svg',
                    width: ScreenUtil().setWidth(100),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),

              ///Cloud
              Positioned(
                right: ScreenUtil().setWidth(-20),
                bottom: ScreenUtil().setHeight(17),
                child: Container(
                  child: SvgPicture.asset(
                    'assets/images/svg/cloud.svg',
                    width: ScreenUtil().setWidth(70),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),

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
                top: ScreenUtil().screenHeight * 0.3,
                child: DashedContainer(
                  height: 80,
                  child: Container(
                    alignment: Alignment.center,
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

              ///Moon logo
              Positioned(
                left: ScreenUtil().setWidth(7),
                top: ScreenUtil().setHeight(0),
                child: SvgPicture.asset(
                  'assets/images/svg/moon_aviz.svg',
                  width: ScreenUtil().setWidth(45),
                  fit: BoxFit.fitWidth,
                ),
              ),

              ///Entertainment Container
              Positioned(
                left: ScreenUtil().setWidth(12),
                right: ScreenUtil().setWidth(12),
                top: ScreenUtil().screenHeight * 0.57,
                child: DashedContainer(
                  height: 80,
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
            ],
          ),
        ),
      ),
    );
  }
}
