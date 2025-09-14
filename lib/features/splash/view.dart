import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:men/core/helpers/app_assets.dart';
import 'package:men/features/auth/login/view.dart';

import '../../core/helpers/cache_helper.dart';
import '../home_nav/view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 6), () async {
      CacheHelper.getToken().then((value) {
        if (value.isNotEmpty) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeNavScreen(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Lottie.asset(AppAssets.splashJson)),
    );
  }
}
