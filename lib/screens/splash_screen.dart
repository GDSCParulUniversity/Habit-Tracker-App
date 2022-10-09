import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  int currentIndex = 0;
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
        body: PageView(
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
          decoration: BoxDecoration(),
          child: Center(
            child: Image.asset(
              AssetHelper.logo,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ));
  }
}
