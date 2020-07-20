
import 'package:deliciousfood/core/model/meal_model.dart';
import 'package:flutter/material.dart';

class LDFavoriteViewModel extends ChangeNotifier {

  List<LDMealModel> _meals = [];

  List<LDMealModel> get meals => _meals;

  void addMeal(LDMealModel meal) {
    _meals.add(meal);
    notifyListeners();
  }

  void removeMeal(LDMealModel meal) {
    _meals.remove(meal);
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
    return _meals.contains(meal);
  }
}