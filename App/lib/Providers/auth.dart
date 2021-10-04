// ignore_for_file: avoid_print

import 'package:app/routers/routenames.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String key = '';

  Future<void> loginUser(email, password) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://notefyapi.servatom.com/api/auth/login/'),
        body: {"email": email, "password": password},
      );

      String d = response.body;
      var data = jsonDecode(d);
      if (response.statusCode == 200) {
        print('login success');
        key = data["key"];
      } else {
        List error = data["non_field_errors"];
        print(error[0]);
        throw error[0];
      }
    } catch (e) {
      throw (e);
    }
  }

  String getKey() {
    return key;
  }

  Future<void> registerUser(email, name, password) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://notefyapi.servatom.com/api/users/register/'),
        body: {"email": email, "name": name, "password": password},
      );

      String d = response.body;
      var data = jsonDecode(d);
      if (response.statusCode == 200) {
        print('registration successful');
      } else {
        List error = data["email"];
        throw error[0];
      }
    } catch (e) {
      throw (e);
    }
  }

  void logoutUser(context) {
    Navigator.pushNamed(context, RouteNames.mainscreen);
    key = '';
  }
}
