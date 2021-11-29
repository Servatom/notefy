// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:app/constants.dart';
import 'package:app/models/theme.dart';
import 'package:app/models/todo_components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoCategoryTile extends StatelessWidget {
  Category category;
  Function onTap;
  TodoCategoryTile({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 10,
      ),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: SizedBox(
          height: 125,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            color: Provider.of<CustomTheme>(context).isTheme
                ? kgreyblack
                : klightpink,
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    category.category,
                    style: TextStyle(color: kNoteTitle),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
