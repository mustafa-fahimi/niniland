import "dart:math" show pi;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:niniland/Components/CloudBackground.dart';
import 'package:niniland/Components/DashedContainer.dart';
import 'package:niniland/Helpers/AppTheme.dart';

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
