import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men/core/networking/dio_helper.dart';
import '../../../../core/networking/app_end_points.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  int currentIndex = 0;
  List<String> categories = [];
  void changeIndex(int index) {
    currentIndex = index;
    emit(CategorySuccess(categories, index));
  }

  getCategoryProducts() async {
    try {
      emit(CategoryLoading());
      final Response response =
          await DioHelper.getRequest(endPoint: AppEndPoints.allCategories);
      if (response.statusCode == 200) {
        final list = List<String>.from((response.data as List));
        list.insert(0, "All");
        categories = list;
        emit(CategorySuccess(categories, currentIndex));
      }
    } on DioException {
      emit(CategoryFailure());
    } catch (e) {
      emit(CategoryFailure());
    }
  }

}
