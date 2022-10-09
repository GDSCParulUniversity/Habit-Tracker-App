import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker_app/common/constants/colors.dart';
import 'package:habit_tracker_app/common/constants/headings.dart';
import 'package:habit_tracker_app/common/constants/textstyles.dart';
import 'package:intl/intl.dart';

class TrackScreen extends StatefulWidget {
  static const routeName = '/new-track-screen';
  const TrackScreen({Key? key}) : super(key: key);

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  String pickedData = '';
  String pickedTime = '';
  TimeOfDay initialTime = TimeOfDay.now();
  Future<void> timerPicker() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    setState(() {
      this.pickedTime = '${pickedTime!.hour} : ${pickedTime.minute}';
    });
  }

  // Initial Selected Value
  String dropdownvalue = 'Category';

  // List of items in our dropdown menu
  var items = [
    'Category',
    'Food',
    'Sleep',
  ];

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
                  style: MyTextStyle.headingStyle,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              trackerTitle,
              style: MyTextStyle.subHeadingStyle,
            ),
            SizedBox(
              height: 5.h,
            ),
            TextField(
              cursorColor: AppColors.primaryColor,
              style: MyTextStyle.subHeadingStyle
                  .copyWith(color: Colors.grey, fontSize: 15.sp),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                focusColor: AppColors.primaryColor.withOpacity(0.33),
                fillColor: Colors.grey.shade100,
                filled: true,
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                hintText: 'Task Title',
                hintStyle: MyTextStyle.subHeadingStyle
                    .copyWith(color: Colors.grey.shade300, fontSize: 15.sp),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trackerDate,
                      style:MyTextStyle.subHeadingStyle,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    InkWell(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            this.pickedData =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                      child: Container(
                        height: 45.h,
                        width: 155.w,
                        decoration: BoxDecoration(
                          color:AppColors.greyColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Row(
                              children: [
                                Text(
                                  pickedData == '' ? trackerDate : pickedData,
                                  style: MyTextStyle.subHeadingStyle.copyWith(
                                    fontSize: 15.sp,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.calendar_month_sharp,
                                  size: 15.sp,
                                  color: Colors.grey.shade700,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trackerStartTime,
                      style: MyTextStyle.subHeadingStyle,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    InkWell(
                      onTap: () {
                        timerPicker();
                      },
                      child: Container(
                        height: 45.h,
                        width: 155.w,
                        decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Row(
                              children: [
                                Text(
                                  pickedTime == ''
                                      ? trackerStartTime
                                      : pickedTime,
                                  style: MyTextStyle.subHeadingStyle.copyWith(
                                    fontSize: 15.sp,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.timer,
                                  size: 15.sp,
                                  color: Colors.grey.shade700,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              trackerSelectCat,
              style: MyTextStyle.subHeadingStyle,
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              height: 45.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.greyColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: DropdownButton(
                  // Initial Value
                  value: dropdownvalue,

                  // Down Arrow Icon
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 250.w,
                      ),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  style: MyTextStyle.subHeadingStyle.copyWith(
                    fontSize: 15.sp,
                    color: Colors.grey.shade700,
                  ),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
