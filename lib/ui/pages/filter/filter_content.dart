import 'package:deliciousfood/ui/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

import 'package:deliciousfood/core/model/category_model.dart';
import 'package:deliciousfood/core/model/meal_model.dart';
import 'package:deliciousfood/core/viewmodel/meal_view_model.dart';

class LDFilterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("过滤"),
    );
  }
}

