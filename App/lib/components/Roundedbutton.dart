import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({required this.title, required this.onPressed});
  late String title;
  late Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: Color(0xFFF2E88B),
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () => onPressed(),
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 27,
              color: Colors.black,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ),
    );
  }
}
