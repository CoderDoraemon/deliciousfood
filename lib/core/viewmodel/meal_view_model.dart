import 'package:deliciousfood/core/model/meal_model.dart';
import 'package:deliciousfood/core/service/meal_request.dart';
import 'package:deliciousfood/core/utils/log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LDMealViewModel extends ChangeNotifier  {


  List<LDMealModel> _meals = [];

  List<LDMealModel> get meals => _meals;

  LDMealViewModel() {
    LDMealRequest.getMealData().then((res) {
      Log(res);
      
    });
  }

}