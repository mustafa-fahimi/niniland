import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:niniland/Helpers/AppTheme.dart';
import 'package:niniland/Helpers/EdgeInsetsShortener.dart';
import 'package:slide_to_act/slide_to_act.dart';

import 'LightTouchScreen.dart';

class GameMainPage extends StatefulWidget {
  @override
  _GameMainPageState createState() => _GameMainPageState();
}

class _GameMainPageState extends State<GameMainPage> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: LightTouchScreen(),
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
  void dispose() {
    timer.cancel();
    super.dispose();
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
