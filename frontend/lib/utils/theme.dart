import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: HexColor("#0D1724"),
    accentColor: Colors.white70,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
