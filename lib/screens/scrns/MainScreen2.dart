import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/LoginPage.dart';
import 'package:wedding_planner/screens/SignupPage.dart';

class Main2 extends StatefulWidget {
  const Main2({super.key});

  @override
  State<Main2> createState() => _Main2State();
}

class _Main2State extends State<Main2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/1b.jpeg',
          colorBlendMode: BlendMode.hardLight,
          color: Colors.black12,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
            top: 19.h,
            right: 0.w,
            left: 0.w,
            child: Image.asset(
              'assets/wed.png',
              height: 50.h,
            )),
        Positioned(
            left: 22.w,
            child: Image.asset(
              'assets/dec.png',
              height: 45.h,
            )),
        Positioned(
            top: 66.h,
            left: 6.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Let\'s Make Your Day Special !',
                  style: TextStyle(
                      fontFamily: 'wed',
                      fontSize: 18.sp,
                      color: Colors.pink,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600),
                ),
              ],
            )),
        Positioned(
          top: 73.h,
          left: 4.5.w,
          child: InkWell(
            onTap: () {
              Get.to(SignupPage());
            },
            child: Container(
              height: 7.h,
              width: 90.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80), color: Colors.pink),
              child: Text('Sign up',
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontFamily: 'get')),
            ),
          ),
        ),
        Positioned(
          top: 81.5.h,
          left: 4.5.w,
          child: InkWell(
            onTap: () {
              Get.to(LoginPage());
            },
            child: Container(
              height: 7.h,
              width: 90.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink),
                  borderRadius: BorderRadius.circular(80),
                  color: Colors.white54),
              child: Text('Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 15.sp,
                      color: Colors.pink,
                      fontFamily: 'get')),
            ),
          ),
        ),
      ]),
    );
  }
}
