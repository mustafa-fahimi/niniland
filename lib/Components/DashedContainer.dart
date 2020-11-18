
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niniland/Helpers/AppTheme.dart';

class DashedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets innerPadding;
  const DashedContainer({Key key, this.child, this.innerPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(207, 368));
    return Container(
      padding: EdgeInsets.all(2.5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12.h)),
        boxShadow: [
          BoxShadow(
            offset: Offset(3,3),
            color: AppTheme.shadow
          )
        ]
      ),
      child: DottedBorder(
        color: AppTheme.lightBlue,
        dashPattern: [5,5],
        strokeWidth: 3,
        borderType: BorderType.RRect,
        radius: Radius.circular(12.h),
        padding: innerPadding ?? EdgeInsets.all(2.h),
        child: child,
      ),
    );
  }
}
