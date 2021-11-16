import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class AppColors {
  static Color WINE_RED = HexColor('#730321');
  static Color CREAM = HexColor('#F2E8DF');
  static Color LIGHT_ORANGE = HexColor('##F27F3D');
  static Color ORANGE = HexColor('#F26430');
  static Color BRONZE_ORANGE = HexColor('#BF4136');
  static Color DARK = HexColor('#343434');
  static Color WHITE = HexColor('#FFFFFF');
}

class AppFontSizes{
  static double S = 10.0;
  static double M = 20.0;
  static double L = 30.0;
}
