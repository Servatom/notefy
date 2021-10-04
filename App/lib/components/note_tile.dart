// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:app/constants.dart';
import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String title;
  final String body;
  // String dateTime
  NoteTile({
    required this.title,
    required this.body,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      child: SizedBox(
        height: 125,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          color: kyellow,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: kNoteTitle,
                    fontSize: 25,
                  ),
                ),
                Text(
                  body.length > 44 ? '${body.substring(0, 44)}...' : body,
                  style: TextStyle(
                    color: kNoteBody,
                    fontSize: 15,
                  ),
                  maxLines: 1,
                ),
                Text(
                  'time',
                  style: TextStyle(
                    color: kNotetime,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
