
import 'package:app/screens/loginscreen.dart';
import 'package:app/screens/mainscreen.dart';
import 'package:app/screens/registerscreen.dart';
import 'package:app/screens/splash.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Splashscreen.id,
      routes: {
        LoginScreen.id: (context)=> LoginScreen(),
        RegisterScreen.id: (context)=> RegisterScreen(),
        Splashscreen.id:  (context)=> Splashscreen(),
        MainScreen.id: (context)=> MainScreen(),

      },
    );
      
   
  }
}