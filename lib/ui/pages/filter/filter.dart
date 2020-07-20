import 'package:flutter/material.dart';

import 'package:deliciousfood/ui/pages/filter/filter_content.dart';

class LDFilterScreen extends StatelessWidget {

  static const String routeName = "/filter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("过滤"),
      ),
      body: LDFilterContent(),
    );
  }
}
