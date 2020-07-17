import 'dart:ui';

class LDSizeFit {

  static double physicalWidth;
  static double physicalHeight;
  static double screenWidth;
  static double screenHeight;
  static double dpr;
  static double statusHeight;

  static double rpx;
  static double px;

  static void initialize({double standardSize = 750.0}) {
    // 1、手机的物理分辨率（px）
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    // 2、dpr
    dpr = window.devicePixelRatio;

    // 3、屏幕宽度和高度（点）
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    rpx = screenWidth / standardSize;
    px = rpx * 2.0;
  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return px * size;
  }
}

extension _int on int {
  
}