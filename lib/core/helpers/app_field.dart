import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:men/core/helpers/app_colors.dart';
import 'package:men/core/helpers/app_text_styles.dart';
class AppField extends StatelessWidget {
   AppField({super.key,this.controller,this.eyeWidget,this.prefixIcon,
     required this.hintText,this.showEyeIcon=false,this.obscureText=false});
  TextEditingController? controller;
  String? hintText;
  bool showEyeIcon;
  Widget ?eyeWidget;
  bool obscureText;
  Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obscureText ,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon:showEyeIcon==false?SizedBox.shrink():eyeWidget,

        hintStyle: AppTextStyles.kTextStyle16Grey.copyWith(
          fontWeight: FontWeight.w400
        ),
          hintText:hintText ,
          focusedBorder: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.borderFieldColor)
            
          )),
    );
  }
}
