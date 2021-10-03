import 'package:flutter/material.dart';
import 'package:app/register.dart';
import 'package:app/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(
          color: Colors.blue,
        )),
        primaryTextTheme: const TextTheme(
            bodyText1: TextStyle(
          color: Colors.white,
          fontSize: 20,
        )),
        scaffoldBackgroundColor: Colors.grey[900],
      ),
    );
  }
}
