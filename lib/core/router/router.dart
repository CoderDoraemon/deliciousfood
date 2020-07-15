

import 'package:deliciousfood/ui/pages/favor/favor.dart';
import 'package:deliciousfood/ui/pages/home/home.dart';
import 'package:deliciousfood/ui/pages/main/main.dart';
import 'package:flutter/cupertino.dart';

class LDRouter {



  // 1、路由列表
  static final Map<String, WidgetBuilder> routes = {
    LDMainScreen.routeName: (ctx) => LDMainScreen(),
    LDHomeScreen.routeName: (ctx) => LDHomeScreen(),
    LDFavorScreen.routeName: (ctx) => LDFavorScreen(),
  };

  // 2、入口路由
  static final String initialRoute = LDMainScreen.routeName;

  // 3、特殊传参路由
  static final RouteFactory onGenerateRoute = (settings) {
    return null;
  };

  // 3、未找到默认路由
  static final RouteFactory onUnknownRoute = (settings) {
    return null;
  };

}