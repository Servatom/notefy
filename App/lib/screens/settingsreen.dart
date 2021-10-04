import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class settingscreen extends StatelessWidget {
  static const String id = 'settings_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgcolor,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        backgroundColor: kyellow,
        leading: BackButton(),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            right: 20.0, left: 20.0, top: 20.0, bottom: 370),
        child: Column(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  print('xd');
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: kyellow),
                ),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  print('lmao');
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: kyellow),
                ),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: GestureDetector(
                // ignore: avoid_print
                onTap: () {
                  print('hello');
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: kyellow),
                ),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  print('object');
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: kyellow),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
