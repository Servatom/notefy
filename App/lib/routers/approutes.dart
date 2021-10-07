import 'package:app/models/note.dart';
import 'package:app/routers/routenames.dart';
import 'package:app/screens/dashboard.dart';
import 'package:app/screens/loginscreen.dart';
import 'package:app/screens/mainscreen.dart';
import 'package:app/screens/notescreen.dart';
import 'package:app/screens/registerscreen.dart';
import 'package:app/screens/resetpassword.dart';
import 'package:app/screens/server_down.dart';
import 'package:app/screens/settingsreen.dart';
import 'package:app/screens/splash.dart';
import 'package:flutter/material.dart';

import 'routenames.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.mainscreen:
        return MaterialPageRoute<dynamic>(builder: (_) => MainScreen());
      case RouteNames.register:
        return MaterialPageRoute<dynamic>(builder: (_) => RegisterScreen());
      case RouteNames.login:
        return MaterialPageRoute<dynamic>(builder: (_) => LoginScreen());
      case RouteNames.dashboard:
        return MaterialPageRoute<dynamic>(builder: (_) => DashBoard());
      case RouteNames.sscreen:
        return MaterialPageRoute<dynamic>(builder: (_) => SettingsScreen());
      case RouteNames.splash:
        return MaterialPageRoute<dynamic>(builder: (_) => Splashscreen());
      case RouteNames.resetpasswordscreen:
        return MaterialPageRoute<dynamic>(builder: (_) => ResetPassScreen());
      case RouteNames.serverdownpage:
        return MaterialPageRoute<dynamic>(builder: (_) => ServerDown());
      case RouteNames.noterscreen:
        var notes = settings.arguments as Note;
        return MaterialPageRoute<dynamic>(
            builder: (_) => NoteScreen(
                  note: notes,
                ));
      // case RouteNames.landing:
      //   var type = settings.arguments as String;
      //   return MaterialPageRoute<dynamic>(builder: (_) => LandingPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}'))));
    }
  }
}
