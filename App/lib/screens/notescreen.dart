import 'package:app/components/note_tile.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  static const String id = 'notescreen';
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  late String title;
  late String body;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as NoteTile;
    title = args.title;
    body = args.body;
    return Scaffold(
      backgroundColor: kbgcolor,
      appBar: AppBar(
        backgroundColor: kbgcolor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
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
            Expanded(
                child: TextFormField(
              initialValue: body,
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
