// ignore_for_file: prefer_const_constructors

import 'package:app/Providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class ProfileScreen extends StatefulWidget {
  static const String id = 'Profile_screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    String name = Provider.of<Auth>(context).name;
    String email = Provider.of<Auth>(context).email;
    String imageInfo = Provider.of<Auth>(context).avatar;
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
                    backgroundImage: NetworkImage(imageInfo),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<Auth>(context, listen: false).changeAvatar();
                },
                child: Text(
                  'Change Avatar',
                  style: TextStyle(color: Colors.white, fontFamily: 'roboto'),
                ),
              ),
              SizedBox(height: 50),
              Container(
                child: Text(
                  name,
                  style: TextStyle(
                      color: Colors.white, fontSize: 30, fontFamily: 'lobster'),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Text(
                  email,
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
