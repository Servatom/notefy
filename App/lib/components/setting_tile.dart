// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:app/constants.dart';
import 'package:app/models/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingTile extends StatelessWidget {
  final String title;
  SettingTile({required this.title});

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
            title,
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
