import 'package:deliciousfood/core/model/meal_model.dart';
import 'package:deliciousfood/core/utils/log.dart';

import 'network/http_request.dart';

class LDMealRequest {

  static Future<List<LDMealModel>> getMealData() async {

    final patch = "/meal";

    final result = await HttpRequest().request(patch);

    final mealArray = result["meal"];
    List<LDMealModel> meals = [];
    for (var meal in mealArray) {
      meals.add(LDMealModel.fromJson(meal));
    }

    return meals;
  }

}