// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:app/constants.dart';
import 'package:app/models/auth.dart';
import 'package:app/models/theme.dart';
import 'package:app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class ProfileScreen extends StatefulWidget {
  static const String id = 'Profile_screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    String name = Provider.of<User>(context).name;
    String email = Provider.of<User>(context).email;
    String imageInfo = Provider.of<User>(context).avatar;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: CircleAvatar(
                  backgroundColor: Provider.of<CustomTheme>(context).isTheme
                      ? kyellow
                      : kbgcolor,
                  radius: 62,
                  child: isLoading
                      ? CircularProgressIndicator(
                          backgroundColor: kbgcolor,
                        )
                      : CircleAvatar(
                          backgroundColor:
                              Provider.of<CustomTheme>(context).isTheme
                                  ? kyellow
                                  : kbgcolor,
                          radius: 60,
                          backgroundImage: NetworkImage(imageInfo),
                        ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  String key = Provider.of<Auth>(context, listen: false).key;
                  await Provider.of<User>(context, listen: false)
                      .changeAvatar(key);
                  setState(() {
                    isLoading = false;
                  });
                },
                child: Text(
                  'Change Avatar',
                  style: TextStyle(
                    color: Provider.of<CustomTheme>(context).isTheme
                        ? Colors.white
                        : kbgcolor,
                    fontSize: 18,
                    fontFamily: 'roboto',
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          // 'Nirbhay Makhija',
                          name,
                          style: TextStyle(
                            color: Provider.of<CustomTheme>(context).isTheme
                                ? Colors.white
                                : kbgcolor,
                            fontSize: 20,
                            fontFamily: 'roboto',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Flexible(
                          child: Text(
                            // 'nirbhaymakhijachauhanalisha@gmail.com',
                            email,
                            style: TextStyle(
                              color: Provider.of<CustomTheme>(context).isTheme
                                  ? Colors.white
                                  : kbgcolor,
                              fontSize: 18,
                              fontFamily: 'roboto',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
