import 'package:flutter/material.dart';
import 'package:frontend/screens/Home.screen.dart';
import 'package:frontend/screens/Register2.screen.dart';
import 'package:frontend/screens/Register3.screen.dart';
import 'package:frontend/screens/Register4.screen.dart';
import 'package:frontend/screens/Register5.screen.dart';
import 'package:frontend/screens/Register6.screen.dart';
import 'package:frontend/screens/Splash.screen.dart';
import 'package:frontend/screens/UserProfile.screen.dart';
import 'package:frontend/screens/EditProfile.screen.dart';
import 'package:frontend/utils/config.dart';
import 'package:frontend/utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // app name
      title: AppConfig.appName,

      // app theme
      theme: AppTheme.lightTheme,

      // disable test banner
      debugShowCheckedModeBanner: false,

        routes: {
          Register2.routeName: (ctx) => Register2(),
          Register3.routeName: (ctx) => Register3(),
          Register4.routeName: (ctx) => Register4(),
          Register5.routeName: (ctx) => Register5(),
          Register6.routeName: (ctx) => Register6(),
          Home.routeName: (ctx) => Home(),
          UserProfile.routeName: (ctx) => UserProfile(),
          EditProfile.routeName: (ctx) => EditProfile()
        },

      home: Splash()

    );
  }
}