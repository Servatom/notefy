// ignore_for_file: use_key_in_widget_constructors

import 'package:app/screens/dashboard.dart';
import 'package:app/screens/loginscreen.dart';
import 'package:app/screens/mainscreen.dart';
import 'package:app/screens/notescreen.dart';
import 'package:app/screens/registerscreen.dart';
import 'package:app/screens/settingsreen.dart';
import 'package:app/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      initialRoute: Splashscreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        Splashscreen.id: (context) => Splashscreen(),
        MainScreen.id: (context) => MainScreen(),
        DashBoard.id: (context) => DashBoard(),
        settingscreen.id: (context) => settingscreen(),
      },
    );
  }
}
