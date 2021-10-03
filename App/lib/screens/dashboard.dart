// ignore: prefer_const_constructors
import 'package:app/constants.dart';
import 'package:app/models/notes.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class DashBoard extends StatelessWidget {
  static const String id = 'dashboard';

  @override
  Widget build(BuildContext context) {
    final notesList = Notes().notesList;
    return Scaffold(
        backgroundColor: kbgcolor,
        appBar: AppBar(
          backgroundColor: kyellow,
          // ignore: prefer_const_constructors
          title: Text(
            'Notefy',
            style: TextStyle(color: kbgcolor),
          ),
          leading: IconButton(
            onPressed: () {},
            // ignore: prefer_const_constructors
            icon: Icon(
              Icons.logout,
              color: kbgcolor,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              // ignore: prefer_const_constructors
              icon: Icon(
                Icons.menu,
                color: kbgcolor,
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kyellow,
          onPressed: () {},
          // ignore: prefer_const_constructors
          child: Icon(
            Icons.add,
            color: kbgcolor,
            size: 30,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Container();
          },
          itemCount: notesList.length,
        ));
  }
}
