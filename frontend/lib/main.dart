import 'package:flutter/material.dart';
import 'package:frontend/screens/Splash.screen.dart';
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

      home: Splash()

    );
  }
}