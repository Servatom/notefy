// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:app/models/notes.dart';
import 'package:app/models/theme.dart';
import 'package:app/models/user.dart';
import 'package:app/routers/approutes.dart';
import 'package:app/routers/routenames.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'models/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: Notes()),
        ChangeNotifierProvider.value(value: User()),
        ChangeNotifierProvider.value(value: CustomTheme()),
      ],
      child: Homew(),
    );
  }
}

class Homew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Provider.of<CustomTheme>(context).isTheme
            ? CustomTheme.darkTheme
            : CustomTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: RouteNames.splash);
  }
}
