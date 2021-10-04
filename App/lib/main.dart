// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:app/routers/approutes.dart';
import 'package:app/routers/routenames.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Providers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
      ],
      child: MaterialApp(
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: RouteNames.mainscreen),
    );
  }
}
