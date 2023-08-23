import 'package:flutter/material.dart';


class Themes
{
  static const AppBarTheme appbarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    centerTitle: true,
  );
}

class TextStyles
{
  static const String fontFamily = "Source Code Pro";

  static const TextStyle title = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const TextStyle heading = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );
  
  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
  );
}