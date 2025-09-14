import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men/core/helpers/cache_helper.dart';
import 'package:men/core/networking/dio_helper.dart';
import 'package:men/features/auth/login/state.dart';
import 'package:men/models/user_model.dart';
import '../../../core/networking/app_end_points.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  void toggleEye() {
    obscureText = !obscureText;
    emit(LoginInitial());
  }

  void login() async {
    try {
      emit(LoginLoading());
      final Response response = await DioHelper.postRequest(
          endPoint: AppEndPoints.login,
          data: {
            "username": nameController.text,
            "password": passwordController.text
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        UserModel userModel = UserModel.fromJson(response.data);
        if (userModel.token != null) {
          await CacheHelper.saveToken(userModel.token!);
        } else {
          emit(LoginFailure("No token Found"));
        }

        emit(LoginSuccess(response.data.toString()));
      } else {
        emit(LoginFailure(response.data.toString()));
      }
    } on DioException catch (e) {
      emit(LoginFailure(e.response!.data.toString()));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
