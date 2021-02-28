import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niniland/Helpers/AppTheme.dart';
import 'package:pimp_my_button/pimp_my_button.dart';
import 'package:snappable/snappable.dart';

class FireWorkScreen extends StatefulWidget {
  @override
  _FireWorkScreenState createState() => _FireWorkScreenState();
}

class _FireWorkScreenState extends State<FireWorkScreen> {
  double x = 100;
  double y = 100;
  bool isInProgress = false;
  AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onPanStart: (d) {
                setState(() {
                  SystemChrome.setEnabledSystemUIOverlays([]);
                  x = d.globalPosition.dx;
                  y = d.globalPosition.dy;
                });
                _controller.forward(from: 0.0);
              },
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: y - 10.h,
            left: x - 10.h,
            child: PimpedButton(
              particle: DemoParticle(),
              pimpedWidgetBuilder: (context, controller) {
                _controller = controller;
                return SizedBox(
                  width: 20.h,
                  height: 20.h,
                );
              },
            ),
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Snappable(
              snapOnTap: true,
              duration: Duration(milliseconds: 5000),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: ScreenUtil().screenWidth,
                  alignment: Alignment.center,
                  child: Text(
                    "روی صفحه کلیک کنید",
                    style: AppTheme.fontCreator(13, FontWeights.medium, Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getRandomPosition() {
    x = Random().nextInt(160).roundToDouble();
    y = Random().nextInt(300).roundToDouble();
  }
}

class DemoParticle extends Particle {
  @override
  void paint(Canvas canvas, Size size, progress, seed) {
    Random random = Random(seed);
    int randomMirrorOffset = random.nextInt(8) + 1;
    CompositeParticle(children: [
      Firework(),
      IntervalParticle(
        interval: Interval(0.2, 0.9, curve: Curves.easeIn),
        child: PoppingCircle(
          color: Colors.deepOrangeAccent,
        ),
      ),
      CircleMirror(
          numberOfParticles: 24,
          child: AnimatedPositionedParticle(
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 60.0),
            child: FadingRect(width: 2.0, height: 40.0, color: Color((random.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
          ),
          initialRotation: -pi / randomMirrorOffset),
      CircleMirror.builder(
          numberOfParticles: 30,
          particleBuilder: (index) {
            return IntervalParticle(
                child: AnimatedPositionedParticle(
                  begin: Offset(0.0, 30.0),
                  end: Offset(0.0, 50.0),
                  child: FadingTriangle(
                      baseSize: 6.0 + random.nextDouble() * 10.0,
                      heightToBaseFactor: 1.0 + random.nextDouble(),
                      variation: random.nextDouble(),
                      color: Color((random.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
                ),
                interval: Interval(
                  0.0,
                  0.8,
                ));
          },
          // division by 0 is not good ;)
          initialRotation: -pi / randomMirrorOffset + 8),
    ]).paint(canvas, size, progress, seed);
  }
}
