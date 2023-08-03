import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/LoginPage.dart';

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
            top: 55.h,
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
                      color: Colors.pink,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'Planners',
                  style: TextStyle(
                      fontFamily: 'wed',
                      fontSize: 40.sp,
                      color: Colors.pink,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600),
                ),
              ],
            )),
        Positioned(
            top: 74.h,
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
                        fontFamily: 'sof',
                        fontSize: 15.sp,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )),
        Positioned(
          top: 84.h,
          left: 10.w,
          child: InkWell(
            onTap: () {
              Get.offAll(LoginPage());
            },
            child: Container(
              height: 7.h,
              width: 80.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80), color: Colors.pink),
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
