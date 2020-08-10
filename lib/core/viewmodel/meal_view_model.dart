import 'package:flutter/material.dart';
import 'package:deliciousfood/core/service/meal_request.dart';

import 'base_view_model.dart';

class LDMealViewModel extends LDBaseViewModel {

  LDMealViewModel() {
    LDMealRequest.getMealData().then((res) {
      meals = res;
    });
  }
}
