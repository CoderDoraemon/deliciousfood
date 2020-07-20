import 'package:deliciousfood/core/model/category_model.dart';
import 'package:flutter/material.dart';

import 'package:deliciousfood/core/model/meal_model.dart';
import 'package:deliciousfood/ui/pages/meal/meal_content.dart';


class LDMealScreen extends StatelessWidget {

  static const String routeName = "/meal";

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as LDCategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: LDMealContent(),
    );
  }
}
