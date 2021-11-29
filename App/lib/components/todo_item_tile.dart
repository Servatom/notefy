// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:app/constants.dart';
import 'package:app/models/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoItemListTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  TodoItemListTile({
    required this.isChecked,
    required this.taskTitle,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 18,
          color: Provider.of<CustomTheme>(context, listen: false).isTheme
              ? Colors.white
              : Colors.black,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (value) {},
        activeColor: Provider.of<CustomTheme>(context, listen: false).isTheme
            ? Colors.white
            : kbgcolor,
        checkColor: Provider.of<CustomTheme>(context, listen: false).isTheme
            ? kbgcolor
            : Colors.white,
      ),
    );
  }
}
