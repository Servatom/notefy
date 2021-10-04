// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class ProfileScreen extends StatefulWidget {
  static const String id = 'Profile_screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 62,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('images/parrot.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                child: Text(
                  'Change Avatar',
                  style: TextStyle(color: Colors.white, fontFamily: 'roboto'),
                ),
              ),
              SizedBox(height: 50),
              // ignore: avoid_unnecessary_containers
              Container(
                child: Text(
                  'Name',
                  style: TextStyle(
                      color: Colors.white, fontSize: 30, fontFamily: 'lobster'),
                ),
              ),
              SizedBox(height: 20),
              // ignore: avoid_unnecessary_containers
              Container(
                child: Text(
                  'Email',
                  style: TextStyle(
                      color: Colors.white, fontSize: 30, fontFamily: 'lobster'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
