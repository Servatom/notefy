// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:app/components/error_box.dart';
import 'package:app/constants.dart';
import 'package:app/models/auth.dart';
import 'package:app/models/notes.dart';
import 'package:app/models/theme.dart';
import 'package:app/routers/routenames.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  static const String id = 'settings_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Settings',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            Icon(
              Icons.settings,
              color: kbgcolor,
            ),
          ],
        ),
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
                  Provider.of<CustomTheme>(context, listen: false)
                      .toggleTheme();
                },
                child: Sizedboxop(patanahi: 'Theme')),
            SizedBox(height: 15),
            GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return DeleteDialog();
                      });
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

class DeleteDialog extends StatelessWidget {
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
        'Do you want to delete all the tasks?',
        style: TextStyle(
          color: Colors.white,
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
          color: kyellow,
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
            print('hello');
            Navigator.pop(context);
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
        color: Provider.of<CustomTheme>(context).isTheme ? kgreyblack : kpink,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            patanahi,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Provider.of<CustomTheme>(context).isTheme
                  ? Colors.white
                  : Colors.black,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
