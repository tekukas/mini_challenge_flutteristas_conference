import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'scenery_painter.dart';
import 'themes/custom_themes.dart';
import 'themes/my_theme.dart';

class Scenery extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SceneryState();
}

class _SceneryState extends State<Scenery> {
  // You can adjust this, as needed, but it should not change with the theme.
  final _textAreaHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    final myTheme = Provider.of<MyTheme>(context, listen: false);
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          CustomPaint(
            foregroundPainter: SceneryPainter(
              skyColor:
                  CustomWidgetThemes.of(context).sceneryThemeData!.skyFillColor,
              waterColor: CustomWidgetThemes.of(context)
                  .sceneryThemeData!
                  .waterFillColor,
              mountainColor: CustomWidgetThemes.of(context)
                  .sceneryThemeData!
                  .mountainFillColor,
              textHeight: _textAreaHeight,
              drawSun: CustomWidgetThemes.of(context).sceneryThemeData!.drawSun,
              drawAfternoonSun: CustomWidgetThemes.of(context)
                  .sceneryThemeData!
                  .drawAfternoonSun,
              drawMoon:
                  CustomWidgetThemes.of(context).sceneryThemeData!.drawMoon,
            ),
            child: Container(
            color: colorSelector(context),
            ),
          ),
          //todo(you) - Can you find a way to toggle this text area background color according to the theme?
          Positioned(
            bottom: 0,
            child: Container(
              height: _textAreaHeight,
              width: constraints.maxWidth,
              child: const SomeText(),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: constraints.maxWidth,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: RadioListTile<ThemeType>(
                        contentPadding: EdgeInsets.symmetric(horizontal: 4),
                        title: const Text('10 a.m.'),
                        groupValue: myTheme.themeType,
                        value: ThemeType.Light,
                        onChanged: (ThemeType? mode) =>
                            myTheme.setThemeType(ThemeType.Light),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<ThemeType>(
                        contentPadding: EdgeInsets.symmetric(horizontal: 4),
                        title: const Text('16 p.m.'),
                        groupValue: myTheme.themeType,
                        value: ThemeType.Other,
                        onChanged: (ThemeType? mode) =>
                            myTheme.setThemeType(ThemeType.Other),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<ThemeType>(
                        contentPadding: EdgeInsets.symmetric(horizontal: 4),
                        title: const Text('19 p.m.'),
                        groupValue: myTheme.themeType,
                        value: ThemeType.Dark,
                        onChanged: (ThemeType? mode) =>
                            myTheme.setThemeType(ThemeType.Dark),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SomeText extends StatelessWidget {
  const SomeText();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Luquinhas',
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          '@tekukas',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 8),
        Text(
          'Hello, Flutter Community!',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          'I am indeed having fun with this challenge! :)',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}

Color colorSelector(BuildContext context){
  final themeType = Provider.of<MyTheme>(context).themeType;
  switch (themeType) {
    case ThemeType.Light:
      return Color(0xFF7A9CC6);
    case ThemeType.Dark:
      return Color(0xFF023E8A);
    case ThemeType.Other:
      return Color(0xFF4976AB);
  }
}
