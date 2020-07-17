import 'package:deliciousfood/ui/pages/home/home_category_item.dart';
import 'package:flutter/material.dart';

import 'package:deliciousfood/core/model/category_model.dart';
import 'package:deliciousfood/core/service/json_parse.dart';
import 'package:deliciousfood/core/extension/int_extentsion.dart';

class LDHomeContent extends StatefulWidget {
  @override
  _LDHomeContentState createState() => _LDHomeContentState();
}

class _LDHomeContentState extends State<LDHomeContent> {
  List<LDCategoryModel> _categorise = [];

  @override
  void initState() {
    super.initState();

    LDJsonParse.getCategoryData().then((res) {
      setState(() {
        _categorise = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(20.px),
        itemCount: _categorise.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.px,
            crossAxisSpacing: 20.px,
            childAspectRatio: 1.5),
        itemBuilder: (ctx, index) {
          return LDHomeCategoryItem(_categorise[index]);
        });
  }
}
