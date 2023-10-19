import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/new%20pages/NotificationScreen.dart';

Widget header(
    {required VoidCallback callback,
      required String text,
      required VoidCallback callback1,
    }
    ){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
          onPressed:callback,
          icon: Icon(Icons.arrow_back_ios_new_rounded,
              color: Colors.blue, size: 23.sp)),
      Text(
        text,
        style: TextStyle(
          fontSize: 18.sp,
          fontFamily: 'sofi',
          letterSpacing: 1,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Get.to(NotificationScreen());
              },
              icon: Icon(
                Icons.notifications_none_rounded,
                color: Colors.blue,
                size: 21.sp,
              )),
          IconButton(
              onPressed: callback1,
              icon: Icon(
                Icons.menu_rounded,
                color: Colors.blue,
                size: 23.sp,
              )),
        ],
      ),
    ],
  );
}

