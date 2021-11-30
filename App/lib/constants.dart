// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// main colour
const kbgcolor = Color(0xFF1A1A1A);

const kyellow = Color(0xFFF2E88B);
const kpink = Color(0xFFFFD9DF);

const kmelon = Color(0xFFF7B2AD);
const kcambridgeblue = Color(0xFF9ABCA7);
const ksilverpink = Color(0xFFCEB7B3);
const ksteelteal = Color(0xFF62929E);
const kgreenyellow = Color(0xFFDDF45B);
const klightpink = Color(0xFFfce4ec);

const kgreyblack = Color(0xFF424242);

// note tile
const kNoteTitle = Colors.white;
const kNoteBody = Colors.grey;
const kNotetime = Colors.grey;

final snackBarDeleteNotes = SnackBar(
  content: Text(
    'Poof! All notes deleted',
    style: TextStyle(
      fontSize: 20,
      fontFamily: 'roboto',
    ),
  ),
  duration: Duration(seconds: 2),
  backgroundColor: Colors.black,
);
final snackBarDeleteCategory = SnackBar(
  content: Text(
    'Poof! Category deleted',
    style: TextStyle(
      fontSize: 20,
      fontFamily: 'roboto',
    ),
  ),
  duration: Duration(seconds: 2),
  backgroundColor: Colors.black,
);
final snackBarDeleteItem = SnackBar(
  content: Text(
    'Item deleted',
    style: TextStyle(
      fontSize: 20,
      fontFamily: 'roboto',
    ),
  ),
  duration: Duration(seconds: 2),
  backgroundColor: Colors.black,
);
final snackBarDeleteAllCategories = SnackBar(
  content: Text(
    'Poof! All Categories deleted',
    style: TextStyle(
      fontSize: 20,
      fontFamily: 'roboto',
    ),
  ),
  duration: Duration(seconds: 2),
  backgroundColor: Colors.black,
);
