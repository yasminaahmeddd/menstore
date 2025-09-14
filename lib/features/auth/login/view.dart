import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men/core/helpers/app_buttom.dart';
import 'package:men/core/helpers/app_colors.dart';
import 'package:men/core/helpers/app_field.dart';
import 'package:men/core/helpers/app_text_styles.dart';
import 'package:men/core/helpers/snack_bar.dart';
import 'package:men/features/auth/login/cubit.dart';
import 'package:men/features/auth/login/state.dart';
import 'package:men/features/home_nav/view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackGroundColor,
        body: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginFailure) {
              mySnackBar(
                  msg: state.msg,
                  type: AnimatedSnackBarType.error,
                  context: context);
            }
            if (state is LoginSuccess) {
              mySnackBar(
                  msg: "Login Success",
                  type: AnimatedSnackBarType.success,
                  context: context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeNavScreen(),
                  ));
            }
          },
          builder: (context, state) {
            final cubit = context.read<LoginCubit>();
            if (state is LoginLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.only(
                  left: 24.0, right: 24, top: 70, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "loginToYourAccount",
                    style: AppTextStyles.kHeadTextStyle32,
                  ).tr(),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                  "welcome"  ,
                    style: AppTextStyles.kTextStyle16Grey,
                  ).tr(),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "UserName",
                    style: AppTextStyles.kTextStyle16MediumBlack,
                  ).tr(),
                  SizedBox(
                    height: 4,
                  ),
                  AppField(
                    hintText: "yourName".tr(),
                    controller: cubit.nameController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Password".tr(),
                    style: AppTextStyles.kTextStyle16MediumBlack,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  AppField(
                    showEyeIcon: true,
                    obscureText: cubit.obscureText,
                    eyeWidget:IconButton(
                      onPressed: (){
                       cubit.toggleEye();
                      },
                    icon:Icon(
                        cubit.obscureText?Icons.visibility_off:
                        Icons.visibility_outlined
                    )
                      ,color: Colors.grey,) ,
                    hintText: "yourPassword".tr(),
                    controller: cubit.passwordController,
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  AppButtom(
                    text: "login".tr(),
                    onPressed: () => cubit.login(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
