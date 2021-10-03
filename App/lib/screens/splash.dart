import 'package:app/constants.dart';
import 'package:app/screens/mainscreen.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  static const String id = 'splash_screen';

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void navigateToNextScreen() async {
    await Future.delayed(
      Duration(
        milliseconds: 3200,
      ),
    );
    Navigator.pushNamed(context, MainScreen.id);
  }

  @override
  void initState() {
    navigateToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbgcolor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/notefy.png'),
          ],
        ));
  }
}
