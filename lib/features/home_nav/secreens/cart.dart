import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men/core/helpers/app_assets.dart';
import 'package:men/core/helpers/app_colors.dart';
import 'package:men/core/helpers/app_loading.dart';
import 'package:men/core/helpers/app_text_styles.dart';
import 'package:men/features/home_nav/controller/cart_cubit/cart_cubit.dart';

part '../../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Row(
            children: [
              BackButton(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              Text(
                "My Cart",
                style: AppTextStyles.kTextStyle24MediumBlack,
              )
            ],
          ),
          Expanded(
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if(state is CartLoading){
                  return AppLoading();
                }   if(state is CartFailure){
                  return Text("No data");
                }
                if(state is CartSuccess){
                return ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          height: 12.h,
                        ),
                    itemCount: state.model[0].products!.length,
                    itemBuilder: (context, index) => CartItemWidget(
                      amount:state.model[0].products![index].quantity.toString() ,

                    ));
                }return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}
