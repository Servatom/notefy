// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, must_be_immutable, curly_braces_in_flow_control_structures

import 'package:app/components/todo_category_tile.dart';
import 'package:app/constants.dart';
import 'package:app/models/todo.dart';
import 'package:app/models/todo_components.dart';
import 'package:app/routers/routenames.dart';
import 'package:app/components/add_new_todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class ToDoDashBoard extends StatefulWidget {
  bool search;
  String toSearch;
  ToDoDashBoard(this.search, this.toSearch);
  @override
  State<ToDoDashBoard> createState() => _ToDoDashBoardState();
}

class _ToDoDashBoardState extends State<ToDoDashBoard> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    List<Category> tempList =
        Provider.of<ToDo>(context).getCateList(widget.toSearch);
    tempList.sort((a, b) => a.updatedAt.compareTo(b.updatedAt));
    List categoriesList = tempList.reversed.toList();
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
                        child: BottomModalSheetTodo(
                          title: 'Add Category',
                          buttonText: 'Add',
                          isCategory: true,
                          catId: '',
                        ),
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
          child: Column(
            children: [
              if (widget.search)
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                  child: TextField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {
                        widget.toSearch = value;
                      });
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search by category',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Color(0xFF3D3D3D),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: categoriesList.length,
                  itemBuilder: (context, index) {
                    return TodoCategoryTile(
                      category: categoriesList[index],
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.itemscreen,
                          arguments: categoriesList[index],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
