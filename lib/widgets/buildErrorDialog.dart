import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/LoginPage.dart';

buildErrorDialog(BuildContext context, String title, String contant,
    {VoidCallback? callback, String? buttonname}) {
  Widget okButton = GestureDetector(
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        // color: primary
      ),
      child: Center(
        child: Text(buttonname ?? 'OK',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'sofi',
              letterSpacing: 1,
              decorationColor: Colors.black,
            )),
      ),
    ),
    onTap: () {
      // if (callback == null) {
      Get.back();
      // } else {

      // }
    },
  );

  if (Platform.isAndroid) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: 73.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                (title != "")
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decorationColor: Colors.black,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          SizedBox(height: 1.h),
                        ],
                      )
                    : Container(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      SizedBox(height: 1.h),
                      Text(
                        contant,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          decorationColor: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(height: 2.h),
                okButton,
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  if (Platform.isIOS) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: 73.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                (title != "")
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decorationColor: Colors.black,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          SizedBox(height: 1.h),
                        ],
                      )
                    : Container(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      SizedBox(height: 1.h),
                      Text(
                        contant,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          decorationColor: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(height: 2.h),
                okButton,
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
    // CupertinoAlertDialog cupertinoAlertDialog = CupertinoAlertDialog(
    //   title: Text(title,
    //       style: TextStyle(
    //           color: Colors.black,
    //           decorationColor: Colors.black,
    //           fontFamily: 'poppins')),
    //   content: Text(contant,
    //       style: const TextStyle(
    //           color: Colors.black,
    //           decorationColor: Colors.black,
    //           fontFamily: 'poppins')),
    //   actions: [
    //     okButton,
    //   ],
    // );
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return cupertinoAlertDialog;
    //   },
    // );
  }
  // show the dialog
}
buildErrorDialog1(BuildContext context, String title, String contant,VoidCallback? callback,
    { String? buttonname}) {
  Widget okButton = GestureDetector(
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        // color: primary
      ),
      child: Center(
        child: Text(buttonname ?? 'OK',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'sofi',
              letterSpacing: 1,
              decorationColor: Colors.black,
            )),
      ),
    ),
    onTap:
      // if (callback == null) {
    callback
      // } else {

      // }

  );

  if (Platform.isAndroid) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: 73.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                (title != "")
                    ? Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decorationColor: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                  ],
                )
                    : Container(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      SizedBox(height: 1.h),
                      Text(
                        contant,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          decorationColor: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(height: 2.h),
                okButton,
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  if (Platform.isIOS) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: 73.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                (title != "")
                    ? Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decorationColor: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                  ],
                )
                    : Container(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      SizedBox(height: 1.h),
                      Text(
                        contant,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          decorationColor: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(height: 2.h),
                okButton,
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
    // CupertinoAlertDialog cupertinoAlertDialog = CupertinoAlertDialog(
    //   title: Text(title,
    //       style: TextStyle(
    //           color: Colors.black,
    //           decorationColor: Colors.black,
    //           fontFamily: 'poppins')),
    //   content: Text(contant,
    //       style: const TextStyle(
    //           color: Colors.black,
    //           decorationColor: Colors.black,
    //           fontFamily: 'poppins')),
    //   actions: [
    //     okButton,
    //   ],
    // );
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return cupertinoAlertDialog;
    //   },
    // );
  }
  // show the dialog
}
