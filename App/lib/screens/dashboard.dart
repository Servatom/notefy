// ignore: prefer_const_constructors
import 'package:app/components/drawer.dart';
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
        drawer: DashboardDrawer(),
        appBar: AppBar(
          backgroundColor: kyellow,
          iconTheme: IconThemeData(color: kbgcolor),
          // ignore: prefer_const_constructors
          title: Text(
            'Notefy',
            style: TextStyle(color: kbgcolor),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              // ignore: prefer_const_constructors
              icon: Icon(
                Icons.search,
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
          itemCount: notesList.length,
          itemBuilder: (context, index) {
            return Container();
          },
        ));
  }
}
