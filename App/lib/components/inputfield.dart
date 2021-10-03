import 'package:flutter/material.dart';
import '../constants.dart';

class InputField extends StatelessWidget {
  final bool obscure;
  final String hinttext;
  final Function onChanged;
  InputField({
    required this.hinttext,
    required this.onChanged,
    required this.obscure,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
      ),
      onChanged: (value) {
        onChanged(value);
      },
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(
          decorationColor: Colors.black54,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              10.0,
            ),
          ),
          borderSide: BorderSide(
            color: kyellow,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
