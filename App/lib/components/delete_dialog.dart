// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, curly_braces_in_flow_control_structures

import 'dart:ui';

import 'package:app/models/auth.dart';
import 'package:app/models/notes.dart';
import 'package:app/models/theme.dart';
import 'package:app/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class DeleteDialog extends StatelessWidget {
  final String buttonTitle;
  final String boxTitle;
  final int toDelete;
  final String catID;
  final String itemId;
  DeleteDialog({
    required this.boxTitle,
    required this.buttonTitle,
    required this.toDelete,
    required this.catID,
    required this.itemId,
  });
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        backgroundColor:
            Provider.of<CustomTheme>(context, listen: false).isTheme
                ? kbgcolor
                : kpink,
        title: Text(
          boxTitle,
          style: TextStyle(
            color: Provider.of<CustomTheme>(context, listen: false).isTheme
                ? Colors.white
                : Colors.black,
          ),
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        actions: [
          MaterialButton(
            minWidth: 60,
            height: 40,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 10,
            color: Provider.of<CustomTheme>(context, listen: false).isTheme
                ? kyellow
                : Color(0xFF8CD4CB),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          MaterialButton(
            minWidth: 60,
            height: 40,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 10,
            color: Colors.red,
            onPressed: () {
              String key = Provider.of<Auth>(context, listen: false).key;
              if (toDelete == 1) {
                Provider.of<Notes>(context, listen: false).deleteAllNotes(key);
              }
              if (toDelete == 2) {
                Provider.of<ToDo>(context, listen: false)
                    .deleteCategory(key, catID);
              }
              if (toDelete == 3) {
                Provider.of<ToDo>(context, listen: false)
                    .deleteToDoItem(key, itemId);
              }
              if (toDelete == 4) {
                Provider.of<ToDo>(context, listen: false)
                    .deleteAllCategories(key);
              }
              Navigator.pop(context);
              if (toDelete == 1)
                ScaffoldMessenger.of(context).showSnackBar(snackBarDeleteNotes);
              if (toDelete == 2) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(snackBarDeleteCategory);
                Navigator.pop(context);
              }
              if (toDelete == 3) {
                ScaffoldMessenger.of(context).showSnackBar(snackBarDeleteItem);
              }
              if (toDelete == 4) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(snackBarDeleteAllCategories);
              }
            },
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                buttonTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
