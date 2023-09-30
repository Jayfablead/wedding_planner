import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/BannerPage.dart';
import 'package:wedding_planner/screens/DecorationsPage.dart';
import 'package:wedding_planner/screens/HomePage.dart';
import 'package:wedding_planner/screens/LoginPage.dart';
import 'package:wedding_planner/screens/changePassword.dart';
import 'package:wedding_planner/screens/other%20Pages/ChatListPage.dart';
import 'package:wedding_planner/screens/other%20Pages/booking%20page.dart';
import 'package:wedding_planner/screens/other%20Pages/quotationList.dart';
import 'package:wedding_planner/screens/pages2/fbpage.dart';
import 'package:wedding_planner/screens/pages2/venue%202.dart';
import 'package:wedding_planner/screens/profilePage.dart';
import 'package:wedding_planner/screens/scrns/Accomendation%20Page.dart';
import 'package:wedding_planner/screens/scrns/Transportationmanagement.dart';
import 'package:wedding_planner/screens/scrns/foodMenu.dart';
import 'package:wedding_planner/screens/scrns/viewBudgetPage.dart';
import 'package:wedding_planner/screens/view_all%20Categ.dart';

class drawer1 extends StatefulWidget {
  const drawer1({Key? key}) : super(key: key);

  @override
  State<drawer1> createState() => _drawer1State();
}

bool isloading = false;

class _drawer1State extends State<drawer1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('open');
  }

  Widget build(BuildContext context) {
    double widthDrawer = MediaQuery.of(context).size.width * 0.85;
    return Drawer(
      child: isloading
          ? Container(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Loading... ',
                    style: TextStyle(fontFamily: 'sofi', fontSize: 15.sp),
                  ),
                  SizedBox(height: 3.h),
                  CircularProgressIndicator(
                    color: Colors.pink,
                  )
                ],
              )),
            )
          : Container(
              color: Colors.white,
              // color: Colors.black,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: widthDrawer,
                color: Colors.white,
                // color: Colors.black,
                child: ListView(
                  //padding: EdgeInsets.all(2.w),
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(MyProfile());
                      },
                      child: Container(
                        height: 12.h,
                        padding: EdgeInsets.all(1.w),
                        width: widthDrawer,
                        // color: Colors.black.withOpacity(0.3),
                        decoration: BoxDecoration(),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 1.w),
                              height: 8.5.h,
                              width: 18.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(90),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      'https://i.pinimg.com/280x280_RS/fc/71/56/fc7156e9ddbd524ab1541d3942725efd.jpg',
                                  progressIndicatorBuilder:
                                      (context, url, progress) =>
                                          CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    'assets/deprf.png',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            // CircleAvatar(
                            //     radius: 9.w,
                            //     backgroundImage: NetworkImage(
                            //         "https://icdn.football-espana.net/wp-content/uploads/2022/06/Neymar-Junior2.jpeg")),
                            SizedBox(
                              width: 5.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  'Roronoa Zoro',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      letterSpacing: 0.5,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                SizedBox(
                                  width: 42.w,
                                  child: Text("roronoa.zoro@gmail.com",
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.pink,
                                          fontFamily: 'sofi',
                                          fontSize: 11.sp,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(HomeScreen());
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.house,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Home",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'sofi',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        InkWell(
                          onTap: () {
                            Get.to(MyProfile());
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.person,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Profile",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'sofi',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        InkWell(
                          onTap: () {
                            Get.to(ChatlistPage());
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.chat_bubble_text,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Chat",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'sofi',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        InkWell(
                          onTap: () {
                            Get.to(PostPage());
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.placemark,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Posts",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'sofi',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ), SizedBox(height: 2.h),
                        InkWell(
                          onTap: () {
                            Get.to(ViewBudget());
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.money_dollar_circle,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Budget Page",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'sofi',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        InkWell(
                          onTap: () {
                            Get.to(QuotationList());
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.info_circle,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("All Quotations",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'sofi',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ), SizedBox(height: 2.h),
                        InkWell(
                          onTap: () {
                            Get.to(BookingsPage());
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.bookmark,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Bookings Page",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'sofi',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        InkWell(
                          onTap: () {
                            Get.to(ViewAllCategory());
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.collections,
                                            color: Colors.black,
                                            size: 15.sp,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Categories",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'sofi',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        InkWell(
                          onTap: () {
                            Get.to(Venue2());
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.globe,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Venue",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'sofi',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),SizedBox(height: 2.h),
                        InkWell(
                          onTap: () {
                            Get.to(BookingListPage());
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.car_detailed,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Transportation",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'sofi',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        InkWell(
                          onTap: () {
                            Get.to(FoodMenusPage());
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.fastfood_outlined,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Food Menu",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'sofi',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        InkWell(
                          onTap: () {
                            Get.to(Accomendation_Page());
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.pages_outlined,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Accommodation Page",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'sofi',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        InkWell(
                          onTap: () {
                            Get.to(DecorationPage());
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.crop_rotate,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Decoration",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'sofi',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        InkWell(
                          onTap: () {
                            Get.to(ChangePassword());
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.lock,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Change Password",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'sofi',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        InkWell(
                          onTap: () async {
                            Get.offAll(LoginPage());
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 63.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.logout,
                                            color: Colors.red,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Logout",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'sofi',
                                                color: Colors.red,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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

  TextStyle textStyle = TextStyle(
      color: Colors.black,
      fontSize: 12.sp,
      fontFamily: 'sofi',
      fontWeight: FontWeight.bold);
}
