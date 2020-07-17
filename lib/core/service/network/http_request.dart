import 'package:dio/dio.dart';
import 'http_config.dart';
import 'methods.dart';
import 'error_model.dart';
import 'base_model.dart';
import 'base_list_model.dart';

class HttpRequest {

  static final HttpRequest _shared = HttpRequest._initialize();
  factory HttpRequest() => _shared;
  Dio dio;

  HttpRequest._initialize() {
    if (dio == null) {
      // 1、请求配置
      BaseOptions options = BaseOptions(
        baseUrl: HttpConfig.baseURL,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        receiveDataWhenStatusError: false,
        connectTimeout: HttpConfig.timeout,
        receiveTimeout: 3000,
      );
      dio = Dio(options);

      // 2、添加拦截器
      Interceptor dInter =
      InterceptorsWrapper(onRequest: (RequestOptions options) {
        print("请求之前");
        // 设置loading

        // 做token处理

        // 对参数进行处理（序列化）

        return options;
      }, onResponse: (Response response) {
        print("响应之前");
        return response;
      }, onError: (DioError error) {
        print("错误之前");
        return error;
      });

      dio.interceptors.add(dInter);
    }
  }

  // 请求，返回参数为 T
  // method：请求方法，NWMethod.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future<T> request<T>(String path, {Map<String, dynamic> params, Method method = Method.get}) async {
    try {
      Response response = await dio.request(path, queryParameters: params, options: Options(method: method.value));

      if (response != null) {
        return response.data;
        BaseModel entity = BaseModel<T>.fromJson(response.data);
        if (entity.code == 0) {
          return entity.data;
        } else {
          return Future.error(ErrorModel(code: entity.code, message: entity.message));
        }
      } else {
        return Future.error(ErrorModel(code: -1, message: "未知错误"));
      }
    } on DioError catch(e) {
      return Future.error(createErrorEntity(e));
    }
  }

  // 请求，返回参数为 List
  // method：请求方法，NWMethod.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future<List<T>> requestList<T>(String path, {Map<String, dynamic> params, Method method}) async {
    try {
      Response response = await dio.request(path, queryParameters: params, options: Options(method: method.value));
      if (response != null) {
        BaseListModel entity = BaseListModel<T>.fromJson(response.data);
        if (entity.code == 0) {
          return entity.data;
        } else {
          return Future.error(ErrorModel(code: entity.code, message: entity.message));
        }
      } else {
        return Future.error(ErrorModel(code: -1, message: "未知错误"));
      }
    } on DioError catch(e) {
      return Future.error(createErrorEntity(e));
    }
  }

  // 错误信息
  ErrorModel createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:{
        return ErrorModel(code: -1, message: "请求取消");
      }
      break;
      case DioErrorType.CONNECT_TIMEOUT:{
        return ErrorModel(code: -1, message: "连接超时");
      }
      break;
      case DioErrorType.SEND_TIMEOUT:{
        return ErrorModel(code: -1, message: "请求超时");
      }
      break;
      case DioErrorType.RECEIVE_TIMEOUT:{
        return ErrorModel(code: -1, message: "响应超时");
      }
      break;
      case DioErrorType.RESPONSE:{
        try {
          int errCode = error.response.statusCode;
          String errMsg = error.response.statusMessage;
          return ErrorModel(code: errCode, message: errMsg);
//          switch (errCode) {
//            case 400: {
//              return ErrorEntity(code: errCode, message: "请求语法错误");
//            }
//            break;
//            case 403: {
//              return ErrorEntity(code: errCode, message: "服务器拒绝执行");
//            }
//            break;
//            case 404: {
//              return ErrorEntity(code: errCode, message: "无法连接服务器");
//            }
//            break;
//            case 405: {
//              return ErrorEntity(code: errCode, message: "请求方法被禁止");
//            }
//            break;
//            case 500: {
//              return ErrorEntity(code: errCode, message: "服务器内部错误");
//            }
//            break;
//            case 502: {
//              return ErrorEntity(code: errCode, message: "无效的请求");
//            }
//            break;
//            case 503: {
//              return ErrorEntity(code: errCode, message: "服务器挂了");
//            }
//            break;
//            case 505: {
//              return ErrorEntity(code: errCode, message: "不支持HTTP协议请求");
//            }
//            break;
//            default: {
//              return ErrorEntity(code: errCode, message: "未知错误");
//            }
//          }
        } on Exception catch(_) {
          return ErrorModel(code: -1, message: "未知错误");
        }
      }
      break;
      default: {
        return ErrorModel(code: -1, message: error.message);
      }
    }
  }
}
