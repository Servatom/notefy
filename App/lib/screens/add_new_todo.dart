// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/models/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomModalSheetTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<CustomTheme>(context).isTheme
          ? Color(0xFF000000)
          : Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Category',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
