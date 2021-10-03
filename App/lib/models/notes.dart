// ignore_for_file: prefer_final_fields

import 'note.dart';

class Notes {
  List<Note> _notes = [
    Note(
      body: 'Hello there',
      id: '1',
    ),
    Note(
      body: 'Hello world',
      id: '2',
    ),
    Note(
      body: 'Hello',
      id: '3',
    ),
    Note(
      body: 'Hello matar',
      id: '4',
    ),
  ];

  List<Note> get notesList {
    return [..._notes];
  }
}
