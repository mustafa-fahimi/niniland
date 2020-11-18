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

  static Color lightBlueColor = Color(0xff9dd6e4);
  static Color lightPinkColor = Color(0xfff79d9d);

  static const asemanFontName = 'aseman';

  static TextStyle fontCreator(fontSize, FontWeights fontWeights, fontColor, [lineHeight]) {
    return TextStyle(
      color: fontColor,
      fontFamily: asemanFontName,
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
