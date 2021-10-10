// ignore_for_file: use_key_in_widget_constructors

import 'package:app/constants.dart';
import 'package:app/models/theme.dart';
import 'package:app/routers/routenames.dart';
import 'package:flutter/material.dart';
import 'package:app/components/roundedbutton.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    Provider.of<CustomTheme>(context, listen: false).getIsTheme();
    super.initState();
  }

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
