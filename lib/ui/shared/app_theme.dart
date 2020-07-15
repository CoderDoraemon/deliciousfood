import 'package:flutter/material.dart';

class LDAppTheme {
  // 1、公共属性
  static const double smallFontSize = 16;
  static const double normalFontSize = 22;
  static const double largeFontSize = 24;

  // 2、普通模式
  static final Color normalTextColor = Colors.redAccent;

  static final ThemeData normalTheme = ThemeData(
    primaryColor:  Colors.pink,
    canvasColor: Color.fromRGBO(255, 222, 224, 1.0), // 同意背景色
      // 去除tabbar点击选中波纹效果
      highlightColor: Colors.transparent,
      splashColor: Color.fromRGBO(0, 0, 0, 0),
    textTheme:  TextTheme(
      display1: TextStyle(fontSize: smallFontSize),
      display2: TextStyle(fontSize: normalFontSize),
      display3: TextStyle(fontSize: largeFontSize),
    )
  );

  // 3、暗黑模式
  static final Color darkTextColor = Colors.redAccent;
  static final ThemeData darkTheme = ThemeData(
      primaryColor:  Colors.grey,
      // 去除tabbar点击选中波纹效果
      highlightColor: Colors.transparent,
      splashColor: Color.fromRGBO(0, 0, 0, 0),
      textTheme:  TextTheme(
        display1: TextStyle(fontSize: smallFontSize),
        display2: TextStyle(fontSize: normalFontSize),
        display3: TextStyle(fontSize: largeFontSize),
      )
  );
}