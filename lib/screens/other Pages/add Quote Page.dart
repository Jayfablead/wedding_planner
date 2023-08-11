import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class AddQuote extends StatefulWidget {
  const AddQuote({super.key});

  @override
  State<AddQuote> createState() => _AddQuoteState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
ImagePicker _picker = ImagePicker();
File? selectedimage;

class _AddQuoteState extends State<AddQuote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(),
      key: _scaffoldKey,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 84.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded)),
                  Text(
                    "Get Quotation",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'sofi',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Icon(Icons.menu_rounded))
                ],
              ),
            ),
          ),
          Positioned(
            left: 7.5.w,
            top: 20.h,
            child: Container(
              height: 65.h,
              width: 85.w,
              child: Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.pink, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                elevation: 15,
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/dialogbg.jpg',
                          height: 65.h,
                          fit: BoxFit.cover,
                        )),
                    Container(
                      height: 65.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    Container(
                      height: 65.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                padding: EdgeInsets.all(0.5.w),
                                margin: EdgeInsets.only(top: 3.w, right: 3.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.white),
                                child: Icon(
                                  Icons.close,
                                  size: 17.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Quotation Request',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1),
                        ),
                        Container(
                          height: 37.h,
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontFamily: 'sofi',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1),
                              ),
                              TextField(
                                // controller: _msg,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                    fontSize: 11.5.sp,
                                    fontFamily: 'get'),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Type your name',
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1,
                                      fontFamily: 'get'),
                                ),
                              ),
                              Text(
                                'Image',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontFamily: 'sofi',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1),
                              ),
                              InkWell(
                                onTap: () async {
                                  XFile? photo = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  selectedimage = File(photo!.path);
                                  setState(() {
                                    selectedimage = File(photo.path);
                                  });
                                  print(selectedimage);
                                },
                                child: Container(
                                    width: 42.w,
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(90),
                                    ),
                                    padding: EdgeInsets.all(3.w),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.drive_folder_upload,
                                          size: 18.sp,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 2.w),
                                        Text(
                                          'Choose File',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'sofi',
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1),
                                        ),
                                      ],
                                    )),
                              ),
                              Text(
                                'Details',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontFamily: 'sofi',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1),
                              ),
                              TextField(
                                // controller: _msg,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                    fontSize: 11.5.sp,
                                    fontFamily: 'get'),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Add Details',
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1,
                                      fontFamily: 'get'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 73.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(25.sp),
                            ),
                            child: Center(
                                child: Text(
                              "Get Quote Now",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontFamily: 'get'),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
