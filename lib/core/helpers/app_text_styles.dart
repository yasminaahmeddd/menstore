import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men/core/helpers/app_colors.dart';

class AppTextStyles{
  static final kHeadTextStyle32=TextStyle(
    fontSize: 35.sp,
    color: Colors.black,
    fontWeight: FontWeight.w800
  );
  static final kTextStyle16Grey=TextStyle(
    fontSize: 16.sp,
    color: Color(0xff808080),
    fontWeight: FontWeight.w500
  );
  static final kTextStyle16MediumBlack=TextStyle(
    fontSize: 20.sp,
    color: Colors.black,
    fontWeight: FontWeight.w800
  );
  static final textStyle32Black=TextStyle(
    fontSize: 32.sp,
    color: Colors.black,
    fontWeight: FontWeight.w800
  );
  static final kTextStyle16MediumGrey=TextStyle(
    fontSize: 16.sp,
    color: AppColors.boldGreyColor,
    fontWeight: FontWeight.w500
  );
  static final kTextStyle24MediumBlack=TextStyle(
    fontSize: 24.sp,
    color: Colors.black,
    fontWeight: FontWeight.w700
  );
  static final kTextStyle16UnderLineMediumBlack= TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      decoration: TextDecoration.underline
  );
  static final kTextStyle14MediumWhite=TextStyle(
    fontSize: 14.sp,
    color: Colors.white,
    fontWeight: FontWeight.w500
  );

}