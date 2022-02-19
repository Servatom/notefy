// ignore_for_file: avoid_print, use_rethrow_when_possible

import 'package:app/models/notes.dart';
import 'package:app/models/theme.dart';
import 'package:app/models/todo.dart';
import 'package:app/models/user.dart';
import 'package:app/routers/routenames.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String key = '';
  // int counter = 1;

  Future<void> loginUser(email, password) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://notefyapi.servatom.com/api/auth/login/'),
        body: {"email": email, "password": password},
      );

      String d = response.body;
      final data = jsonDecode(d);

      print(response.body);
      if (response.statusCode == 200) {
        print('login success');
        key = data["key"];
        print('set key = $key');
        setKey();
      } else {
        if (email == '') {
          throw 'Email field must not be blank';
        }
        if (password == '') {
          throw 'Password field must not be blank';
        }
        List error = data["non_field_errors"];
        print(error[0]);
        throw error[0];
      }
    } catch (e) {
      throw (e);
    }
  }

  Future<void> registerUser(email, name, password) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://notefyapi.servatom.com/api/users/register/'),
        body: {"email": email, "name": name, "password": password},
      );

      String d = response.body;
      final data = jsonDecode(d);
      print(response.body);
      if (response.statusCode == 200) {
        print('registration successful');
      } else {
        if (email == '') {
          throw 'Email field must not be blank';
        }
        if (name == '') {
          throw 'Name must not be blank';
        }
        if (password == '') {
          throw 'Password field must not be blank';
        }
        List error = data["email"];
        print(error[0]);
        throw error[0];
      }
    } catch (e) {
      throw (e);
    }
  }

  void logoutUser(context) {
    key = '';
    setKey();
    Provider.of<Notes>(context, listen: false).clearList();
    Navigator.pushNamed(context, RouteNames.mainscreen);
  }

  void setKey() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('key', key);
    print('set key $key');
  }

  void isLoggedIn(context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey('key')) {
      key = preferences.getString('key').toString();
    }

    print('isloggedin $key');
    if (key == '') {
      Navigator.pushReplacementNamed(context, RouteNames.mainscreen);
    } else {
      Provider.of<User>(context, listen: false).getUserdetail(key);

      Provider.of<CustomTheme>(context, listen: false).getIsTheme();
      Provider.of<Notes>(context, listen: false).clearList();
      Provider.of<Notes>(context, listen: false).getList(key);
      Provider.of<ToDo>(context, listen: false).clearList();
      Provider.of<ToDo>(context, listen: false).getCategoriesList(key);
      Provider.of<ToDo>(context, listen: false).listAllTodoItems(key);
      Navigator.pushReplacementNamed(context, RouteNames.dashboard);
    }
  }
}
