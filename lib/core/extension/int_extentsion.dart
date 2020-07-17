import 'package:deliciousfood/core/utils/size_fit.dart';

extension IntFit on int {

  double get px {
    return LDSizeFit.setPx(this.toDouble());
  }
  
  double get rpx {
    return LDSizeFit.setRpx(this.toDouble());
  }
}