// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_print

import 'package:app/constants.dart';
import 'package:app/models/note.dart';
import 'package:app/models/theme.dart';
import 'package:app/routers/routenames.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteTile extends StatelessWidget {
  final Note note;
  // String dateTime
  NoteTile({required this.note});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      child: GestureDetector(
        onTap: () {
          print(note);
          Navigator.pushNamed(
            context,
            RouteNames.noterscreen,
            arguments: note,
          );
        },
        child: SizedBox(
          height: 125,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            // color: Color(0xFFf8bbd0),
            // color: Color.fromRGBO(254, 216, 238, 1),
            color: Provider.of<CustomTheme>(context).isTheme
                ? kgreyblack
                : klightpink,
            elevation: 5,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    note.title == 'k' ? note.body.split(' ').first : note.title,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    style: TextStyle(
                      color: Provider.of<CustomTheme>(context).isTheme
                          ? kNoteTitle
                          : Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    note.body,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Provider.of<CustomTheme>(context).isTheme
                          ? kNoteBody
                          : Colors.black54,
                      fontSize: 15,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    note.updateTime,
                    style: TextStyle(
                      color: Provider.of<CustomTheme>(context).isTheme
                          ? kNotetime
                          : Colors.black38,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
