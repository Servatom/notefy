// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:app/constants.dart';
import 'package:app/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Splashscreen extends StatefulWidget {
  static const String id = 'splash_screen';

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void navigateToNextScreen() async {
    await Future.delayed(
      Duration(
        milliseconds: 3000,
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
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 150.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Agne',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Notefy',
                          textStyle: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Roboto',
                          ),
                          speed: const Duration(milliseconds: 200)),
                    ],
                    onTap: () {
                      // print("Tap Event");
                    },
                  ),
                ),
              ),
              Image.asset(
                'images/logo.png',
                alignment: Alignment.center,
                scale: 2,
              ),
            ],
          ),
        ));
  }
}
