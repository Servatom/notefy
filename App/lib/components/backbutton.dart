import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.keyboard_arrow_left,
        color: kyellow,
        size: 35,
      ),
    );
  }
}
