import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  var _themeType = ThemeType.Light;

  ThemeType get themeType => _themeType;

  MyTheme() {
    /// If the user changes the theme in their device's settings, this is picked up on as well:
    final window = WidgetsBinding.instance?.window;
    window?.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;

      switch (brightness) {
        case Brightness.dark:
          setThemeType(ThemeType.Dark);
          break;
        case Brightness.light:
          setThemeType(ThemeType.Light);
      }
    };
  }

  void setThemeType(ThemeType themeType) {
    _themeType = themeType;
    notifyListeners();
  }

  ThemeData get currentThemeData {
    switch (themeType) {
      case ThemeType.Light:
        return ThemeData(
          primaryColor: Color(0xFFB3D2B2),
          accentColor: Color(0xFF73c544),
          textTheme: TextTheme(
            headline3: TextStyle(color: Color(0xFF355E1D)),
            subtitle1: TextStyle(color: Colors.blue[800]),
            bodyText1: TextStyle(color: Colors.black),
          ),
        );
      case ThemeType.Dark:
        return ThemeData(
          primaryColor: Color(0xFF0077B6),
          accentColor: Color(0xFF9C9EFC),
          textTheme: TextTheme(
            headline3: TextStyle(color: Color(0xFFCAF0F8)),
            subtitle1: TextStyle(color: Color(0xFF90E0EF)),
            bodyText1: TextStyle(color: Color(0xFF00B4D8)),
          ),
        );
      case ThemeType.Other:
        return ThemeData(
          primaryColor: Color(0xFFF2F3AE),
          accentColor: Color(0xFF8D4002),
          textTheme: TextTheme(
            headline3: TextStyle(color: Color(0xFF8D4002)),
            subtitle1: TextStyle(color: Color(0xFFEDD382)),
            bodyText1: TextStyle(color: Color(0xFFF2F3AE)),
          ),
        );
    }
  }
}

enum ThemeType {
  Light,
  Dark,
  Other,
}
