import 'package:flutter/material.dart';

import 'home_content.dart';

class LDHomeScreen extends StatelessWidget {

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: LDHomeContent(),
    );
  }
}