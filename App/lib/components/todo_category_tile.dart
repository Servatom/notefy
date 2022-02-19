// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:app/constants.dart';
import 'package:app/models/theme.dart';
import 'package:app/models/todo.dart';
import 'package:app/models/todo_components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoCategoryTile extends StatelessWidget {
  Category category;
  Function onTap;
  TodoCategoryTile({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    List<TodoItem> items =
        Provider.of<ToDo>(context).getItemListForCategory(category.id);
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
                vertical: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    category.category,
                    style: TextStyle(
                      color: Provider.of<CustomTheme>(context).isTheme
                          ? kNoteTitle
                          : Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Expanded(
                    child: (items.isNotEmpty)
                        ? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: (items.length >= 2) ? 2 : items.length,
                            itemBuilder: (context, index) {
                              return Text(
                                items[index].item,
                                style: TextStyle(
                                  color:
                                      Provider.of<CustomTheme>(context).isTheme
                                          ? kNoteBody
                                          : Colors.black54,
                                  decoration: items[index].isDone
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              );
                            },
                          )
                        : Text(
                            'No items yet',
                            style: TextStyle(
                              color: Provider.of<CustomTheme>(context).isTheme
                                  ? kNoteBody
                                  : Colors.black54,
                            ),
                          ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      category.updatedAt,
                      style: TextStyle(
                        color: Provider.of<CustomTheme>(context).isTheme
                            ? kNotetime
                            : Colors.black38,
                      ),
                    ),
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
