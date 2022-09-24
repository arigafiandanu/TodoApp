import 'package:flutter/material.dart';

const Color bluesC = Color.fromARGB(255, 78, 232, 91);
const Color yellowC = Color(0xffffb746);
const Color whitee = Colors.white;
const Color primaryClr = bluesC;
const MaterialColor terang = Colors.green;
const Color darkGreyClr = Color(0xff121212);
Color darkheaderClr = Color(0xff424242);

class Customtema {
  static final terang = ThemeData(
    backgroundColor: Colors.white,
    primarySwatch: Colors.red,
    brightness: Brightness.light,
  );

  static final gelap = ThemeData(
    backgroundColor: darkGreyClr,
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}
