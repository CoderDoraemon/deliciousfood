import 'package:deliciousfood/ui/pages/favor/favor.dart';
import 'package:deliciousfood/ui/pages/home/home.dart';
import 'package:flutter/material.dart';

import 'bottom_bar_item.dart';

List<BottomNavigationBarItem> tabBarItems = [
  BottomNavigationBarItem(title: Text("首页"), icon: Icon(Icons.home)),
  BottomNavigationBarItem(title: Text("收藏"), icon: Icon(Icons.star)),
];

List<Widget> navBarItems = [LDHomeScreen(), LDFavorScreen()];
