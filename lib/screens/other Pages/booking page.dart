import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
ImagePicker _picker = ImagePicker();
File? selectedimage;

class _BookingsPageState extends State<BookingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(),
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            children: [
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded)),
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'sofi',
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Icon(Icons.menu_rounded))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Bookings",
                        style: TextStyle(
                            fontSize: 22.sp,
                            fontFamily: 'get',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Container(
                    height: 60.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 1.w),
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.person),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.sp,
                                        fontFamily: 'sofi',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            TextField(
                              // controller: _msg,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                  fontSize: 11.5.sp,
                                  fontFamily: 'get'),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                border: InputBorder.none,
                                hintText: 'Type your name',
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                    fontFamily: 'get'),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 1.w),
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.phone),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    'Phone no',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.sp,
                                        fontFamily: 'sofi',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            TextField(
                              // controller: _msg,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                  fontSize: 11.5.sp,
                                  fontFamily: 'get'),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                border: InputBorder.none,
                                hintText: 'Type your phone no',
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                    fontFamily: 'get'),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 1.w),
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.house),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    'Address',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.sp,
                                        fontFamily: 'sofi',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            TextField(
                              maxLines: 4,
                              // controller: _msg,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                  fontSize: 11.5.sp,
                                  fontFamily: 'get'),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                border: InputBorder.none,
                                hintText: 'Type your address',
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                    fontFamily: 'get'),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 1.w),
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.info),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    'Details',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontFamily: 'sofi',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            TextField(
                              maxLines: 4,
                              // controller: _msg,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                  fontSize: 11.5.sp,
                                  fontFamily: 'get'),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                border: InputBorder.none,
                                hintText: 'Add Details',
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                    fontFamily: 'get'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 92.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25.sp),
                      ),
                      child: Center(
                        child: Text(
                          "Book Now",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontFamily: 'get'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
