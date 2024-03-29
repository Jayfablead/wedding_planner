import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/chnages/yellowHomePage.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/sharedpreferance.dart';

import 'LoginPage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset('assets/bg.png',
            height: double.infinity, width: double.infinity, fit: BoxFit.cover),
        Positioned(
            top: 58.h,
            left: 22.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Wedding',
                  style: TextStyle(
                      fontFamily: 'wed',
                      fontSize: 40.sp,
                      color: Colors.blue,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'Touch',
                  style: TextStyle(
                      fontFamily: 'wed',
                      fontSize: 40.sp,
                      color: Colors.blue,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600),
                ),
              ],
            )),
        Positioned(
            top: 76.5.h,
            left: 4.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 92.w,
                  child: Text(
                    'Choose Your Venue & Get Quotations for your Venue.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'sofi',
                        fontSize: 15.sp,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
        Positioned(
          top: 84.5.h,
          left: 4.5.w,
          child: InkWell(
            onTap: () async {
              userData = await SaveDataLocal.getDataFromLocal();
              print(userData?.user?.groomName);
              userData?.user?.id == null || userData?.user?.id == ""
                  ? Get.to(LoginPage())
                  : Get.to(YellowHomeScreen(
                      sele: 1,
                    ));
            },
            child: Container(
              height: 7.h,
              width: 90.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80), color: Colors.blue),
              child: Text('Get Started',
                  style: TextStyle(
                      fontSize: 14.sp, color: Colors.white, fontFamily: 'get')),
            ),
          ),
        ),
      ]),
    );
  }
}
