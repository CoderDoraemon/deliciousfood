import 'package:flutter/cupertino.dart';

class LDCategoryModel {
  String id;
  String title;
  String color;
  Color cColor;

  LDCategoryModel({this.id, this.title, this.color});

  LDCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];

    // 1、将color转出十六进制
    final colorInt = int.parse(color, radix: 16);
    // 2、将透明度加进去
    cColor = Color(colorInt | 0xff000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }
}