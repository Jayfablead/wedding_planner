import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/pages2/editprofilepage2.dart';

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
      resizeToAvoidBottomInset: false,
      drawer: drawer1(),
      key: _scaffoldKey,
      // Colors.black

      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/profile.png',
              ),
              fit: BoxFit.cover,
            )),
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
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    )),
                Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'sofi',
                    letterSpacing: 1,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu_rounded,
                      color: Colors.white,
                    ))
              ],
            ),
            SizedBox(height: 2.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 1.5.w),
                    Container(
                      height: 15.h,
                      width: 31.5.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 4),
                        borderRadius: BorderRadius.circular(90),
                      ),
                      child: Container(
                        height: 14.5.h,
                        width: 31.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                'https://i.pinimg.com/280x280_RS/fc/71/56/fc7156e9ddbd524ab1541d3942725efd.jpg',
                            progressIndicatorBuilder:
                                (context, url, progress) =>
                                    CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/deuser.png',
                              fit: BoxFit.cover,
                              height: 14.5.h,
                              width: 31.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                  Get.to(EditProfile2(
                    lname: 'zoro',
                    fname: 'roronoa',
                    phone: '7041648493',
                    about:
                        'Born in the East Blue, Zoro is the son of Tera and Roronoa Arashi, the grandson of Shimotsuki Furiko and Roronoa Pinzoro.',
                    address: 'Nowhere, Don\'t know where he lived.',
                  ));
                  // Get.to(() => UpdateProfile(
                  //       add: "Nowhere, Don't know where he lived.",
                  //       name: 'Roronoa Zoro',
                  //       about:
                  //           "Born in the East Blue, Zoro is the son of Tera and Roronoa Arashi, the grandson of Shimotsuki Furiko and Roronoa Pinzoro.",
                  //       phone: '7041648493',
                  //       profile:
                  //           'https://i.pinimg.com/280x280_RS/fc/71/56/fc7156e9ddbd524ab1541d3942725efd.jpg',
                  //     ));
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
                      fontFamily: 'sofi',
                      fontWeight: FontWeight.bold,
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
            SizedBox(
              height: 0.5.h,
            ),
            Container(
              width: 100.w,

              child: ListView(shrinkWrap: true,padding: EdgeInsets.zero, children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.pink),
                              child: Icon(
                                Icons.miscellaneous_services_rounded,
                                color: Colors.white,
                                size: 18.sp,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Services : ",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 2,
                                      fontFamily: "sofi",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  "115",
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
                          children: [
                            Container(
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.pink),
                              child: Icon(
                                CupertinoIcons.search_circle,
                                color: Colors.white,
                                size: 18.sp,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Inquires : ",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 2,
                                      fontFamily: "sofi",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  "145",
                                  style: appname,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.pink),
                              child: Icon(
                                CupertinoIcons.phone,
                                color: Colors.white,
                                size: 18.sp,
                              ),
                            ),
                            SizedBox(width: 5.w),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Phone : ",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 2,
                                  fontFamily: "sofi",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp),
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              "7041648493",
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.pink),
                          child: Icon(
                            CupertinoIcons.home,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Address : ",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 2,
                                  fontFamily: "sofi",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            SizedBox(
                              width: 75.w,
                              child: SizedBox(
                                width: 75.w,
                                child: ReadMoreText(
                                  trimLines: 2,
                                  trimLength: 50,
                                  colorClickableText: Colors.pink,
                                  trimMode: TrimMode.Length,
                                  trimCollapsedText: 'Read more',
                                  trimExpandedText: '  Read less',
                                  moreStyle: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold),
                                  lessStyle: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold),
                                  "Nowhere, Don't know where he lived.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.5,
                                      height: 1.3),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.pink),
                          child: Icon(
                            CupertinoIcons.info_circle,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About : ",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 2,
                                  fontFamily: "sofi",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            SizedBox(
                              width: 75.w,
                              child: ReadMoreText(
                                trimLines: 2,
                                trimLength: 50,
                                colorClickableText: Colors.pink,
                                trimMode: TrimMode.Length,
                                trimCollapsedText: 'Read more',
                                trimExpandedText: '  Read less',
                                moreStyle: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold),
                                lessStyle: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold),
                                "Born in the East Blue, Zoro is the son of Tera and Roronoa Arashi, the grandson of Shimotsuki Furiko and Roronoa Pinzoro.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.sp,
                                    fontFamily: 'sofi',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.5,
                                    height: 1.3),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ]),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
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
    fontSize: 14.sp,
    fontFamily: 'sofi',
    fontWeight: FontWeight.w600,
    letterSpacing: 2,
  );
  TextStyle appname = TextStyle(
    color: Colors.black,
    fontSize: 13.sp,
    fontFamily: 'sofi',
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
  );
}
