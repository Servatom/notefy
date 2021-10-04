// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'Profile_screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
