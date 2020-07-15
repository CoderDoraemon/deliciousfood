import 'package:deliciousfood/core/model/meal_model.dart';
import 'package:deliciousfood/core/utils/log.dart';

import 'network/http_request.dart';

class LDMealRequest {

  static Future<List<LDMealModel>> getMealData() async {

    final patch = "/meal";

    HttpRequest().request(patch).then((res) {
      Log(res);
    });
  }

}