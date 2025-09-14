import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:men/core/helpers/app_assets.dart';
import 'package:men/core/helpers/app_colors.dart';
import 'package:men/home_nav/controller/cart_cubit/cart_cubit.dart';
import 'package:men/features/home_nav/secreens/account.dart';
import 'package:men/features/home_nav/secreens/cart.dart';
import 'package:men/features/home_nav/secreens/home_page.dart';

class HomeNavScreen extends StatefulWidget {
  const HomeNavScreen({super.key});

  @override
  State<HomeNavScreen> createState() => _HomeNavScreenState();
}

class _HomeNavScreenState extends State<HomeNavScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomePage(),
    CartScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getUserCart(1),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackGroundColor,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            backgroundColor: AppColors.scaffoldBackGroundColor,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.greyColor,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.homeSvg,
                    colorFilter: ColorFilter.mode(
                        currentIndex == 0
                            ? AppColors.primaryColor
                            : AppColors.greyColor,
                        BlendMode.srcIn),
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.cartSvg,
                    colorFilter: ColorFilter.mode(
                        currentIndex == 1
                            ? AppColors.primaryColor
                            : AppColors.greyColor,
                        BlendMode.srcIn),
                  ),
                  label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined), label: "Account"),
            ]),
        body: screens[currentIndex],
      ),
    );
  }
}
