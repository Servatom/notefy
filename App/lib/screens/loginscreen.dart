import 'package:app/components/inputfield.dart';
import 'package:app/constants.dart';
import 'package:app/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:app/components/Roundedbutton.dart';
import 'package:http/http.dart' as http;

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
                icon: Icon(Icons.keyboard_arrow_left,
                    color: Colors.white, size: 40),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo.png',
                  alignment: Alignment.center,
                  scale: 1.2,
                ),
                SizedBox(
                  height: 50,
                ),
                InputField(
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
                    final response = await http.post(
                        Uri.parse(
                            "https://notefyapi.servatom.com/api/auth/login/"),
                        body: {"email": email, "password": password});
                    if (response.statusCode == 200) {
                      print("Success");
                    } else {
                      print(response.reasonPhrase);
                    }
                  },
                  title: "Login",
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
