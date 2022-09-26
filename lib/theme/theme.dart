import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

const Color bluesC = Color.fromARGB(255, 17, 110, 25);
const Color yellowC = Color(0xffffb746);
const Color whitee = Colors.white;
const Color primaryClr = bluesC;
const MaterialColor terang = Colors.green;
const Color darkGreyClr = Color(0xff121212);
Color darkheaderClr = Color(0xff424242);
Color blueClr = Colors.blue.shade900;
Color amberClr = Colors.amber.shade900;
Color RedClr = Colors.red.shade900;

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

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
    ),
  );
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      // color: Get.isDarkMode ? Colors.white : Colors.grey,
    ),
  );
}

TextStyle get tanggalPickerStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    ),
  );
}

TextStyle get hariPickerStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      // color: Get.isDarkMode ? Colors.white : Colors.black,
    ),
  );
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      color: Get.isDarkMode ? Colors.black : Colors.grey[700],
    ),
  );
}
