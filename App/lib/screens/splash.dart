// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:app/constants.dart';
import 'package:app/models/auth.dart';
import 'package:app/routers/routenames.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Splashscreen extends StatefulWidget {
  static const String id = 'splash_screen';

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void serverDownpage() async {
    await Future.delayed(
      Duration(
        milliseconds: 1500,
      ),
    );
    Navigator.pushNamed(context, RouteNames.serverdownpage);
  }

  void underMaintenance(context) async {
    try {
      http.Response response = await http.get(
        Uri.parse('https://notefyapi.servatom.com/'),
      );

      print('response code = ${response.statusCode}');
      if (response.statusCode == 404) {
        Provider.of<Auth>(context, listen: false).setKey();
        Provider.of<Auth>(context, listen: false).isLoggedIn(context);
      } else if (response.statusCode == 523) {
        serverDownpage();
      } else {
        throw 'error';
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // underMaintenance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    underMaintenance(context);
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
