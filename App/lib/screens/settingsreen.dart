// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables

import 'package:app/constants.dart';
import 'package:app/models/auth.dart';
import 'package:app/routers/routenames.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  static const String id = 'settings_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgcolor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        backgroundColor: kyellow,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: kbgcolor,
            size: 35,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.resetpasswordscreen);
              },
              child: Sizedboxop(patanahi: 'Reset Password'),
            ),
            SizedBox(height: 15),
            GestureDetector(
                onTap: () {
                  print('lmao');
                },
                child: Sizedboxop(patanahi: 'Theme')),
            SizedBox(height: 15),
            GestureDetector(
                onTap: () {
                  print('hello');
                },
                child: Sizedboxop(patanahi: 'Delete all notes')),
            SizedBox(height: 15),
            GestureDetector(
                onTap: () {
                  Provider.of<Auth>(context, listen: false).logoutUser(context);
                },
                child: Sizedboxop(patanahi: 'Logout')),
          ],
        ),
      ),
    );
  }
}

class Sizedboxop extends StatelessWidget {
  final String patanahi;
  Sizedboxop({required this.patanahi});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 400,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        color: kyellow,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            patanahi,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
