import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niniland/Helpers/AppTheme.dart';

class DashedContainerWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets innerPadding;
  final Function onTap;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final FDottedLineCorner dotLineBorderRadius;

  const DashedContainerWidget({
    Key key,
    this.child,
    this.innerPadding,
    this.onTap,
    this.width,
    this.height,
    this.borderRadius,
    this.dotLineBorderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width != null ? ScreenUtil().setWidth(width) : null,
      height: height != null ? ScreenUtil().setHeight(height) : null,
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius ??
            BorderRadius.all(
              Radius.circular(12.h),
            ),
        boxShadow: [
          BoxShadow(offset: Offset(3.h, 3.h), color: AppTheme.shadow),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius ??
            BorderRadius.circular(
              ScreenUtil().setWidth(12),
            ),
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.grey.withOpacity(0.2),
          borderRadius: borderRadius ??
              BorderRadius.circular(
                ScreenUtil().setWidth(12),
              ),
          child: FDottedLine(
            color: AppTheme.lightBlue,
            dottedLength: 6.0,
            space: 5.0,
            strokeWidth: 3,
            corner: dotLineBorderRadius ?? FDottedLineCorner.all(12.h),
            child: Padding(
              padding: innerPadding ?? EdgeInsets.zero,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
