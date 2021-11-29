// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, use_key_in_widget_constructors

import 'package:app/components/note_tile.dart';
import 'package:app/models/note.dart';
import 'package:app/models/notes.dart';
import 'package:app/routers/routenames.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:app/constants.dart';

class NotesDashBoard extends StatefulWidget {
  @override
  State<NotesDashBoard> createState() => _NotesDashBoardState();
}

class _NotesDashBoardState extends State<NotesDashBoard> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    List tempList = Provider.of<Notes>(context, listen: true).notesList;
    List notesList = tempList.reversed.toList();
    return Scaffold(
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
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
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
    );
  }
}
