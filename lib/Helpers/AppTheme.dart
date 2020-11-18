import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {

  static TextStyle iranSansStyle(double size, Color color,
      [FontWeight fontWeight = FontWeight.w300]) {
    return TextStyle(
      fontFamily: "IRANSans",
      fontSize: ScreenUtil().setSp(size),
      fontWeight: fontWeight,
      color: color ?? Color(0xFF00728e),
    );
  }

  ///Colors blue family
  static Color darkBlue = Color(0xFF00728e);
  static Color lightBlue = Color(0xFF9dd6e4);
  static Color lightBlue2 = Color(0xFF3acce1);

  /// white and black family
  static Color gray = Color(0xFF707070);
  static Color shadow = Color(0x29000000);
}
