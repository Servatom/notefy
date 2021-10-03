import 'package:app/components/Roundedbutton.dart';
import 'package:app/components/inputfield.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email = '';
  String name = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgcolor,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Stack(children: [
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
            children: <Widget>[
              Column(
                children: [
                  Image.asset(
                    'images/logo.png',
                    alignment: Alignment.center,
                    scale: 1.2,
                  ),
                  SizedBox(height: 50),
                  InputField(
                      hinttext: "Email",
                      onChanged: (value) {
                        email = value;
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  InputField(
                      hinttext: 'Name',
                      onChanged: (value) {
                        name = value;
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  InputField(
                      hinttext: 'Password',
                      onChanged: (value) {
                        password = value;
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  RoundedButton(
                    title: 'Register',
                    onPressed: () async {
                      final response = await http.post(
                        Uri.parse(
                            'https://notefyapi.servatom.com/api/users/register/'),
                        body: {
                          "email": email,
                          "name": name,
                          "password": password
                        },
                      );
                      if (response.statusCode == 200) {
                        print("Success");
                      } else {
                        print("failed");
                        print(response.reasonPhrase);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
