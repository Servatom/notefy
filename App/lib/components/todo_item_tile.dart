// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, must_be_immutable, prefer_const_constructors

import 'package:app/constants.dart';
import 'package:app/models/auth.dart';
import 'package:app/models/theme.dart';
import 'package:app/models/todo.dart';
import 'package:app/models/todo_components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoItemListTile extends StatefulWidget {
  late TodoItem item;
  TodoItemListTile({
    required this.item,
  });

  @override
  State<TodoItemListTile> createState() => _TodoItemListTileState();
}

class _TodoItemListTileState extends State<TodoItemListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.item.item,
        style: TextStyle(
          fontSize: 18,
          color: Provider.of<CustomTheme>(context, listen: false).isTheme
              ? Colors.white
              : Colors.black,
          decoration: widget.item.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Theme(
            data: ThemeData(
              unselectedWidgetColor:
                  Provider.of<CustomTheme>(context, listen: false).isTheme
                      ? kyellow
                      : kbgcolor,
            ),
            child: Checkbox(
              value: widget.item.isDone,
              onChanged: (value) {
                String key = Provider.of<Auth>(context, listen: false).key;

                widget.item.isDone = !widget.item.isDone;
                print(widget.item.isDone);
                Provider.of<ToDo>(context, listen: false).updateToDoItem(
                  key,
                  widget.item.id,
                  widget.item.isDone,
                  widget.item.item,
                );
              },
              activeColor:
                  Provider.of<CustomTheme>(context, listen: false).isTheme
                      ? kyellow
                      : kbgcolor,
              checkColor:
                  Provider.of<CustomTheme>(context, listen: false).isTheme
                      ? kbgcolor
                      : Colors.white,
            ),
          ),
          PopupMenuButton(
            onSelected: (value) {
              if (value == 0) {
                print("edit");
                showDialog(
                    context: context,
                    builder: (context) {
                      print('inside dialogue');
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10,
                            ),
                          ),
                        ),
                        backgroundColor:
                            Provider.of<CustomTheme>(context, listen: false)
                                    .isTheme
                                ? kbgcolor
                                : kpink,
                        title: Text(
                          'Edit Item',
                          style: TextStyle(
                            color:
                                Provider.of<CustomTheme>(context, listen: false)
                                        .isTheme
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                        actionsPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        actions: [
                          MaterialButton(
                            minWidth: 60,
                            height: 40,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 10,
                            color:
                                Provider.of<CustomTheme>(context, listen: false)
                                        .isTheme
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
                            color: Colors.green,
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Okay',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              }
            },
            color: Provider.of<CustomTheme>(context, listen: false).isTheme
                ? Colors.white
                : kpink,
            icon: Icon(
              Icons.more_vert,
              color: Provider.of<CustomTheme>(context, listen: false).isTheme
                  ? kyellow
                  : kbgcolor,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Edit'),
                  value: 0,
                ),
                PopupMenuItem(
                  child: Text('Delete'),
                  onTap: () {
                    String key = Provider.of<Auth>(context, listen: false).key;
                    Provider.of<ToDo>(context, listen: false)
                        .deleteToDoItem(key, widget.item.id);
                  },
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
