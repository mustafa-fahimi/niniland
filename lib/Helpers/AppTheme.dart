import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum FontWeights {
  light,
  regular,
  medium,
  bold,
  black,
}

class AppTheme {
  BuildContext _mContext;

  AppTheme(BuildContext mContext) {
    this._mContext = mContext;
    ScreenUtil.init(_mContext,
        designSize: Size(MediaQuery.of(_mContext).size.width, MediaQuery.of(_mContext).size.height),
        allowFontScaling: true);
  }

  ///Colors
  static Color lightBlue = Color(0xff9dd6e4);
  static Color lightBlue2 = Color(0xFF3acce1);
  static Color darkBlue = Color(0xFF00728e);
  static Color lightPink = Color(0xfff79d9d);
  static Color pink = Color(0xffed84a6);
  static Color gray = Color(0xFF707070);
  static Color shadow = Color(0x29000000);

  static const asemanFontName = 'aseman';
  static const iransansFontName = 'IRANSans';

  static TextStyle fontCreator(fontSize, FontWeights fontWeights, fontColor, [fontName, lineHeight]) {
    return TextStyle(
      color: fontColor,
      fontFamily: fontName ?? iransansFontName,
      fontWeight: fontWeights == FontWeights.light
          ? FontWeight.w300
          : fontWeights == FontWeights.regular
          ? FontWeight.w400
          : fontWeights == FontWeights.medium
          ? FontWeight.w500
          : fontWeights == FontWeights.bold
          ? FontWeight.w700
          : FontWeight.w800,
      height: lineHeight,
      fontSize: ScreenUtil().setSp(fontSize),
    );
  }

}
