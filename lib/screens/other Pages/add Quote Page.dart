import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
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

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
ImagePicker _picker = ImagePicker();
File? selectedimage;

class _AddQuoteState extends State<AddQuote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(),
      key: scaffoldKey,
      body: Padding(
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
            SizedBox(height: 1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://scontent.fstv3-1.fna.fbcdn.net/v/t39.30808-6/305220149_495231479273840_8870209323185881114_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=a2f6c7&_nc_ohc=JitQYcURCT8AX8hWsHr&_nc_ht=scontent.fstv3-1.fna&oh=00_AfBGo4wcKtVfF1N56WRWhyUCKheYrbykEKdgcwkcCMf8jQ&oe=64F88C45',
                    height: 9.h,
                    width: 20.w,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  width: 60.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 0.5.h),
                      Text(
                        'Hotel Marriott King',
                        style: TextStyle(
                            fontSize: 19.sp,
                            fontFamily: 'sofi',
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        'TVC Company',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: 'sofi',
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      "Quotation Request",
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
                  height: 45.h,
                  padding: EdgeInsets.symmetric(horizontal: 0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.photo),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              'Image',
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
                          width: 92.w,
                          decoration: BoxDecoration(
                            color: Colors.blue,
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
                          ),
                        ),
                      ),
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
                        "Get Quote Now",
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
    );
  }
}
