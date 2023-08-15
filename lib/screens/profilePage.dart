import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/other%20Pages/updatePtofile.dart';

import '../widgets/drawer.dart';

class MyProfile extends StatefulWidget {
  MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List img = [
    "assets/ney.jpg",
    "assets/ney2.jpg",
    "assets/ney3.webp",
    "assets/ney1.jpg",
    "assets/ney.jpg"
  ];
  bool isLoading = true;
  bool isPlay = false;
  int lenght = 0;
  bool _isExpanded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("hiii");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(),
      key: _scaffoldKey,
      // Colors.black

      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_ios_new_rounded)),
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
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
                SizedBox(height: 1.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 1.w),
                      height: 15.h,
                      width: 31.w,
                      padding: EdgeInsets.all(1.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              'https://i.pinimg.com/280x280_RS/fc/71/56/fc7156e9ddbd524ab1541d3942725efd.jpg',
                          progressIndicatorBuilder: (context, url, progress) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/user.png',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Roronoa Zoro", style: header),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text("roronoa.zoro@gmail.com", style: mail),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => UpdateProfile(
                            add: "Nowhere, Don't know where he lived.",
                            name: 'Roronoa Zoro',
                            about:
                                "Born in the East Blue, Zoro is the son of Tera and Roronoa Arashi, the grandson of Shimotsuki Furiko and Roronoa Pinzoro.",
                            phone: '7041648493',
                            profile:
                                'https://i.pinimg.com/280x280_RS/fc/71/56/fc7156e9ddbd524ab1541d3942725efd.jpg',
                          ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 5.5.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(90)),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontFamily: 'Poppins',
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
                Divider(
                  color: Color(0xff7a7a7a),
                ),
                SizedBox(height: 0.5.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.squares_below_rectangle,
                          color: Colors.black,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          "Services : ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp),
                        ),
                        SizedBox(
                          width: 1.h,
                        ),
                        Text(
                          "1",
                          style: appname,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.arrow_up_arrow_down_square,
                          color: Colors.black,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          "Inquiries : ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp),
                        ),
                        SizedBox(
                          width: 1.h,
                        ),
                        Text(
                          "2",
                          style: appname,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.phone,
                          color: Colors.black,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          "Phone : ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      "7041648493",
                      style: appname,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.home,
                          color: Colors.black,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          "Address : ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 90.w,
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Text(
                        "Nowhere, Don't know where he lived.",
                        style: appname,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          color: Colors.black,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          "About : ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 95.w,
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Text(
                        "Born in the East Blue, Zoro is the son of Tera and Roronoa Arashi, the grandson of Shimotsuki Furiko and Roronoa Pinzoro.",
                        style: appname,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle header = TextStyle(
    color: Colors.black,
    fontSize: 15.sp,
    fontFamily: 'sofi',
    fontWeight: FontWeight.w600,
    letterSpacing: 2,
  );
  TextStyle mail = TextStyle(
    color: Colors.pink,
    fontSize: 13.sp,
    fontFamily: 'sofi',
    fontWeight: FontWeight.w600,
    letterSpacing: 2,
  );
  TextStyle appname = TextStyle(
    color: Colors.black,
    fontSize: 13.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
  );
}
