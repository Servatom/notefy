// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:app/components/drawer.dart';
import 'package:app/components/note_tile.dart';
import 'package:app/constants.dart';
import 'package:app/models/notes.dart';
import 'package:app/screens/notescreen.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  static const String id = 'dashboard';

  @override
  Widget build(BuildContext context) {
    final notesList = Notes().notesList;
    return Scaffold(
        backgroundColor: kbgcolor,
        drawer: DashboardDrawer(),
        appBar: AppBar(
          backgroundColor: kyellow,
          iconTheme: IconThemeData(color: kbgcolor),
          title: Text(
            'Notefy',
            style: TextStyle(
              color: kbgcolor,
              fontFamily: 'Roboto',
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kyellow,
          onPressed: () {
            Navigator.pushNamed(context, NoteScreen.id, arguments: NoteTile(title: '',body: ''));
          },
          child: Icon(
            Icons.add,
            color: kbgcolor,
            size: 30,
          ),
        ),
        body: ListView.builder(
          itemCount: notesList.length,
          itemBuilder: (context, index) {
            return NoteTile(
              title: notesList[index].title,
              body: notesList[index].body,
            );
          },
        ));
  }
}
