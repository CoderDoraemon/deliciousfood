import 'package:deliciousfood/ui/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

import 'package:deliciousfood/core/model/category_model.dart';
import 'package:deliciousfood/core/model/meal_model.dart';
import 'package:deliciousfood/core/viewmodel/meal_view_model.dart';

class LDMealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute
        .of(context)
        .settings
        .arguments as LDCategoryModel;
    return Selector<LDMealViewModel, List<LDMealModel>>(
      selector: (ctx, mealVM) {
        return mealVM.meals.where((meal) {
          return meal.categories.contains(category.id);
        }).toList();
      },
      shouldRebuild: (prev, next) => !ListEquality().equals(prev, next),
      builder: (ctx, meals, child) {
        return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) {
              return LDMealItem(meals[index]);
            });
      },
    );
  }
}

