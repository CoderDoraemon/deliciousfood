import 'model_factory.dart';

class BaseModel<T> {
  int code;
  String message;
  T data;

  BaseModel({this.code, this.message, this.data});

  factory BaseModel.fromJson(json) {
    return BaseModel(
      code: json["code"],
      message: json["msg"],
      // data值需要经过工厂转换为我们传进来的类型
      data: ModelFactory.generateObj<T>(json["data"]),
    );
  }
}
