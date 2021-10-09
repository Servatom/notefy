// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables

import 'package:app/components/Roundedbutton.dart';
import 'package:app/components/error_box.dart';
import 'package:app/components/inputfield.dart';
import 'package:app/constants.dart';
import 'package:app/models/auth.dart';
import 'package:app/models/user.dart';
import 'package:app/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPassScreen extends StatefulWidget {
  static const String id = 'resetpass_screen';

  @override
  _ResetPassScreenState createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  bool hidePassword = true;
  bool spinner = false;
  String oldpassword = '';
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
                spinner
                    ? Center(
                        child: CircularProgressIndicator(
                          color: kyellow,
                        ),
                      )
                    : Column(
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
                              obscure: hidePassword,
                              hinttext: "Enter the Old Password",
                              textcontroller: controller1,
                              onChanged: (value) {
                                oldpassword = value;
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          InputField(
                              obscure: hidePassword,
                              hinttext: 'Enter the New Password',
                              textcontroller: controller2,
                              onChanged: (value) {
                                newpassword = value;
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          InputField(
                              obscure: hidePassword,
                              hinttext: 'Confirm New Password',
                              textcontroller: controller3,
                              onChanged: (value) {
                                confirmpassword = value;
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  hidePassword
                                      ? 'Show password'
                                      : 'Hide password',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                hidePassword
                                    ? Icon(
                                        Icons.visibility,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.visibility_off,
                                        color: Colors.white,
                                      ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RoundedButton(
                            title: 'Reset Password',
                            onPressed: () async {
                              try {
                                if (oldpassword == '') {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return ErrorBox(
                                            errorText:
                                                'Enter your old password',
                                            onpressed: () {
                                              Navigator.pop(context);
                                            });
                                      });
                                } else if (newpassword == confirmpassword) {
                                  setState(() {
                                    spinner = true;
                                  });
                                  String key =
                                      Provider.of<Auth>(context, listen: false)
                                          .key;
                                  await Provider.of<User>(context,
                                          listen: false)
                                      .resetPassword(
                                          key, oldpassword, newpassword);
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return ErrorBox(
                                            errorText: 'Password changed',
                                            onpressed: () {
                                              Navigator.pop(context);
                                            });
                                      });
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return ErrorBox(
                                            errorText:
                                                'New and confirm passwords does not match',
                                            onpressed: () {
                                              Navigator.pop(context);
                                            });
                                      });
                                }
                              } catch (e) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ErrorBox(
                                          errorText: e.toString(),
                                          onpressed: () {
                                            Navigator.pop(context);
                                          });
                                    });
                              } finally {
                                setState(() {
                                  spinner = false;
                                });
                              }

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
