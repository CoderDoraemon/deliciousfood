import 'package:deliciousfood/core/model/meal_model.dart';
import 'package:deliciousfood/core/viewmodel/filter_view_model.dart';
import 'package:flutter/material.dart';

class LDBaseViewModel extends ChangeNotifier {

  List<LDMealModel> _meals = [];

  LDFilterViewModel _filterVM;

  void updateFilters(LDFilterViewModel filterVM) {
    _filterVM = filterVM;
  }

  List<LDMealModel> get meals {
    return _meals.where((meal) {
      if (_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian) return false;
      if (_filterVM.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  List<LDMealModel> get originMeals {
    return _meals;
  }

  set meals(List<LDMealModel> value) {
    _meals = value;
    notifyListeners();
  }

}