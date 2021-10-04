// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  static const String id = 'Profile_screen';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text('Image'),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text('Change Avatar'),
              ),
              SizedBox(height: 50),
              Container(
                child: Text('Name'),
              ),
              SizedBox(height: 20),
              Container(
                child: Text('Email'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
