// ignore_for_file: use_key_in_widget_constructors

import 'package:app/routers/approutes.dart';
import 'package:app/routers/routenames.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/note.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: RouteNames.mainscreen);
  }
}
