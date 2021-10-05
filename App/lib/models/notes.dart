// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import 'auth.dart';
import 'note.dart';

class Notes with ChangeNotifier {
  // String key = Provider.of<Auth>(_,listen: false).getKey();
  List<Note> _notes = [
    Note(
      body:
          'Hello thereHello thereHello thereHello thereHello thereHello thereHello thereHello thereHello there',
      id: '1',
      title: 'Note1',
    ),
    Note(
      body: 'Hello world',
      id: '2',
      title: 'Note2',
    ),
    Note(
      body: 'Hello',
      id: '3',
      title: 'Note3',
    ),
    Note(
      body: 'Hello matar',
      id: '4',
      title: 'Note4',
    ),
  ];

  List<Note> get notesList {
    return [..._notes];
  }

  void addNote(String title, String body) {
    _notes.add(Note(body: body, id: '10', title: title));
  }

  // API calls
  // Future getList() async {
  //   try {
  //     http.Response response = await http.get(
  //       Uri.parse('https://notefyapi.servatom.com/api/users/detail/'),
  //       headers: {'Authorization': 'Token $key'},
  //     );

  //     String d = response.body;
  //     var data = jsonDecode(d);

  //     print(response.body);
  //     if (response.statusCode == 200) {
  //     } else {}
  //   } catch (e) {}
  // }
}
