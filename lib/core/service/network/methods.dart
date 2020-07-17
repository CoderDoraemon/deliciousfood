enum Method {
  get,
  post,
  put,
  patch,
  delete,
  head
}

/// 使用拓展枚举替代 switch判断取值
extension MethodExtension on Method {
  String get value => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD'][this.index];
}