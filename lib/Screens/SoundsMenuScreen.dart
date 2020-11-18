
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:niniland/Components/CloudBackground.dart';
import 'package:niniland/Components/DashedContainer.dart';
import 'package:niniland/Helpers/AppTheme.dart';
import 'package:niniland/Helpers/EdgeInsetsShortener.dart';
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
                Hero(
                  tag: 'bgHero',
                  child: CloudBackgroundWidget(),
                ),

                ///Top title
                Positioned(
                  left: 0,
                  right: 0,
                  top: -10.h,
                  child: DashedContainer(
                    height: 100,
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
                      margin: singleMargin(left: 60, top: 20),
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

                ///Moon logo
                Positioned(
                  left: ScreenUtil().setWidth(18),
                  top: -ScreenUtil().screenHeight * 0.11,
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

                ///Persian Lalayi Container
                Positioned(
                  left: ScreenUtil().setWidth(12),
                  right: ScreenUtil().setWidth(12),
                  top: ScreenUtil().screenHeight * 0.35,
                  child: DashedContainer(
                    height: 65,
                    onTap: () {},
                    child: Container(
                      width: ScreenUtil().screenWidth,
                      height: ScreenUtil().screenHeight,
                      alignment: Alignment.center,
                      child: Text(
                        "لالایی فارسی",
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
                  top: ScreenUtil().screenHeight * 0.3,
                  child: GestureDetector(
                    onTap: (){
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

                ///Special Sounds Container
                Positioned(
                  left: ScreenUtil().setWidth(12),
                  right: ScreenUtil().setWidth(12),
                  top: ScreenUtil().screenHeight * 0.58,
                  child: DashedContainer(
                    height: 65,
                    onTap: () {},
                    child: Container(
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

                ///Milk Bottle logo
                Positioned(
                  left: ScreenUtil().setWidth(7),
                  top: ScreenUtil().screenHeight * 0.65,
                  child: GestureDetector(
                    onTap: (){
                      _springKeyMilk.currentState.animate(motion: Motion.Play);
                    },
                    child: Spring(
                      key: _springKeyMilk,
                      animType: AnimType.FlipX,
                      motion: Motion.Pause,
                      animDuration: Duration(milliseconds: 600),
                      curve: Curves.ease,
                      animStatus: (status) {
                        if(status == AnimationStatus.completed){
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
      ),
    );
  }
}
