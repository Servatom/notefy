import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  RoundedButton({required this.title, required this.onPressed});

  final String title;
  final Function onPressed;

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: Color(0xFFF2E88B),
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () => widget.onPressed(),
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
