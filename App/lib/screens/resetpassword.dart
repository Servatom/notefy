import 'package:app/Providers/auth.dart';
import 'package:app/components/Roundedbutton.dart';
import 'package:app/components/inputfield.dart';
import 'package:app/constants.dart';
import 'package:app/screens/loginscreen.dart';
import 'package:app/screens/mainscreen.dart';
import 'package:flutter/material.dart';

class resetPassScreen extends StatefulWidget {
  static const String id = 'resetpass_screen';

  @override
  _resetPassScreenState createState() => _resetPassScreenState();
}

class _resetPassScreenState extends State<resetPassScreen> {
  String email = '';
  String name = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgcolor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 50,
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, MainScreen.id);
                    },
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: Image.asset(
                        'images/logo.png',
                        alignment: Alignment.center,
                        scale: 1.2,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    InputField(
                        obscure: false,
                        hinttext: "Enter the Old Password",
                        onChanged: (value) {
                          email = value;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    InputField(
                        obscure: false,
                        hinttext: 'Enter the New Password',
                        onChanged: (value) {
                          name = value;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    InputField(
                        obscure: true,
                        hinttext: 'Confirm New Password',
                        onChanged: (value) {
                          password = value;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    RoundedButton(
                      title: 'Confirm',
                      onPressed: () async {},
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
