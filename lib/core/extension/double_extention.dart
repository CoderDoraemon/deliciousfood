import 'package:deliciousfood/core/utils/size_fit.dart';

extension DoubleFit on double {

  double get px {
    return LDSizeFit.setPx(this);
  }

  double get rpx {
    return LDSizeFit.setRpx(this);
  }
}