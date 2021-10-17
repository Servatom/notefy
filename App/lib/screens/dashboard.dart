// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print, unused_import, curly_braces_in_flow_control_structures



import 'package:app/models/auth.dart';
import 'package:app/components/drawer.dart';
import 'package:app/components/note_tile.dart';
import 'package:app/constants.dart';
import 'package:app/models/note.dart';
import 'package:app/models/notes.dart';
import 'package:app/routers/routenames.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    List notesList = Provider.of<Notes>(context, listen: true).notesList;
    return Scaffold(
      drawer: DashboardDrawer(),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            snap: true,
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
                },
                icon: Icon(
                  Icons.search,
                ),
              )
            ],
          ),
        ],
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              if (!isVisible)
                setState(() {
                  isVisible = true;
                });
            } else if (notification.direction == ScrollDirection.reverse) {
              if (isVisible)
                setState(() {
                  isVisible = false;
                });
            }
            return true;
          },
          child: ListView.builder(
            itemCount: notesList.length,
            itemBuilder: (context, index) {
              return NoteTile(
                note: notesList[index],
              );
            },
          ),
        ),
      ),
      floatingActionButton: isVisible
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.noterscreen,
                  arguments: Note(
                    body: '',
                    title: '',
                    id: '',
                    createTime: '',
                    updateTime: '',
                  ),
                );
              },
              child: Icon(
                Icons.add,
                color: kbgcolor,
                size: 30,
              ),
            )
          : null,
    );
  }
}
