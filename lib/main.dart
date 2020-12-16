import 'package:flutter/material.dart';
import 'package:niniland/Providers/SoundsProvider.dart';
import 'package:niniland/Screens/HomeScreen.dart';
import 'package:niniland/Screens/SoundPlayScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Services/PushNotificationsManager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PushNotificationsManager notificationsManager = PushNotificationsManager();
  notificationsManager.init();
  SharedPreferences.setMockInitialValues({});
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SoundsProvider(),
          child: MyApp(),
        ),
      ],
      child: MyApp(),
    ),
  );
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
      home: HomeScreen(),
    );
  }
}
