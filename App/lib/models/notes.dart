// ignore_for_file: prefer_final_fields, avoid_print, unused_import

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import 'auth.dart';
import 'note.dart';

class Notes with ChangeNotifier {
  // String key = Provider.of<Auth>(_,listen: false).getKey();
  String key = '59197db1928e55a3b92d3528e023dc78c0748b91';
  List<Note> _notes = [];

  List<Note> get notesList {
    return [..._notes];
  }

  // API calls
  Future getList() async {
    try {
      http.Response response = await http.get(
        Uri.parse('https://notefyapi.servatom.com/api/notes/'),
        headers: {'Authorization': 'Token $key'},
      );

      String d = response.body;
      var data = jsonDecode(d);

      print(response.body);
      if (response.statusCode == 200) {
        List tempNote = data;
        for (int i = 0; i < tempNote.length; i++) {
          _notes[i] = Note(
            body: tempNote[i]["body"],
            title: tempNote[i]["title"],
            id: tempNote[i]["id"],
            createTime: tempNote[i]["created_at"],
            updateTime: tempNote[i]["updated_at"],
          );
        }
      } else {
        throw 'Error';
      }
    } catch (e) {
      print(e);
    }
  }
}
