import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_tracker_app/common/constants/textstyles.dart';
import 'package:habit_tracker_app/screens/asset_helper.dart';

import '../common/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentIndex = -1;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.pinkLight,
                        AppColors.pink,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Image.asset(
                          AssetHelper.logo,
                          color: Colors.white,
                          scale: 0.8,
                        ),
                        SizedBox(height: 180.h),
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentIndex++;
                            });
                            _controller.nextPage(
                              duration: Duration(milliseconds: 150),
                              curve: Curves.bounceIn,
                            );
                          },
                          child: Container(
                            height: 40.h,
                            width: 320.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.r),
                              color: AppColors.backgroundLight,
                            ),
                            child: Center(
                              child: Text(
                                "Next",
                                style: MyTextStyle.subHeadingStyle,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 100.h),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundLight,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        SvgPicture.asset(
                          AssetHelper.onboardingOne,
                          height: 500.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Text(
                            "Easy task & work management with pomo",
                            style: MyTextStyle.headingStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentIndex++;
                            });
                            _controller.nextPage(
                              duration: Duration(milliseconds: 150),
                              curve: Curves.bounceIn,
                            );
                          },
                          child: Container(
                            height: 40.h,
                            width: 320.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.r),
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.pinkLight,
                                  AppColors.pink,
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Next",
                                style: MyTextStyle.subHeadingStyle.copyWith(
                                  color: AppColors.backgroundLight,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundLight,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        SvgPicture.asset(
                          AssetHelper.onboardingTwo,
                          height: 500.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Text(
                            "Track your productivity & gain insights",
                            style: MyTextStyle.headingStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentIndex++;
                            });
                            _controller.nextPage(
                              duration: Duration(milliseconds: 150),
                              curve: Curves.bounceIn,
                            );
                          },
                          child: Container(
                            height: 40.h,
                            width: 320.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.r),
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.pinkLight,
                                  AppColors.pink,
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Next",
                                style: MyTextStyle.subHeadingStyle.copyWith(
                                  color: AppColors.backgroundLight,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          currentIndex == -1
              ? Container()
              : Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => buildDot(index, context),
                    ),
                  ),
                ),
          currentIndex == -1 ? Container() : SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10.h,
      width: currentIndex == index ? 25.w : 10.w,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.pink,
      ),
    );
  }
}
