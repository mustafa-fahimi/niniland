import 'package:flutter/material.dart';
import 'package:niniland/Games/FireWork.dart';
import 'package:niniland/Screens/MainScreen.dart';
import 'package:niniland/Screens/SoundsMenuScreen.dart';

import 'Games/SnapStars.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FireWork(),
    );
  }
}
