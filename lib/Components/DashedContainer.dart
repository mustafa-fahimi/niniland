import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niniland/Helpers/AppTheme.dart';
import 'package:niniland/Helpers/EdgeInsetsShortener.dart';

class DashedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets innerPadding;
  final Function onTap;
  final double width;
  final double height;

  const DashedContainer({
    Key key,
    this.child,
    this.innerPadding,
    this.onTap,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(207, 368));
    return Container(
      width: ScreenUtil().setWidth(width ?? 100),
      height: ScreenUtil().setHeight(height ?? 80),
      padding: EdgeInsets.all(2.5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12.h),
        ),
        boxShadow: [
          BoxShadow(offset: Offset(3.h, 3.h), color: AppTheme.shadow),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(12),
        ),
        child: InkWell(
          onTap: onTap ?? () {},
          splashColor: Colors.grey,
          borderRadius: BorderRadius.circular(
            ScreenUtil().setWidth(12),
          ),
          child: DottedBorder(
            color: AppTheme.lightBlue,
            dashPattern: [5, 5],
            strokeWidth: 3,
            borderType: BorderType.RRect,
            radius: Radius.circular(12.h),
            padding: innerPadding ?? allMargin(2.h),
            child: child,
          ),
        ),
      ),
    );
  }
}
