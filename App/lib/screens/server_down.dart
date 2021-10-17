// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'dart:io';

import 'package:app/components/Roundedbutton.dart';
import 'package:app/constants.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ServerDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgcolor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
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
              height: 75,
            ),
            Text(
              'We are under maintenance. Please try again in sometime.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Sorry for the inconvenience!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            RoundedButton(
                title: 'Okay',
                onPressed: () {
                  exit(0);
                }),
          ],
        ),
      ),
    );
  }
}
