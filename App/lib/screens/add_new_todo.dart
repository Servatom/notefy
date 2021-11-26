// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:app/constants.dart';
import 'package:app/models/auth.dart';
import 'package:app/models/theme.dart';
import 'package:app/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomModalSheetTodo extends StatelessWidget {
  late String text;
  final String title;
  final String buttonText;
  final String catId;
  final bool isCategory; // true for category and false for item
  BottomModalSheetTodo({
    required this.title,
    required this.buttonText,
    required this.isCategory,
    required this.catId,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<CustomTheme>(context).isTheme
          ? Color(0xFF000000)
          : Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: kyellow,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: kbgcolor,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                text = value;
              },
              onSubmitted: (value) {
                String key = Provider.of<Auth>(context, listen: false).key;
                Provider.of<ToDo>(context, listen: false)
                    .createCategory(key, text);
                Navigator.pop(context);
              },
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                color: Provider.of<CustomTheme>(context).isTheme
                    ? kgreyblack
                    : kpink,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  String key = Provider.of<Auth>(context, listen: false).key;
                  if (isCategory) {
                    // creating a category
                    Provider.of<ToDo>(context, listen: false)
                        .createCategory(key, text);
                  } else {
                    // creating an item
                    Provider.of<ToDo>(context, listen: false).createItem(
                      key,
                      catId, // get catID
                      text,
                    );
                  }
                  Navigator.pop(context);
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      buttonText,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
