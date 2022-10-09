import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker_app/common/constants/colors.dart';
import 'package:habit_tracker_app/common/constants/headings.dart';
import 'package:habit_tracker_app/common/constants/textstyles.dart';

class TrackScreen extends StatelessWidget {
  static const routeName = '/new-track-screen';
  const TrackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 20.w,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  trackerAppBarHeading,
                  style: headingStyle,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              trackerTitle,
              style: subHeadingStyle,
            ),
            SizedBox(
              height: 5.h,
            ),
            TextField(
              cursorColor: redColor,
              style:
                  subHeadingStyle.copyWith(color: Colors.grey, fontSize: 15.sp),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                focusColor: redColor.withOpacity(0.33),
                fillColor: Colors.grey.shade100,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: redColor, width: 1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: redColor, width: 1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                hintText: 'Task Title',
                hintStyle: subHeadingStyle.copyWith(
                    color: Colors.grey.shade300, fontSize: 15.sp),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
