// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:app/components/delete_dialog.dart';
import 'package:app/components/error_box.dart';
import 'package:app/constants.dart';
import 'package:app/models/auth.dart';
import 'package:app/models/notes.dart';
import 'package:app/models/theme.dart';
import 'package:app/routers/routenames.dart';
import 'package:app/components/setting_tile.dart';
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
              child: SettingTile(title: 'Reset Password'),
            ),
            SizedBox(height: 15),
            GestureDetector(
                onTap: () {
                  Provider.of<CustomTheme>(context, listen: false)
                      .toggleTheme();
                },
                child: SettingTile(title: 'Theme')),
            SizedBox(height: 15),
            GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return DeleteDialog();
                      });
                },
                child: SettingTile(title: 'Delete all notes')),
            SizedBox(height: 15),
            GestureDetector(
                onTap: () {
                  Provider.of<Auth>(context, listen: false).logoutUser(context);
                },
                child: SettingTile(title: 'Logout')),
          ],
        ),
      ),
    );
  }
}
