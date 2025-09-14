import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:men/core/helpers/app_colors.dart';
import 'package:men/core/helpers/app_text_styles.dart';
import 'package:men/features/home_nav/controller/cart_cubit/cart_cubit.dart';
import 'package:men/features/home_nav/controller/category_cubit/category_cubit.dart';
import 'package:men/features/home_nav/controller/product_cubit/product_cubit.dart';
import 'package:men/features/product_details/view.dart';
import '../../../core/helpers/app_assets.dart';
import '../../../core/helpers/app_field.dart';
import '../../../core/helpers/app_loading.dart';
part '../parts/all_categories.dart';
part '../parts/all_product_home_page.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(
        create: (_) => ProductCubit()..getAllProducts(),),
        BlocProvider(
        create: (_) => CategoryCubit()..getCategoryProducts(),),
    ],
        child: Scaffold(
          backgroundColor: AppColors.scaffoldBackGroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text("Discover", style: AppTextStyles.textStyle32Black),
                SizedBox(
                  height: 16,
                ),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                        child: AppField(
                          hintText: "Search for clothes...",
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.boldGreyColor,
                          ),
                        )),
                    Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.primaryColor),
                      child: SvgPicture.asset(
                        AppAssets.settings,
                        fit: BoxFit.scaleDown,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                AllCategories(),
                AllProductHomePage(),
              ],
            ),
          ),
        ),

    );
  }
}
