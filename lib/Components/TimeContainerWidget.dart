import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niniland/Helpers/AppTheme.dart';
import 'package:niniland/Providers/SoundsProvider.dart';
import 'package:provider/provider.dart';

class TimeContainerWidget extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;
  final int index;
  final String content;
  final Function onTap;

  TimeContainerWidget(
    this.width,
    this.height,
    this.borderRadius,
    this.index,
    this.content,
    this.onTap,
  );

  @override
  _TimeContainerWidgetState createState() => _TimeContainerWidgetState(
        width,
        height,
        borderRadius,
        index,
        content,
        onTap,
      );
}

class _TimeContainerWidgetState extends State<TimeContainerWidget> {
  final double width;
  final double height;
  final double borderRadius;
  final int index;
  final String content;
  final Function onTap;
  var soundsProvider;

  _TimeContainerWidgetState(
    this.width,
    this.height,
    this.borderRadius,
    this.index,
    this.content,
    this.onTap,
  );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Consumer<SoundsProvider>(
        builder: (context, soundsProv, child){
          return GestureDetector(
            onTap: onTap,
            child: Container(
              height: ScreenUtil().setHeight(height) ?? 0,
              width: ScreenUtil().setHeight(width) ?? 0,
              decoration: BoxDecoration(
                color: index == soundsProv.activeDurationIndex ? AppTheme.pink : Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    borderRadius ?? 12,
                  ),
                ),
                border: index != soundsProv.activeDurationIndex
                    ? Border.all(
                  color: AppTheme.pink,
                  width: 3,
                )
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (index == soundsProv.activeDurationIndex)
                    Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                    ),
                  Text(
                    content,
                    textAlign: TextAlign.right,
                    style: AppTheme.fontCreator(
                      8,
                      FontWeights.regular,
                      index != soundsProv.activeDurationIndex ? AppTheme.pink : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
