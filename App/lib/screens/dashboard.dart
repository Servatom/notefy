// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:app/constants.dart';
import 'package:app/models/notes.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  static const String id = 'dashboard';

  @override
  Widget build(BuildContext context) {
    final notesList = Notes().notesList;
    return Scaffold(
        backgroundColor: kbgcolor,
        appBar: AppBar(
          backgroundColor: kyellow,
          title: Text(
            'Notefy',
            style: TextStyle(color: kbgcolor),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.logout,
              color: kbgcolor,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
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
          child: Icon(
            Icons.add,
            color: kbgcolor,
            size: 30,
          ),
        ),
        body: ListView.builder(
            itemCount: notesList.length,
            itemBuilder: (context, index) {
              return Container();
            }));
  }
}
