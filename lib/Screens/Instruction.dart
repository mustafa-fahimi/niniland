import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niniland/Components/CloudBackground.dart';
import 'package:niniland/Components/DashedContainer.dart';
import 'package:niniland/Helpers/AppTheme.dart';
import 'package:niniland/Helpers/EdgeInsetsShortener.dart';

class InstructionScreen extends StatefulWidget {
  @override
  _InstructionScreenState createState() => _InstructionScreenState();
}

class _InstructionScreenState extends State<InstructionScreen> {
  final String mainText =
      "اگر غذاش رو خورده . بادگلو هم زده ، زیرش هم تمیزه ، ولی هنوزم گریه میکنه ... احتمالا نوزاد شما خیلی خسته شده\n .زمانی که نوزاد شما خسته است به تنهایی قادر به خوابیدن نیست . این یک وضعیت معمول برای نوزادان تازه متولد شده است این شرایطی است که این نرم افزار می تواند به شما خیلی کمک بکند .\n ما در این نرم افزار صدای های یکنواخت با فرکانس پایین و اثبات شده توسط سایر والدین رو پخش میکنیم و کمک میکنیم تا دلبند شما راحت تر بخوابد.این صدا ها به دلیل شباهت به صداهایی که نوزاد در شکم مادر می شنود . باعث می شود راحت تر به خواب رود.";

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(207, 368));
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: ScreenUtil().setWidth(207),
          height: ScreenUtil().setHeight(368),
          color: AppTheme.lightBlue,
          child: Stack(
            children: [
              ///Cloud Background
              CloudBackgroundWidget(),

              ///Moon logo
              Positioned(
                left: ScreenUtil().setWidth(0),
                right: ScreenUtil().setWidth(0),
                top: ScreenUtil().setHeight(7),
                height: ScreenUtil().screenHeight - ScreenUtil().setHeight(22),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "راهنما",
                              style: AppTheme.fontCreator(33, FontWeights.regular,
                                  Colors.white, AppTheme.asemanFontName),
                            ),
                          ],
                        ),
                      ),
                      DashedContainer(
                        isFreeSize: true,
                        width: 192,
                        innerPadding: allMargin(5),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "با توجه به خطرات امواج موبایل لطفا گوشی خود را روی حالت هواپیما قرار دهید. ",
                            textAlign: TextAlign.right,
                            style: AppTheme.fontCreator(
                              12,
                              FontWeights.medium,
                              AppTheme.darkBlue,
                              AppTheme.iransansFontName,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 14.h, bottom: 7.h),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "چرا نوزاد من گریه میکند؟",
                              style: AppTheme.fontCreator(13, FontWeights.bold,
                                  Colors.white, AppTheme.iransansFontName),
                            ),
                          ],
                        ),
                      ),
                      DashedContainer(
                        isFreeSize: true,
                        width: 192,
                        innerPadding: allMargin(5),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            mainText + mainText + mainText,
                            textAlign: TextAlign.justify,
                            style: AppTheme.fontCreator(
                              8,
                              FontWeights.medium,
                              AppTheme.darkBlue,
                              AppTheme.iransansFontName,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
