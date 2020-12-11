import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niniland/Components/DashedContainerWidget.dart';
import 'package:niniland/Components/LongButton.dart';
import 'package:niniland/Helpers/AppTheme.dart';

class BuyDialog extends StatefulWidget {
  @override
  _BuyDialogState createState() => _BuyDialogState();
}

class _BuyDialogState extends State<BuyDialog> {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 100,
          child: FlareActor("assets/images/Teddy.flr", alignment: Alignment.center, fit: BoxFit.fitHeight,
              callback: (text) {
            if (text == "fail") {
              Navigator.pop(context);
            }
          }, animation: teddyAction),
        ),
        DashedContainerWidget(
          width: 195,
          innerPadding:
              EdgeInsets.only(top: 14.h, bottom: 10.h, left: 9.w, right: 9.w),
          child: Container(
            child: Column(
              children: <Widget>[
                Text(
                  "امکان پخش  بیش تر از یک ساعت در نسخه رایگان وجود ندارد. ممنون می شویم با خرید نسخه کامل ما را در توسعه نرم افزار یاری کنید",
                  style: AppTheme.fontCreator(
                      9, FontWeights.medium, AppTheme.darkBlue),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.h,
                ),
                LongButton(
                  onTap: () {
                    setState(() {
                      teddyAction = "success";
                    });
                  },
                  text: "بله ، کمک میکنم ",
                ),
                SizedBox(
                  height: 3.h,
                ),
                LongButton(
                  onTap: () {
                    setState(() {
                      teddyAction = "fail";
                    });
                  },
                  text: "نه ، دوست ندارم کمک کنم",
                  backgroundColor: AppTheme.gray,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
