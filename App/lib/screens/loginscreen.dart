import 'package:app/Providers/auth.dart';
import 'package:app/components/inputfield.dart';
import 'package:app/constants.dart';
import 'package:app/screens/mainscreen.dart';
import 'package:app/screens/registerscreen.dart';
import 'package:flutter/material.dart';
import 'package:app/components/Roundedbutton.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgcolor,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Stack(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    hinttext: 'Email',
                    onChanged: (value) {
                      email = value;
                    }),
                SizedBox(
                  height: 20,
                ),
                InputField(
                    obscure: true,
                    hinttext: 'Password',
                    onChanged: (value) {
                      password = value;
                    }),
                SizedBox(
                  height: 20,
                ),
                RoundedButton(
                  onPressed: () async {
                    loginUser(email, password);
                  },
                  title: "Login",
                ),
                GestureDetector(
                  child: Text(
                    'New here? Register Now!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, RegisterScreen.id);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
