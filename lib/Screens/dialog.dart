import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niniland/Components/DashedContainer.dart';
import 'package:niniland/Components/LongButton.dart';
import 'package:niniland/Helpers/AppTheme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return MyCustomDialog();
            },
          );
        },
        child: Container(
          width: 1.sw,
          height: 100,
          color: Colors.red,
          child: Text("Tap Me"),
        ),
      ),
    );
  }
}


class MyCustomDialog extends StatefulWidget {
  @override
  _MyCustomDialogState createState() => _MyCustomDialogState();
}

class _MyCustomDialogState extends State<MyCustomDialog> {
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
            child: FlareActor("assets/images/Teddy.flr",
                alignment: Alignment.center,
                fit: BoxFit.fitHeight,
                callback: (text){
                  if(text == "fail"){
                    Navigator.pop(context);
                  }
                },
                animation: teddyAction)),
        DashedContainer(
          innerPadding: EdgeInsets.only(top: 14.h,bottom: 10.h,left: 9.w,right: 9.w),
          child: Container(
            width: 0.78.sw,
            child: Column(
              children: <Widget>[
                Text(
                  "امکان پخش  بیش تر از یک ساعت در نسخه رایگان وجود ندارد. ممنون می شویم با خرید نسخه کامل ما را در توسعه نرم افزار یاری کنید",
                  style: AppTheme.iranSansStyle(9,AppTheme.darkBlue,FontWeight.w400),
                  textAlign:  TextAlign.center,
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
