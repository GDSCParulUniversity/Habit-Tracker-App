import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextStyle {
  static TextStyle headingStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      color: Colors.black,
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
    ),
  );
  static TextStyle subHeadingStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      color: Colors.black,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
    ),
  );
}
