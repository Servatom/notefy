// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, curly_braces_in_flow_control_structures

import 'package:app/constants.dart';
import 'package:app/models/theme.dart';
import 'package:app/models/todo_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'add_new_todo.dart';

class ItemsScreen extends StatefulWidget {
  final Category category;
  ItemsScreen({required this.category});
  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<CustomTheme>(context, listen: false).isTheme
          ? kbgcolor
          : Colors.white,
      floatingActionButton: isVisible
          ? FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                    child: Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: BottomModalSheetTodo(
                        title: 'Add Item',
                        buttonText: 'Add',
                        isCategory: false,
                        catId: widget.category.category,
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
      appBar: AppBar(
        backgroundColor:
            Provider.of<CustomTheme>(context, listen: false).isTheme
                ? kbgcolor
                : Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Provider.of<CustomTheme>(context, listen: false).isTheme
                ? kyellow
                : kpink,
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
        child: Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.category.category,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  // change the category name
                },
                maxLines: 1,
                style: TextStyle(
                  color:
                      Provider.of<CustomTheme>(context, listen: false).isTheme
                          ? Colors.white
                          : Colors.black,
                  fontSize: 30,
                ),
                decoration: InputDecoration(
                  hintText: 'Category Name',
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
                child: Text('items'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
