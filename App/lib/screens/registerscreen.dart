// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:app/models/auth.dart';
import 'package:app/components/error_box.dart';
import 'package:app/components/roundedbutton.dart';
import 'package:app/components/inputfield.dart';
import 'package:app/constants.dart';
import 'package:app/routers/routenames.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email = '';
  String name = '';
  String password = '';
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
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
                      Navigator.pushNamed(context, RouteNames.mainscreen);
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
                        hinttext: "Email",
                        textcontroller: controller1,
                        onChanged: (value) {
                          email = value;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    InputField(
                        obscure: false,
                        hinttext: 'Name',
                        textcontroller: controller2,
                        onChanged: (value) {
                          name = value;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    InputField(
                        obscure: true,
                        hinttext: 'Password',
                        textcontroller: controller3,
                        onChanged: (value) {
                          password = value;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    RoundedButton(
                      title: 'Register',
                      onPressed: () async {
                        try {
                          await Provider.of<Auth>(context, listen: false)
                              .registerUser(email, name, password);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ErrorBox(
                                  errorText:
                                      'User registered. Check your email and verify your account.',
                                  onpressed: () {
                                    controller1.clear();
                                    controller2.clear();
                                    controller3.clear();
                                    Navigator.pushNamed(
                                        context, RouteNames.mainscreen);
                                  },
                                );
                              });
                        } catch (e) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ErrorBox(
                                  errorText: e.toString(),
                                  onpressed: () {
                                    controller1.clear();
                                    controller2.clear();
                                    controller3.clear();
                                    Navigator.pop(context);
                                  },
                                );
                              });
                        }
                      },
                    ),
                    GestureDetector(
                      child: Text(
                        'Already a user? Login Here!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.login);
                      },
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
