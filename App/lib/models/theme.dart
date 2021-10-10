// ignore_for_file: prefer_const_constructors

import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomTheme extends ChangeNotifier {
  bool isTheme = true;

  static ThemeData get darkTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(color: kyellow),
      primaryColor: kyellow,
      scaffoldBackgroundColor: kbgcolor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: kyellow,
        elevation: 8,
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(color: kpink),
      primaryColor: kyellow,
      scaffoldBackgroundColor: Colors.white,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: kpink,
        elevation: 8,
      ),
    );
  }

  void toggleTheme() {
    isTheme = !isTheme;
    setIsTheme();
    notifyListeners();
  }

  void getIsTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isTheme = preferences.getBool("isTheme") ?? true;
    // notifyListeners();
  }

  void setIsTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("isTheme", isTheme);
  }
}
