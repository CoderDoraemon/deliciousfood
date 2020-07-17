import 'package:deliciousfood/core/service/meal_request.dart';
import 'package:flutter/material.dart';

import 'package:deliciousfood/core/router/router.dart';
import 'package:deliciousfood/ui/shared/app_theme.dart';
import 'package:deliciousfood/ui/pages/main/main.dart';

void main() {
  LDMealRequest.getMealData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '美食广场',
      theme: LDAppTheme.normalTheme,
      routes: LDRouter.routes,
      initialRoute: LDRouter.initialRoute,
      onGenerateRoute: LDRouter.onGenerateRoute,
      onUnknownRoute: LDRouter.onUnknownRoute,
    );
  }
}

