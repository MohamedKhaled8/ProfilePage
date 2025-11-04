import 'package:flutter/material.dart';


abstract class ColorsManger {
  ColorsManger._();

  static const Color primaryColor = Color(0xff561895);
  static const Color darkBackgroundCColor = Color(0xff110D12);

  // Define individual grays if needed
  static const Color gray100 = Color(0xFFF5F5F5);
  static const Color gray900 = Color(0xff110D12);

  // Proper MaterialColor definition
  static const MaterialColor gray = MaterialColor(
    0xff979797, // Primary color value (usually the mid-tone)
    {
      100: Color(0xffFBFBFB),
      200: Color(0xffE2E2E2),
      300: Color(0xffC9C9C9),
      400: Color(0xffB0B0B0),
      500: Color(0xff979797),
      600: Color(0xff7E7E7E),
      700: Color(0xff646464),
      800: Color(0xff333333),
      850: Color(0xff131313), // Custom key — still fine
      900: Color(0xff110D12),
    },
  );
  static const Color red = Color(0xffFF0000); 
}
