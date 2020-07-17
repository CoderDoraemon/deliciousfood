import 'package:flutter/cupertino.dart';

class LDBottomBarItem extends BottomNavigationBarItem {
  LDBottomBarItem(String iconName, String title)
      : super(
          title: Text(title),
          icon: Image.asset(
            "assets/images/tabbar/$iconName",
            width: 32,
            gaplessPlayback: true,
          ),
          activeIcon: Image.asset(
            "assets/images/tabbar/${iconName}_active.png",
            width: 32,
            gaplessPlayback: true,
          ),
        );
}
