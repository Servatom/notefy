// ignore_for_file: prefer_final_fields

import 'note.dart';

class Notes {
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
    Note(
      body: 'byeee',
      id: '5',
      title: 'Note5',
    ),
    Note(
      body: 'cyaa ',
      id: '6',
      title: 'Note6',
    ),
    Note(
      body: 'bruhhhhhhh ',
      id: '7',
      title: 'Note7',
    ),
  ];

  List<Note> get notesList {
    return [..._notes];
  }
}
