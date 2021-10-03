import 'package:app/constants.dart';
import 'package:app/screens/loginscreen.dart';
import 'package:app/screens/registerscreen.dart';
import 'package:flutter/material.dart';
import 'package:app/components/Roundedbutton.dart';

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
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            RoundedButton(
              title: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
