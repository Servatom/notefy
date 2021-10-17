// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'dart:ui';

import 'package:app/models/auth.dart';
import 'package:app/models/notes.dart';
import 'package:app/models/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class DeleteDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        backgroundColor:
            Provider.of<CustomTheme>(context, listen: false).isTheme
                ? kbgcolor
                : kpink,
        title: Text(
          'Do you want to delete all the tasks?',
          style: TextStyle(
            color: Provider.of<CustomTheme>(context, listen: false).isTheme
                ? Colors.white
                : Colors.black,
          ),
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        actions: [
          MaterialButton(
            minWidth: 60,
            height: 40,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 10,
            color: Provider.of<CustomTheme>(context, listen: false).isTheme
                ? kyellow
                : Color(0xFF8CD4CB),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          MaterialButton(
            minWidth: 60,
            height: 40,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 10,
            color: Colors.red,
            onPressed: () {
              String key = Provider.of<Auth>(context, listen: false).key;
              Provider.of<Notes>(context, listen: false).deleteAllNotes(key);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Delete All',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
