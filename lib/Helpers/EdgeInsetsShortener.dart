import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

EdgeInsetsGeometry allMargin(num) {
  return EdgeInsets.all(
    ScreenUtil().setWidth(num ?? 0),
  );
}

EdgeInsetsGeometry singleMargin({top, right, bottom, left}) {
  return EdgeInsets.only(
    top: ScreenUtil().setHeight(top ?? 0),
    right: ScreenUtil().setWidth(right ?? 0),
    bottom: ScreenUtil().setHeight(bottom ?? 0),
    left: ScreenUtil().setWidth(left ?? 0),
  );
}

EdgeInsetsGeometry symmetricMargin({horizontal, vertical}) {
  return EdgeInsets.symmetric(
    horizontal: ScreenUtil().setWidth(horizontal ?? 0),
    vertical: ScreenUtil().setWidth(vertical ?? 0),
  );
}
