// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:app/constants.dart';
import 'package:app/models/note.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  static const String id = 'notescreen';
  final Note note;
  NoteScreen({required this.note});
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  late String title;
  late String body;
  void setVariable() {
    print(widget.note);
    if (widget.note != null) {
      print(widget.note.title);
      title = widget.note.title;
      body = widget.note.body;
    } else {
      title = '';
      body = '';
    }
  }

  @override
  void initState() {
    setVariable();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgcolor,
      appBar: AppBar(
        backgroundColor: kbgcolor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            // Notes().addNote(title, body);
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: kyellow,
            size: 35,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          children: [
            TextFormField(
              initialValue: title,
              onChanged: (value) {
                title = value;
              },
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                hintStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                ),
              ),
              onFieldSubmitted: (value) {},
            ),
            // Divider(height: 2,color: Colors.grey,)
            Expanded(
                child: TextFormField(
              initialValue: body,
              onChanged: (value) {
                body = value;
              },
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: 'Body',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
