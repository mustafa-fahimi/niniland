import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niniland/Games/FireWork.dart';
import 'package:niniland/Games/turn_on_the_light.dart';
import 'package:niniland/Helpers/AppTheme.dart';
import 'package:niniland/Helpers/EdgeInsetsShortener.dart';
import 'package:slide_to_act/slide_to_act.dart';

class GameMainPage extends StatefulWidget {
  @override
  _GameMainPageState createState() => _GameMainPageState();
}

class _GameMainPageState extends State<GameMainPage> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 4), (timer) {
      setState(() {
        index = index == 1 ? 0 : 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(207, 368));
    return WillPopScope(
      onWillPop: _onWillPop,
      child: IndexedStack(
        index: index,
        children: [
          FireWork(),
          TurnOnTheLight(),
        ],
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) {
            return DialogExit();
          },
        )) ??
        false;
  }
}

class DialogExit extends StatefulWidget {
  @override
  _DialogExitState createState() => _DialogExitState();
}

class _DialogExitState extends State<DialogExit> {
  int time = 5;
  var timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (time == 0) {
        Navigator.of(context).pop(false);
        timer.cancel();
      } else {
        setState(() {
          time = time - 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(child: child, scale: animation);
            },
            child: Text(
              time.toString(),
              key: ValueKey<int>(time),
              style: AppTheme.fontCreator(
                32,
                FontWeights.medium,
                AppTheme.lightPink,
                AppTheme.asemanFontName,
              ),
            ),
          ),
          Container(
            padding: singleMargin(left: 12, right: 12),
            child: SlideAction(
              alignment: Alignment.center,
              child: Text(
                "برای خروج دکمه را بکشید",
                style: AppTheme.fontCreator(
                  8,
                  FontWeights.medium,
                  AppTheme.darkBlue,
                  AppTheme.iransansFontName,
                ),
              ),
              innerColor: AppTheme.lightPink,
              outerColor: Colors.white,
              onSubmit: () {
                Navigator.of(context).pop(true);
                timer.cancel();
              },
            ),
          ),
        ],
      ),
    );
  }
}
