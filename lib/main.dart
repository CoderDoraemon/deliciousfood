import 'package:deliciousfood/core/viewmodel/filter_view_model.dart';
import 'package:deliciousfood/core/viewmodel/meal_view_model.dart';
import 'package:flutter/material.dart';

import 'package:deliciousfood/core/router/router.dart';
import 'package:deliciousfood/ui/shared/app_theme.dart';
import 'package:provider/provider.dart';

import 'core/viewmodel/favorite_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => LDFilterViewModel()),
      ChangeNotifierProxyProvider<LDFilterViewModel, LDMealViewModel>(
          create: (ctx) => LDMealViewModel(),
          update: (ctx, filterVM, mealVM) {
            mealVM.updateFilters(filterVM);
            return mealVM;
          }),
      ChangeNotifierProxyProvider<LDFilterViewModel, LDFavoriteViewModel>(
          create: (ctx) => LDFavoriteViewModel(),
          update: (ctx, filterVM, favorVM) {
            favorVM.updateFilters(filterVM);
            return favorVM;
          }),
    ],
    child: MyApp(),
  ));
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
