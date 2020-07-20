import 'package:deliciousfood/core/viewmodel/favorite_view_model.dart';
import 'package:deliciousfood/ui/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LDFavorContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LDFavoriteViewModel>(
        builder: (ctx, favoriteVM, child) {
          return ListView.builder(
              itemCount: favoriteVM.meals.length,
              itemBuilder: (ctx, index) {
                return LDMealItem(favoriteVM.meals[index]);
              });
        });
  }
}

