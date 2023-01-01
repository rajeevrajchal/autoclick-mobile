import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(39, 89, 205, 1);
const primaryColorDark = Color.fromRGBO(48, 65, 102, 1);
const secondaryColor = Color.fromRGBO(189, 209, 255, 1);
const buttonSecondary = Color.fromRGBO(189, 209, 255, 1);
const defaultColor = Color.fromRGBO(239, 245, 252, 1);
const errorColor = Color.fromRGBO(238, 73, 50, 1);
const successColor = Color(0xFF4BCB1F);

class Palette {
  static const Color scaffold = Colors.white;

  // body colors
  static const Color primary = primaryColor;
  static const Color primaryDark = primaryColorDark;

  static const Color secondary = secondaryColor;
  static const Color defaultText = Color.fromARGB(255, 37, 37, 37);

  static const Color secondaryButton = buttonSecondary;
  static const Color primaryButton = primaryColor;
  static const Color defaultButton = defaultColor;
  static const Color errorButton = errorColor;
  static const Color successButton = successColor;

  static const Color success = successColor;
  static const Color error = errorColor;

  static const Color dark = Colors.black87;
  static const Color light = Colors.white;
  static const Color transparent = Colors.transparent;

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    tileMode: TileMode.mirror,
    colors: [primaryColor, secondaryColor],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomRight,
    colors: [transparent, primaryColor],
  );
}
