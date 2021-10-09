// ignore_for_file: avoid_print, use_rethrow_when_possible

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  String name = '';
  String email = '';
  String avatar = '';

  Future getUserdetail(String key) async {
    try {
      print(key);
      http.Response response = await http.get(
        Uri.parse('https://notefyapi.servatom.com/api/users/detail/'),
        headers: {'Authorization': 'Token $key'},
      );

      final d = response.body;
      print(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(d);
        name = data["name"];
        email = data["email"];
        avatar = data["avatar"];
        print(data);
      } else {
        throw 'No Such user exists';
      }
    } catch (e) {
      throw (e);
    }
  }

  Future changeAvatar(String key) async {
    try {
      http.Response response = await http.put(
        Uri.parse('https://notefyapi.servatom.com/api/users/avatar_change/'),
        headers: {'Authorization': 'Token $key'},
      );

      String d = response.body;
      print(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(d);
        avatar = data["new_avatar"];
        print(data);
        notifyListeners();
      } else {
        throw 'No Such user exists';
      }
    } catch (e) {
      throw (e);
    }
  }

  Future resetPassword(
      String key, String oldpassword, String newPassword) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://notefyapi.servatom.com/api/users/reset_password/'),
        body: {"old_password": oldpassword, "new_password": newPassword},
        headers: {'Authorization': 'Token $key'},
      );

      final data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        print(data["detail"].toString());
      } else {
        throw data["detail"].toString();
      }
    } catch (e) {
      throw (e);
    }
  }
}
