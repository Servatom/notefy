// ignore_for_file: prefer_final_fields, avoid_print, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import 'auth.dart';
import 'note.dart';

class Notes with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notesList {
    return [..._notes];
  }

  void clearList() {
    _notes.clear();
  }

  // API calls
  Future getList(String key) async {
    try {
      http.Response response = await http.get(
        Uri.parse('https://notefyapi.servatom.com/api/notes/'),
        headers: {'Authorization': 'Token $key'},
      );

      String d = response.body;
      final data = jsonDecode(d);

      print(response.body);
      if (response.statusCode == 200) {
        List tempNote = data;
        for (int i = 0; i < tempNote.length; i++) {
          _notes.add(
            Note(
              body: tempNote[i]["body"],
              title: tempNote[i]["title"],
              id: tempNote[i]["id"].toString(),
              createTime: tempNote[i]["created_at"],
              updateTime: tempNote[i]["updated_at"],
            ),
          );
        }
        print(_notes);
        notifyListeners();
      } else {
        throw 'Error';
      }
    } catch (e) {
      print(e);
    }
  }

// TODO: connect this to UI
  Future getNoteDetail(String key, String noteID) async {
    try {
      http.Response response = await http.get(
        Uri.parse('https://notefyapi.servatom.com/api/notes/$noteID/'),
        headers: {'Authorization': 'Token $key'},
      );

      String d = response.body;
      final data = jsonDecode(d);

      print(response.body);
      if (response.statusCode == 200) {
        return data;
      } else {
        throw 'Error';
      }
    } catch (e) {
      print(e);
    }
  }

  Future createNote(String key, String title, String body) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://notefyapi.servatom.com/api/notes/create/'),
        headers: {'Authorization': 'Token $key'},
        body: {"title": title, "body": body},
      );

      String d = response.body;
      final data = jsonDecode(d);

      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 201) {
        _notes.add(
          Note(
            body: data["body"],
            title: data["title"],
            id: data["id"].toString(),
            createTime: data["created_at"],
            updateTime: data["updated_at"],
          ),
        );
        notifyListeners();
      } else {
        throw 'Error in create note';
      }
    } catch (e) {
      print(e);
    }
  }

// TODO: connect this to UI
  Future updateNote(
      String key, String title, String body, String noteID) async {
    try {
      http.Response response = await http.put(
        Uri.parse('https://notefyapi.servatom.com/api/notes/$noteID/'),
        headers: {'Authorization': 'Token $key'},
        body: {"title": title, "body": body},
      );
      final responseData = jsonDecode(response.body);
      int index = _notes.indexWhere((element) => element.id == noteID);

      print(response.body);
      if (response.statusCode == 200) {
        _notes[index].body = responseData["body"];
        _notes[index].title = responseData["title"];
        _notes[index].updateTime = responseData["updated_at"];

        notifyListeners();
      } else {
        throw 'Error';
      }
    } catch (e) {
      print(e);
    }
  }

  Future deleteNote(String key, String noteID) async {
    try {
      http.Response response = await http.delete(
        Uri.parse('https://notefyapi.servatom.com/api/notes/$noteID/'),
        headers: {'Authorization': 'Token $key'},
      );
      if (response.statusCode == 204) {
        print('delete succesful');
        int index = _notes.indexWhere((element) => element.id == noteID);
        _notes.remove(_notes[index]);
        notifyListeners();
        return 'success';
      } else {
        throw 'Error';
      }
    } catch (e) {
      print(e);
    }
  }
}
