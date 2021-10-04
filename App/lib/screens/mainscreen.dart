// ignore_for_file: use_key_in_widget_constructors

import 'package:app/constants.dart';
import 'package:app/routers/routenames.dart';
import 'package:flutter/material.dart';
import 'package:app/components/roundedbutton.dart';

class MainScreen extends StatelessWidget {
  static const String id = 'main_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgcolor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('images/notefy.png'),
            RoundedButton(
              title: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.login);
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            RoundedButton(
              title: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.register);
              },
            ),
          ],
        ),
      ),
    );
  }
}
