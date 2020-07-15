import 'package:flutter/material.dart';

import 'package:deliciousfood/ui/pages/main/initialize_items.dart';
import 'package:deliciousfood/ui/shared/app_theme.dart';
import 'package:deliciousfood/core/utils/size_fit.dart';

class LDMainScreen extends StatefulWidget {
  static const String routeName = "/";

  @override
  _LDMainScreenState createState() => _LDMainScreenState();
}

class _LDMainScreenState extends State<LDMainScreen> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    LDSizeFit.initialize();

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: navBarItems,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: tabBarItems,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
