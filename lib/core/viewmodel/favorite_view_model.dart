
import 'package:deliciousfood/core/model/meal_model.dart';
import 'package:deliciousfood/core/viewmodel/base_view_model.dart';
import 'package:flutter/material.dart';

class LDFavoriteViewModel extends LDBaseViewModel {

  void addMeal(LDMealModel meal) {
    originMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(LDMealModel meal) {
    originMeals.remove(meal);
    notifyListeners();
  }

  void handleMeal(LDMealModel meal) {
    if (isFavor(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }

  }

  bool isFavor(LDMealModel meal) {
    return originMeals.contains(meal);
  }
}