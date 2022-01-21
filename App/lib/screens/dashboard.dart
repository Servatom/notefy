// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print, unused_import, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables

import 'package:app/models/auth.dart';
import 'package:app/components/drawer.dart';
import 'package:app/components/note_tile.dart';
import 'package:app/constants.dart';
import 'package:app/models/note.dart';
import 'package:app/models/notes.dart';
import 'package:app/models/theme.dart';
import 'package:app/routers/routenames.dart';
import 'package:app/screens/notesdashboard.dart';
import 'package:app/screens/tododashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool search = false;
  String toSearch = '';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: DashboardDrawer(),
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.create),
              ),
              Tab(
                icon: Icon(Icons.check_box),
              ),
            ],
          ),
          iconTheme: IconThemeData(color: kbgcolor),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Notefy',
                style: TextStyle(
                  color: kbgcolor,
                  fontFamily: 'roboto',
                ),
              ),
              Image.asset(
                'images/logo.png',
                scale: 10,
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                print('hello');
                setState(() {
                  search = !search;
                  toSearch = '';
                });
              },
              icon: Icon(
                search ? Icons.clear : Icons.search,
                color: kbgcolor,
              ),
            )
          ],
        ),
        body: TabBarView(
          children: [
            NotesDashBoard(search, toSearch),
            ToDoDashBoard(search, toSearch),
          ],
        ),
      ),
    );
  }
}
