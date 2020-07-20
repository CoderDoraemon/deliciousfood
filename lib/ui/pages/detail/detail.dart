import 'package:deliciousfood/core/model/category_model.dart';
import 'package:deliciousfood/core/viewmodel/favorite_view_model.dart';
import 'package:flutter/material.dart';

import 'package:deliciousfood/core/model/meal_model.dart';
import 'package:deliciousfood/ui/pages/detail/detail_content.dart';
import 'package:provider/provider.dart';

class LDDetailScreen extends StatelessWidget {
  static const String routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as LDMealModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: LDDetailContent(meal),
      floatingActionButton: Consumer<LDFavoriteViewModel>(
          builder: (ctx, favoriteVM, child) {
            final isFavorite = favoriteVM.isFavor(meal);
            final iconWidget = isFavorite ? Icons.favorite : Icons.favorite_border;
            final iconColor = isFavorite ? Colors.redAccent : Colors.white;
            return FloatingActionButton(child: Icon(iconWidget, color: iconColor,), onPressed: () {
              favoriteVM.handleMeal(meal);
            });
          }),
    );
  }
}
