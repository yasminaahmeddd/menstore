import 'package:flutter/material.dart';
import 'package:men/core/helpers/app_colors.dart';
import 'package:men/core/helpers/app_text_styles.dart';
class AppButtom extends StatelessWidget {
   AppButtom({super.key,required this.onPressed, this.text,this.widget,this.backgroundColor,this.textColor});
  void Function()? onPressed;
  String ?text;
  Widget?widget;
  Color? backgroundColor;
  Color? textColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:ElevatedButton.styleFrom(
          fixedSize: Size.fromHeight(60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          backgroundColor:backgroundColor?? AppColors.primaryColor,
        ) ,
        onPressed: onPressed,
        child:widget?? Text(text??"",style: AppTextStyles.kTextStyle14MediumWhite.copyWith(color:textColor??Colors.white ),))

    ;
  }
}
