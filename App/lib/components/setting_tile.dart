// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:app/constants.dart';
import 'package:app/models/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final IconData icon;
  SettingTile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 400,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        color: Provider.of<CustomTheme>(context).isTheme ? kgreyblack : kpink,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 20,
            top: 10,
            bottom: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: Provider.of<CustomTheme>(context, listen: false).isTheme
                    ? Colors.white
                    : Colors.black,
                size: 28,
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Provider.of<CustomTheme>(context).isTheme
                      ? Colors.white
                      : Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
