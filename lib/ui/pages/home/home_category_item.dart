import 'package:flutter/material.dart';

import 'package:deliciousfood/core/extension/int_extentsion.dart';
import 'package:deliciousfood/core/model/category_model.dart';

class LDHomeCategoryItem extends StatelessWidget {
  final LDCategoryModel _categoryModel;

  LDHomeCategoryItem(this._categoryModel);

  @override
  Widget build(BuildContext context) {
    final bgColor = _categoryModel.cColor;

    return Container(
      decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(12.px),
          gradient:
              LinearGradient(colors: [bgColor.withOpacity(0.5), bgColor])),
      alignment: Alignment.center,
      child: Text(
        _categoryModel.title,
        style: TextStyle(fontSize: 16.px, fontWeight: FontWeight.bold),
      ),
    );
  }
}
