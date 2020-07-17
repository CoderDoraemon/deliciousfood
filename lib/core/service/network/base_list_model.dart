import 'model_factory.dart';

class BaseListModel<T> {
  int code;
  String message;
  List<T> data;

  BaseListModel({this.code, this.message, this.data});

  factory BaseListModel.fromJson(json) {
    List<T> mData = List();
    if (json['data'] != null) {
      //遍历data并转换为我们传进来的类型
      (json['data'] as List).forEach((v) {
        mData.add(ModelFactory.generateObj<T>(v));
      });
    }

    return BaseListModel(
      code: json["code"],
      message: json["msg"],
      data: mData,
    );}
}