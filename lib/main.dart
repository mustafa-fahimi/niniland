import 'package:flutter/material.dart';
import 'package:niniland/Screens/HomeScreen.dart';

import 'Games/GameMainPage.dart';
import 'Games/SnapStars.dart';
import 'Helpers/PushNotificationsManager.dart';
import 'Screens/BuyDialog.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PushNotificationsManager notificationsManager = PushNotificationsManager();
  notificationsManager.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'بچه جون',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameMainPage(),
    );
  }

}
