import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:niniland/Helpers/AppTheme.dart';
import 'package:snappable/snappable.dart';

class SnapStars extends StatefulWidget {
  @override
  _SnapStartState createState() => _SnapStartState();
}

class _SnapStartState extends State<SnapStars> {
  double x = 10;
  double y = 10;

  bool isInProgress = false;

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<SnappableState>();
    return Stack(
      children: [
        Positioned.fill(
            child: Container(
          color: Colors.black,
        )),
        Positioned(
          bottom: 100,
          left: 0,
          right: 0,
          child: Snappable(
            snapOnTap: true,
            duration: Duration(milliseconds: 5000),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "روی اشیا کلیک کنید",
                  style: AppTheme.fontCreator(
                      15, FontWeights.medium, Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 1000),
          top: ScreenUtil().setHeight(y),
          left: ScreenUtil().setWidth(x),
          child: GestureDetector(
            onTap: () {
              if (isInProgress == false) {
                isInProgress = true;
                key.currentState.snap();
                Future.delayed(Duration(milliseconds: 2200)).then((value) {
                  getRandomPosition();
                  setState(() {});
                  isInProgress = false;
                });
              }
            },
            child: Snappable(
              key: key,
              duration: Duration(milliseconds: 2000),
              child: SvgPicture.asset(
                'assets/images/svg/moon.svg',
                width: ScreenUtil().setWidth(60),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        )
      ],
    );
  }

  void getRandomPosition() {
    x = Random().nextInt(160).roundToDouble();
    y = Random().nextInt(300).roundToDouble();
  }
}
