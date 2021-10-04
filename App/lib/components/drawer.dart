// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:app/screens/settingsreen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'profile.dart';

class DashboardDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: kbgcolor,
          child: Column(children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(
                left: 10,
                top: 50,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: kyellow,
                  size: 35,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Profile(),
            Spacer(),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.logout,
                    ),
                    color: kyellow,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                  Spacer(),
                  IconButton(
                    color: kyellow,
                    onPressed: () {
                      Navigator.pushNamed(context, settingscreen.id);
                    },
                    icon: Icon(
                      Icons.settings,
                    ),
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
