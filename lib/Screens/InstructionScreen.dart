import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:niniland/Components/CloudBackgroundWidget.dart';
import 'package:niniland/Components/DashedContainerWidget.dart';
import 'package:niniland/Helpers/AppTheme.dart';
import 'package:niniland/Helpers/EdgeInsetsShortener.dart';

class InstructionScreen extends StatefulWidget {
  @override
  _InstructionScreenState createState() => _InstructionScreenState();
}

class _InstructionScreenState extends State<InstructionScreen> {
  final String mainText = "اگر غذاش رو خورده ، بادگلو هم زده ، زیرش هم تمیزه ولی هنوزم گریه میکنه احتمالا نوزاد شما خیلی خسته شده.\nزمانی که "
      "نوزاد شما خسته است به تنهایی قادر به خوابیدن نیست . این یک وضعیت معمول برای نوزادان تازه متولد شده است این شرایطی است که"
      " این نرم افزار می تواند به شما خیلی کمک بکند .\n ما در این نرم افزار صدای های یکنواخت با فرکانس پایین و اثبات شده توسط سایر والدین رو پخش میکنیم و کمک میکنیم تا دلبند شما راحت تر بخوابد. این صدا ها به دلیل شباهت به صداهایی که نوزاد در شکم مادر می شنود باعث می شود راحت تر به خواب رود.";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: ScreenUtil().setWidth(207),
            height: ScreenUtil().setHeight(368),
            color: AppTheme.lightBlue,
            child: Stack(
              children: [
                ///Cloud Background
                CloudBackgroundWidget(),

                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  height: ScreenUtil().screenHeight,
                  child: SingleChildScrollView(
                    padding: singleMargin(
                      top: 10,
                      bottom: 30,
                    ),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              right: 12,
                              top: 10,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Colors.grey,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.close,
                                    size: 20.w,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "راهنما",
                                    style: AppTheme.fontCreator(33, FontWeights.regular, Colors.white, AppTheme.asemanFontName),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        DashedContainerWidget(
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
                        Container(
                          alignment: Alignment.centerRight,
                          padding: singleMargin(
                            top: 15,
                            bottom: 6,
                            right: 10,
                          ),
                          child: Text(
                            "چرا نوزاد من گریه میکند؟",
                            style: AppTheme.fontCreator(
                              13,
                              FontWeights.bold,
                              Colors.white,
                              AppTheme.iransansFontName,
                            ),
                          ),
                        ),
                        DashedContainerWidget(
                          width: 192,
                          innerPadding: allMargin(5),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              mainText,
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
      ),
    );
  }
}
