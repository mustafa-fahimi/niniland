import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CloudBackgroundWidget extends StatefulWidget {
  @override
  _CloudBackgroundWidgetState createState() => _CloudBackgroundWidgetState();
}

class _CloudBackgroundWidgetState extends State<CloudBackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(207, 368));
    return Stack(
      children: [
        Positioned(
          left: ScreenUtil().setWidth(-14),
          top: ScreenUtil().setHeight(-10),
          child: SvgPicture.asset(
            'assets/images/svg/cloud.svg',
            width: ScreenUtil().setWidth(50),
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          right: ScreenUtil().setWidth(-30),
          top: ScreenUtil().setHeight(10),
          child: SvgPicture.asset(
            'assets/images/svg/cloud.svg',
            width: ScreenUtil().setWidth(60),
            fit: BoxFit.fitWidth,
          ),
        ),
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
      ],
    );
  }
}
