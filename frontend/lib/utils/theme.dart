import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: UIGuide.COLOR1,
    accentColor: Colors.white70,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
