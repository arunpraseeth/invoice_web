import 'package:flutter/material.dart';

///Colors
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

const primaryColor = Color(0xFF499CEC);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);

//Regex
String regexPattern =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

//Sizes
const double textSize = 16;
const double heightPadding1 = 10;
const double heightPadding2 = 20;
const Color blackColor = Colors.black;

//Assets
const String loginPlaceholder = "assets/login/login.svg";
const String google = "assets/login/google.svg";
