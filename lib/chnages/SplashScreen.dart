import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../Authenticate/MainScreen.dart';

class SplashLogo extends StatefulWidget {
  const SplashLogo({super.key});

  @override
  State<SplashLogo> createState() => _SplashLogoState();
}

class _SplashLogoState extends State<SplashLogo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        Get.to(
          MainScreen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 32.h,
                width: 100.w,
                child: Lottie.asset('assets/pl.json'),
              ),
            ],
          ),
          Text(
            'Wedding Planners',
            style: TextStyle(
              fontFamily: 'wbold',
              fontSize: 28.sp,
              color: Colors.blue,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 5.w,
                height: 0.2.h,
                margin: EdgeInsets.only(top: 0.5.h),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Text(
                ' Have Your Dream Wedding ',
                style: TextStyle(
                  fontFamily: 'wreg',
                  fontSize: 16.sp,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                ),
              ),
              Container(
                width: 5.w,
                height: 0.2.h,
                margin: EdgeInsets.only(top: 1.h),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
