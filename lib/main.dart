import 'package:flutter/material.dart';
import 'package:niniland/Screens/MainScreen.dart';
import 'package:niniland/Screens/SoundsMenuScreen.dart';

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
      home: SoundsMenuScreen(),
    );
  }
}
