// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, must_be_immutable, curly_braces_in_flow_control_structures

import 'package:app/constants.dart';
import 'package:app/models/theme.dart';
import 'package:app/models/todo.dart';
import 'package:app/models/todo_components.dart';
import 'package:app/screens/add_new_todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class ToDoDashBoard extends StatefulWidget {
  @override
  State<ToDoDashBoard> createState() => _ToDoDashBoardState();
}

class _ToDoDashBoardState extends State<ToDoDashBoard> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    List<Category> categoriesList = Provider.of<ToDo>(context).getCateList();
    return Scaffold(
      floatingActionButton: isVisible
          ? FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                    child: Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Container(
                        child: BottomModalSheetTodo(),
                      ),
                    ),
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
            itemCount: categoriesList.length,
            itemBuilder: (context, index) {
              return TodoCategoryTile(
                categoryName: categoriesList[index].category,
              );
            },
          ),
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
