// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  final String errorText;
  ErrorBox({required this.errorText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      backgroundColor: kbgcolor,
      title: Text(
        errorText,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      actions: [
        MaterialButton(
          minWidth: 60,
          height: 40,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          color: kyellow,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Okay',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
