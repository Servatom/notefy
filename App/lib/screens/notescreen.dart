// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_print, unnecessary_null_comparison

import 'package:app/components/error_box.dart';
import 'package:app/constants.dart';
import 'package:app/models/auth.dart';
import 'package:app/models/note.dart';
import 'package:app/models/notes.dart';
import 'package:app/models/theme.dart';
import 'package:app/routers/routenames.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  late String noteID;
  var titleCopy = '';
  var bodyCopy = '';
  void setVariable() {
    print(widget.note);
    if (widget.note != null) {
      print(widget.note.title);
      title = widget.note.title;
      body = widget.note.body;
      noteID = widget.note.id;
    } else {
      title = '';
      body = '';
      noteID = '';
    }
    titleCopy = title;
    bodyCopy = body;
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
      backgroundColor: Provider.of<CustomTheme>(context, listen: false).isTheme
          ? kbgcolor
          : Colors.white,
      appBar: AppBar(
        backgroundColor:
            Provider.of<CustomTheme>(context, listen: false).isTheme
                ? kbgcolor
                : Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            if (title == '' && body == '' && noteID == '') {
              Navigator.pop(context);
            } else if (title == '') {
              showDialog(
                  context: context,
                  builder: (context) {
                    return ErrorBox(
                        errorText: 'Title cannot be empty',
                        onpressed: () {
                          Navigator.pop(context);
                        });
                  });
            } else if (body == '') {
              showDialog(
                  context: context,
                  builder: (context) {
                    return ErrorBox(
                        errorText: 'Body cannot be empty',
                        onpressed: () {
                          Navigator.pop(context);
                        });
                  });
            } else if (noteID == '') {
              String key = Provider.of<Auth>(context, listen: false).key;
              Provider.of<Notes>(context, listen: false)
                  .createNote(key, title, body);
              Navigator.pop(context);
            } else if (noteID != '') {
              if (title == titleCopy && body == bodyCopy) {
                Navigator.pop(context);
              } else {
                String key = Provider.of<Auth>(context, listen: false).key;
                Provider.of<Notes>(context, listen: false)
                    .updateNote(key, title, body, noteID);
                Navigator.pop(context);
              }
            }
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Provider.of<CustomTheme>(context, listen: false).isTheme
                ? kyellow
                : kbgcolor,
            size: 35,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              String key = Provider.of<Auth>(context, listen: false).key;
              Provider.of<Notes>(context, listen: false)
                  .deleteNote(key, noteID);
              Navigator.pushNamed(context, RouteNames.dashboard);
            },
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (title == '' && body == '' && noteID == '') {
            Navigator.pop(context);
          } else if (title == '') {
            showDialog(
                context: context,
                builder: (context) {
                  return ErrorBox(
                      errorText: 'Title cannot be empty',
                      onpressed: () {
                        Navigator.pop(context);
                      });
                });
          } else if (body == '') {
            showDialog(
                context: context,
                builder: (context) {
                  return ErrorBox(
                      errorText: 'Body cannot be empty',
                      onpressed: () {
                        Navigator.pop(context);
                      });
                });
          } else if (noteID == '') {
            String key = Provider.of<Auth>(context, listen: false).key;
            Provider.of<Notes>(context, listen: false)
                .createNote(key, title, body);
            Navigator.pop(context);
          } else if (noteID != '') {
            if (title == titleCopy && body == bodyCopy) {
              Navigator.pop(context);
            } else {
              String key = Provider.of<Auth>(context, listen: false).key;
              Provider.of<Notes>(context, listen: false)
                  .updateNote(key, title, body, noteID);
              Navigator.pop(context);
            }
          }

          return true;
        },
        child: Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            children: [
              TextFormField(
                initialValue: title == 'k' ? body.split(' ').first : title,
                onChanged: (value) {
                  title = value;
                },
                maxLines: 1,
                style: TextStyle(
                  color:
                      Provider.of<CustomTheme>(context, listen: false).isTheme
                          ? Colors.white
                          : Colors.black,
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
                    color:
                        Provider.of<CustomTheme>(context, listen: false).isTheme
                            ? Colors.grey
                            : Colors.black54,
                  ),
                ),
                onFieldSubmitted: (value) {},
              ),
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
                  color:
                      Provider.of<CustomTheme>(context, listen: false).isTheme
                          ? Colors.white
                          : Colors.black,
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
                    color:
                        Provider.of<CustomTheme>(context, listen: false).isTheme
                            ? Colors.grey
                            : Colors.black54,
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
