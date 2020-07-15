import 'package:flutter/material.dart';

class LDFavorScreen extends StatelessWidget {

  static const String routeName = "/favor";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收藏"),
      ),
      body: Container(
        child: Text("收藏"),
      ),
    );;
  }
}
