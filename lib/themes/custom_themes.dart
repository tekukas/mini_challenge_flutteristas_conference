import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_theme.dart';
import 'scenery_theme.dart';

/// You can add themes for your own custom widgets here.
/// NB: for this challenge, it is only required to modify sceneryThemeData
class CustomWidgetThemes {
  static CustomWidgetThemes of(BuildContext context) => CustomWidgetThemes._(context);

  SceneryThemeData? sceneryThemeData;

  // todo(you) These colors are dreary! Modify this so the picture has different values for light and dark modes.
  //  If you are feeling ambitions, get creative and make a third theme (or a fourth!)
  CustomWidgetThemes._(BuildContext context) {
    final themeType = Provider.of<MyTheme>(context).themeType;

    switch (themeType) {
      case ThemeType.Light:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: Color(0xFFBCD0DC),
          mountainFillColor: Color(0xFF73c544),
          waterFillColor: Color(0xFF7A9CC6),
          drawMoon: false,
          drawSun: true,
          drawAfternoonSun: false
        );
        break;
      case ThemeType.Dark:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: Color(0xFF212f45),
          mountainFillColor: Color(0xFF4d194d),
          waterFillColor: Color(0xFF023E8A),
          drawMoon: true,
          drawSun: false,
          drawAfternoonSun: false,
        );
        break;
      case ThemeType.Other:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: Color(0xFFEDD382),
          mountainFillColor: Color(0xFFFC9E4F),
          waterFillColor: Color(0xFF4976AB),
          drawMoon: false,
          drawSun: false,
          drawAfternoonSun: true,
        );
        break;
    }
  }
}
