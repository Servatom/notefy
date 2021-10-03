import 'package:app/Providers/auth.dart';
import 'package:app/components/inputfield.dart';
import 'package:app/constants.dart';
import 'package:app/screens/mainscreen.dart';
import 'package:app/screens/registerscreen.dart';
import 'package:flutter/material.dart';
import 'package:app/components/roundedbutton.dart';
import 'dashboard.dart';

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
