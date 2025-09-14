import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:men/core/helpers/app_assets.dart';
import 'package:men/core/helpers/app_buttom.dart';
import 'package:men/core/helpers/app_text_styles.dart';
import 'package:men/core/helpers/cache_helper.dart';
import 'package:men/features/auth/login/view.dart';

class LogOutSheet {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
            height: MediaQuery.of(context).size.height * 0.4,
            // width: 400.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                spacing: 12.h,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SvgPicture.asset(AppAssets.warning),
                  Text(
                    "Logout?",
                    style: AppTextStyles.kTextStyle16MediumBlack,
                  ),
                  Text("Are you sure you want to logout?"),
                  AppButtom(
                    backgroundColor: Colors.red,
                    onPressed: () {
                      CacheHelper.deleteToken();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    text: "Yes LogOut",
                  ),
                  // SizedBox(height: 4.h,),
                  AppButtom(
                    textColor: Colors.black,
                    backgroundColor: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: "No Cancel",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
