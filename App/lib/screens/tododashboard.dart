// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, must_be_immutable

import 'package:app/constants.dart';
import 'package:app/models/theme.dart';
import 'package:app/models/todo.dart';
import 'package:app/models/todo_components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToDoDashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Category> categoriesList = Provider.of<ToDo>(context).getCateList();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: ListView.builder(
          itemCount: categoriesList.length,
          itemBuilder: (context, index) {
            return TodoCategoryTile(
              categoryName: categoriesList[index].category,
            );
          },
        ),
      ),
    );
  }
}

class TodoCategoryTile extends StatelessWidget {
  String categoryName;
  TodoCategoryTile({required this.categoryName});

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
          print('todo category tile clicked');
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
                    categoryName,
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
