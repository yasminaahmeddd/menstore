part of 'product_cubit.dart';

abstract class ProductStates {}

 class ProductInitial extends ProductStates {}
 class ProductLoading extends ProductStates {}
 class ProductSuccess extends ProductStates {
  List<ProductModel>model;
  ProductSuccess(this.model);

}
final class ProductFailure extends ProductStates {
  final String errMsg;
  ProductFailure(this.errMsg);



}
