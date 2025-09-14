import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men/core/networking/app_end_points.dart';
import 'package:men/core/networking/dio_helper.dart';
import 'package:men/models/product_model.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductStates>{
  ProductCubit() : super(ProductInitial());

getAllProducts()async{
  try {
    emit(ProductLoading());
  final Response response= await DioHelper.getRequest(endPoint: AppEndPoints.allProducts);
  if(response.statusCode==200||response.statusCode==201){
    final list=List<ProductModel>.from((
    response.data as List
    ).map((e)=>ProductModel.fromJson(e))
    );
    emit(ProductSuccess(list));
  }

  }on DioException catch(e){
    emit(ProductFailure(e.toString()));

  }

  catch(e){
    emit(ProductFailure(e.toString()));
  }


}
updateCategoryProduct(categoryName) async {
    try {
      emit(ProductLoading());
      final Response response = await DioHelper.getRequest(
          endPoint: "${AppEndPoints.productCategories}$categoryName");

      if (response.statusCode == 200) {
        final list = List<ProductModel>.from(
            (response.data as List).map((e) => ProductModel.fromJson(e)));

        emit(ProductSuccess(list));
      } else {
        emit(ProductFailure(""));
      }
    } on DioException  {
      emit(ProductFailure(""));
    } catch (e) {
      emit(ProductFailure("errMsg"));
    }
  }




}
