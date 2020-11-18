import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niniland/Helpers/AppTheme.dart';

class LongButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final Color backgroundColor;

  const LongButton({Key key, this.onTap, this.text, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(207, 368));
    return FlatButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppTheme.lightBlue2,
          borderRadius: BorderRadius.all(
            Radius.circular(6.h),
          ),
        ),
        child: Text(
          text ?? "",
          style: AppTheme.fontCreator(9, FontWeights.medium,  Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
