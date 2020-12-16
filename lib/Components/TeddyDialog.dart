import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niniland/Components/DashedContainerWidget.dart';
import 'package:niniland/Components/LongButton.dart';
import 'package:niniland/Helpers/AppTheme.dart';

class TeddyDialog extends StatefulWidget {
  final String mainContent;
  final String confirmText;
  final String cancelText;
  final bool showCancelBtn;
  final Function onTapConfirm;

  TeddyDialog(
    this.mainContent,
    this.confirmText,
    this.cancelText,
    this.showCancelBtn,
    this.onTapConfirm,
  );

  @override
  _TeddyDialogState createState() => _TeddyDialogState();
}

class _TeddyDialogState extends State<TeddyDialog> {
  String teddyAction = "idle";

  //hands_down
  //hands_up
  //test
  //idle
  //fail
  //success

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(207, 368));
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 100,
            child: FlareActor(
              "assets/images/Teddy.flr",
              alignment: Alignment.center,
              fit: BoxFit.fitHeight,
              callback: (text) {
                if (text == "fail") {
                  Navigator.pop(context);
                }
              },
              animation: teddyAction,
            ),
          ),
          DashedContainerWidget(
            width: 195,
            innerPadding: EdgeInsets.only(
              top: 14.h,
              bottom: 10.h,
              left: 10.w,
              right: 10.w,
            ),
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    widget.mainContent,
                    style: AppTheme.fontCreator(9, FontWeights.medium, AppTheme.darkBlue),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  LongButton(
                    onTap: widget.onTapConfirm,
                    text: widget.confirmText,
                  ),
                  if (widget.showCancelBtn)
                    SizedBox(
                      height: 3.h,
                    ),
                  if (widget.showCancelBtn)
                    LongButton(
                      onTap: () {
                        setState(() {
                          teddyAction = "fail";
                        });
                      },
                      text: widget.cancelText ?? "",
                      backgroundColor: AppTheme.gray,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
