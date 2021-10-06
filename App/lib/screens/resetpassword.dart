// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:app/components/Roundedbutton.dart';
import 'package:app/components/inputfield.dart';
import 'package:app/constants.dart';
import 'package:app/screens/mainscreen.dart';
import 'package:flutter/material.dart';

class ResetPassScreen extends StatefulWidget {
  static const String id = 'resetpass_screen';

  @override
  _ResetPassScreenState createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  String oldpassword1 = '';
  String newpassword = '';
  String confirmpassword = '';
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
                  padding: const EdgeInsets.only(top: 5),
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
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
                        
                        textcontroller: controller1,
                        onChanged: (value) {
                          oldpassword1 = value;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    InputField(
                        obscure: true,
                        hinttext: 'Enter the New Password',
                        textcontroller: controller2,
                        onChanged: (value) {
                          newpassword = value;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    InputField(
                        obscure: true,
                        hinttext: 'Confirm New Password',
                        textcontroller: controller3,
                        onChanged: (value) {
                        confirmpassword = value;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    RoundedButton(
                      title: 'Reset Password',
                      
                      onPressed: () async {
                        controller1.clear();
                        controller2.clear();
                        controller3.clear();
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
