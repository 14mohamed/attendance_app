import 'package:flutter/material.dart';

class AppConfig {
  static MediaQueryData _mediaQueryData;
  static var _orientation;
  static double screenWidth;
  static double screenHeight;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _orientation = MediaQuery.of(context).orientation;
    if (_orientation == Orientation.portrait) {
      screenWidth = _mediaQueryData.size.width;
      screenHeight = _mediaQueryData.size.height;
    } else {
      screenWidth = _mediaQueryData.size.height;
      screenHeight = _mediaQueryData.size.width;
    }
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}
