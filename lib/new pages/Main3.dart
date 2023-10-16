import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/LoginPage.dart';

class Main3 extends StatefulWidget {
  const Main3({super.key});

  @override
  State<Main3> createState() => _Main3State();
}

class _Main3State extends State<Main3> {
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
            top: 25.5.h,
            right: 0.w,
            left: 1.w,
            child: Image.asset(
              'assets/wedd.png',
              height: 45.h,
            )),
        Positioned(
            top: 72.5.h,
            left: 2.5.w,
            child: SizedBox(
              width: 95.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Have Wedding of your Dreams Without Giving up on your Dreams',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'wed',
                        fontSize: 22.sp,
                        color: Colors.blue,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )),
        Positioned(
            top: 10.h,
            left: 12.5.w,
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
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
        Positioned(
            top: 16.h,
            left: 34.5.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Planners',
                  style: TextStyle(
                      fontFamily: 'wed',
                      fontSize: 40.sp,
                      color: Colors.blue,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
        Positioned(
          top: 89.5.h,
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
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(80),
                  color: Colors.white54),
              child: Text(
                'Continue',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 25.sp,
                    color: Colors.blue,
                    fontFamily: 'wed'),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
