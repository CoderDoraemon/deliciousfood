import 'dart:convert';

import 'package:deliciousfood/core/model/category_model.dart';
import 'package:flutter/services.dart';

class LDJsonParse {
  static Future<List<LDCategoryModel>> getCategoryData() async {
    // 1、加载json文件
    final jsonString = await rootBundle.loadString("assets/json/category.json");

    // 2、json转map
    final res = json.decode(jsonString);

    // 2、转模型
    final resList = res["category"];
    List<LDCategoryModel> categorise = [];

    for (var json in resList) {
      categorise.add(LDCategoryModel.fromJson(json));
    }

    return categorise;
  }
}
