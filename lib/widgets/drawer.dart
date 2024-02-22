import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Authenticate/changePassword.dart';
import 'package:wedding_planner/Authenticate/profilePage.dart';
import 'package:wedding_planner/Chat/ChatListPage.dart';
import 'package:wedding_planner/Meetings/Meetings%20Page.dart';
import 'package:wedding_planner/Modal/UnreadnotiModal.dart';
import 'package:wedding_planner/Others/MoodBoards.dart';
import 'package:wedding_planner/Others/certificate.dart';
import 'package:wedding_planner/Others/guestroomManagement.dart';
import 'package:wedding_planner/Others/viewBudgetPage.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/Quatations/quoatelist2.dart';
import 'package:wedding_planner/Suppliers/AddNewSupplier.dart';
import 'package:wedding_planner/Suppliers/CategoryPage.dart';
import 'package:wedding_planner/Suppliers/ReqestventSuppliersscreen.dart';
import 'package:wedding_planner/Venue/EventSpace.dart';
import 'package:wedding_planner/Venue/My%20Events.dart';
import 'package:wedding_planner/Venue/MyVenueDetailspages.dart';
import 'package:wedding_planner/bookings/view%20all%20bookings.dart';
import 'package:wedding_planner/chnages/myfavourites.dart';
import 'package:wedding_planner/chnages/yellowHomePage.dart';
import 'package:wedding_planner/itenrary/Add%20&%20View%20Itenrary.dart';
import 'package:wedding_planner/itenrary/ExampleItnerary.dart';
import 'package:wedding_planner/widgets/WebScreen.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/sharedpreferance.dart';

import '../Authenticate/LoginPage.dart';
import '../Modal/NotificationModal.dart';
import '../Suppliers/mysplirs.dart';
import '../Venue/MyVenue.dart';

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
    notificationap();

    unreadnotiap();
  }

  bool isLoading = true;
  bool show = false;
  int vari = 0;

  Widget build(BuildContext context) {
    double widthDrawer = 100;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Drawer(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // color: Colors.white,
            color: Colors.blue,
            // color: Colors.black,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              show = !show;
                              vari == 1 ||
                                      vari == 2 ||
                                      vari == 3 ||
                                      vari == 4 ||
                                      vari == 5 ||
                                      vari == 6 ||
                                      vari == 7
                                  ? vari = 0
                                  : vari;

                              vari == 1 ||
                                      vari == 2 ||
                                      vari == 3 ||
                                      vari == 4 ||
                                      vari == 5 ||
                                      vari == 6 ||
                                      vari == 7
                                  ? ""
                                  : show
                                      ? Get.back()
                                      : '';
                            });
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                !show
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Center(
                          child: Text(
                            "Explore",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: 'sofi',
                              letterSpacing: 1,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : vari == 1
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Center(
                              child: Text(
                                "Venue",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        : vari == 2
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: Center(
                                  child: Text(
                                    "Supplier",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : vari == 4
                                ? Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3.w),
                                    child: Center(
                                      child: Text(
                                        "Settings",
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontFamily: 'sofi',
                                          letterSpacing: 1,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                : vari == 5
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w),
                                        child: Center(
                                          child: Text(
                                            "Itinerary",
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              fontFamily: 'sofi',
                                              letterSpacing: 1,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                    : vari == 6
                                        ? Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3.w),
                                            child: Center(
                                              child: Text(
                                                "Meetings",
                                                style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontFamily: 'sofi',
                                                  letterSpacing: 1,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          )
                                        : vari == 7
                                            ? Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 3.w),
                                                child: Center(
                                                  child: Text(
                                                    "Delivery/Collection",
                                                    style: TextStyle(
                                                      fontSize: 20.sp,
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 1,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 3.w),
                                                child: Center(
                                                  child: Text(
                                                    "Others",
                                                    style: TextStyle(
                                                      fontSize: 20.sp,
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 1,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                SizedBox(
                  height: 3.h,
                ),
                !show
                    ? Container(
                        height: 94.w,
                        width: 94.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 35.w,
                              left: 5.w,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    show = !show;
                                    vari = 1;
                                  });
                                  venue();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 24.w,
                                  width: 24.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.maps_home_work_outlined,
                                        size: 30.sp,
                                        color: Colors.teal,
                                      ),
                                      // Image.asset("assets/venue.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.green,),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "Venue",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'sofi',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 35.w,
                              right: 5.w,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    show = !show;
                                    vari = 2;
                                  });
                                  supplier();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 24.w,
                                  width: 24.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.support_agent,
                                        size: 30.sp,
                                        color: Colors.red,
                                      ),
                                      // Image.asset("assets/supplier.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.red),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "Suppliers",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'sofi',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 32.w,
                              left: 35.w,
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                  Get.offAll(YellowHomeScreen(
                                    sele: 1,
                                  ));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 30.w,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.home,
                                        size: 30.sp,
                                        color: Colors.indigoAccent,
                                      ),
                                      // Image.asset("assets/home.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.orange),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "Home",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontFamily: 'sofi',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10.w,
                              left: 13.5.w,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    show = !show;
                                    vari = 6;
                                  });
                                  meetings();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 24.w,
                                  width: 24.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.people_alt_outlined,
                                        size: 27.sp,
                                        color: Colors.purpleAccent,
                                      ),
                                      // Image.asset("assets/meeting.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.blueAccent),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "Meetings",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'sofi',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 37.7.w,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    show = !show;
                                    vari = 5;
                                  });
                                  itinerary();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 24.w,
                                  width: 24.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.emoji_transportation_outlined,
                                        size: 30.sp,
                                        color: Colors.deepPurple,
                                      ),
                                      // Image.asset("assets/meeting.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.blueAccent),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "Itinerary",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'sofi',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10.w,
                              right: 13.5.w,
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                  Get.to(
                                    My_Event(),
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 24.w,
                                  width: 24.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.calendar,
                                        size: 23.sp,
                                        color: Colors.deepOrangeAccent,
                                      ),
                                      SizedBox(height: 0.5.h),
                                      Text(
                                        "My Event",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'sofi',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 9.5.w,
                              left: 13.w,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    show = !show;
                                    vari = 3;
                                  });
                                  other();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 24.w,
                                  width: 24.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.app_badge,
                                        size: 25.sp,
                                        color: Colors.blue,
                                      ),
                                      // Image.asset("assets/chat.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.blue),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "Others",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'sofi',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 9.5.w,
                              right: 13.w,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    show = !show;
                                    vari = 4;
                                  });
                                  settings();
                                },
                                child: Container(
                                  height: 24.w,
                                  width: 24.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.settings,
                                        size: 28.sp,
                                        color: Colors.orange,
                                      ),
                                      // Image.asset("assets/accomo.png",height: 12.w,width: 12.w,color: Colors.orange,fit: BoxFit.cover,),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "Settings",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'sofi',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0.5.w,
                              right: 38.w,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    show = !show;
                                    vari = 7;
                                  });
                                  delivery();
                                },
                                child: Container(
                                  height: 24.w,
                                  width: 24.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.car_detailed,
                                        size: 25.sp,
                                        color: Colors.pink,
                                      ),
                                      // Image.asset("assets/accomo.png",height: 12.w,width: 12.w,color: Colors.orange,fit: BoxFit.cover,),
                                      SizedBox(
                                        height: 0.8.h,
                                      ),
                                      Text(
                                        "Delivery/Collection",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'sofi',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : vari == 1
                        ? venue()
                        : vari == 2
                            ? supplier()
                            : vari == 4
                                ? settings()
                                : vari == 5
                                    ? itinerary()
                                    : vari == 6
                                        ? meetings()
                                        : vari == 7
                                            ? delivery()
                                            : other(),
                SizedBox(
                  height: 7.h,
                ),
                // SizedBox(height: 0.5.h,),

                show?Container():InkWell(
                    onTap: () async {
                      Get.back();
                      await SaveDataLocal.clearUserData();
                      Get.offAll(LoginPage());
                    },
                    child: Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 7.w,
                          ),
                          Container(
                            width: 63.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.logout,
                                      color: Colors.white,
                                      size: 22.sp,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text("Logout",
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'sofi',
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            )),
      ),
    );
  }

  TextStyle textStyle = TextStyle(
      color: Colors.black,
      fontSize: 12.sp,
      fontFamily: 'sofi',
      fontWeight: FontWeight.bold);


  venue() {
    return Container(
      height: 86.w,
      width: 86.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.white.withOpacity(0.4)),
      child: Stack(
        children: [
          Positioned(
            top: 17.w,
            left: 38.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(VenueView());
              },
              child: Container(
                alignment: Alignment.center,
                height: 24.w,
                width: 24.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home_work_outlined,
                      size: 25.sp,
                      color: Colors.green,
                    ),
                    // Image.asset("assets/venue.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.green,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Venue Profile",
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 39.w,
            right: 54.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(VenueDetailsview());
              },
              child: Container(
                alignment: Alignment.center,
                height: 24.w,
                width: 24.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chair_rounded,
                      size: 25.sp,
                      color: Colors.red,
                    ),
                    // Image.asset("assets/supplier.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.red),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Venue Details",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 23.w,
            right: 22.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(EventSpace());
              },
              child: Container(
                height: 24.w,
                width: 24.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.calendar,
                      size: 25.sp,
                      color: Colors.pink,
                    ),
                    // Image.asset("assets/accomo.png",height: 12.w,width: 12.w,color: Colors.orange,fit: BoxFit.cover,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Event Spaces",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  delivery() {
    return Container(
      height: 86.w,
      width: 86.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.white.withOpacity(0.4)),
      child: Stack(
        children: [
          Positioned(
            top: 17.w,
            left: 38.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(VenueView());
              },
              child: Container(
                alignment: Alignment.center,
                height: 24.5.w,
                width: 24.5.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home_work_outlined,
                      size: 25.sp,
                      color: Colors.green,
                    ),
                    // Image.asset("assets/venue.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.green,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "My Deliveries/ Collections",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 39.w,
            right: 54.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(VenueDetailsview());
              },
              child: Container(
                alignment: Alignment.center,
                height: 24.5.w,
                width: 24.5.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chair_rounded,
                      size: 25.sp,
                      color: Colors.red,
                    ),
                    // Image.asset("assets/supplier.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.red),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Request Deliveries/ Collections",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 22.w,
            right: 22.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(EventSpace());
              },
              child: Container(
                height: 24.5.w,
                width: 24.5.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.calendar,
                      size: 25.sp,
                      color: Colors.pink,
                    ),
                    // Image.asset("assets/accomo.png",height: 12.w,width: 12.w,color: Colors.orange,fit: BoxFit.cover,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    SizedBox(width: 22.w,
                      child: Text(
                        "Pending Delivery Requests",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontFamily: 'sofi',
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  meetings() {
    return Container(
      height: 86.w,
      width: 86.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.white.withOpacity(0.4)),
      child: Stack(
        children: [
          Positioned(
            top: 30.w,
            right: 54.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(MeetingsPage(sele: 0));
              },
              child: Container(
                alignment: Alignment.center,
                height: 24.w,
                width: 24.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people_alt_outlined,
                      size: 25.sp,
                      color: Colors.red,
                    ),
                    // Image.asset("assets/supplier.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.red),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Meetings",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 32.w,
            right: 22.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(AddViewItenrary());
              },
              child: Container(
                height: 25.w,
                width: 25.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_search_outlined,
                      size: 25.sp,
                      color: Colors.pink,
                    ),
                    // Image.asset("assets/accomo.png",height: 12.w,width: 12.w,color: Colors.orange,fit: BoxFit.cover,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    SizedBox(width: 22.w,
                      child: Text(
                        "Pending Meeting Requests",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontFamily: 'sofi',
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  itinerary() {
    return Container(
      height: 86.w,
      width: 86.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.white.withOpacity(0.4)),
      child: Stack(
        children: [
          Positioned(
            top: 30.w,
            right: 54.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(ExampleItinerary());
              },
              child: Container(
                alignment: Alignment.center,
                height: 24.w,
                width: 24.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chair_rounded,
                      size: 25.sp,
                      color: Colors.red,
                    ),
                    // Image.asset("assets/supplier.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.red),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Example Itinerary",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 32.w,
            right: 22.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(AddViewItenrary());
              },
              child: Container(
                height: 24.w,
                width: 24.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.emoji_transportation_rounded,
                      size: 25.sp,
                      color: Colors.pink,
                    ),
                    // Image.asset("assets/accomo.png",height: 12.w,width: 12.w,color: Colors.orange,fit: BoxFit.cover,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Upload my itinerary",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  other() {
    return Container(
      height: 86.w,
      width: 86.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.white.withOpacity(0.4)),
      child: Stack(
        children: [
          Positioned(
            top: 11.w,
            left: 19.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(myfavourite());
              },
              child: Container(
                alignment: Alignment.center,
                height: 24.w,
                width: 24.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_outlined,
                      size: 25.sp,
                      color: Colors.red,
                    ),
                    // Image.asset("assets/venue.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.green,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "My Favourite",
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 11.w,
            right: 19.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(ChatlistPage(
                  sele: 2,
                ));
              },
              child: Container(
                alignment: Alignment.center,
                height: 24.w,
                width: 24.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat,
                      size: 25.sp,
                      color: Colors.blue,
                    ),
                    // Image.asset("assets/chat.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.blue),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Chat",
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 29.w,
            left: 36.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(BookingList());
              },
              child: Container(
                alignment: Alignment.center,
                height: 28.w,
                width: 28.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.bookmark_outline,
                      size: 25.sp,
                      color: Colors.orange,
                    ),
                    // Image.asset("assets/home.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.orange),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Booking Detail",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 11.w,
            left: 19.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(RoomManagement());
              },
              child: Container(
                alignment: Alignment.center,
                height: 24.w,
                width: 24.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.room_preferences,
                      size: 25.sp,
                      color: Colors.blue,
                    ),
                    // Image.asset("assets/chat.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.blue),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Room Detail",
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 11.w,
            right: 19.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(ViewBudget());
              },
              child: Container(
                height: 24.w,
                width: 24.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.attach_money_outlined,
                      size: 25.sp,
                      color: Colors.blue,
                    ),
                    // Image.asset("assets/accomo.png",height: 12.w,width: 12.w,color: Colors.orange,fit: BoxFit.cover,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Budget",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  settings() {
    return Container(
      height: 86.w,
      width: 86.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.white.withOpacity(0.4)),
      child: Stack(
        children: [
          Positioned(
            top: 12.w,
            left: 37.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(ChangePassword());
              },
              child: Container(
                alignment: Alignment.center,
                height: 24.w,
                width: 24.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.lock_circle,
                      size: 23.sp,
                      color: Colors.red,
                    ),
                    // Image.asset("assets/venue.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.green,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    SizedBox(width: 22.w,
                      child: Text(
                        "Change Password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 8.sp,
                          fontFamily: 'sofi',
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 31.5.w,
            right: 20.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(
                  Webviewscreen(
                    paymentsurl:
                        'https://wedding.londontechequity.co.uk/portal',
                    title: 'Privacy Policy',
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 24.w,
                width: 24.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.lock_shield,
                      size: 23.sp,
                      color: Colors.green,
                    ),
                    // Image.asset("assets/supplier.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.red),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Privacy Policy",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 12.w,
            left: 37.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(MyProfile());
              },
              child: Container(
                alignment: Alignment.center,
                height: 24.w,
                width: 24.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.person,
                      size: 23.sp,
                      color: Colors.blue,
                    ),
                    // Image.asset("assets/chat.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.blue),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "My Profile",
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30.w,
            left: 18.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(
                  Webviewscreen(
                    paymentsurl:
                        'https://wedding.londontechequity.co.uk/portal',
                    title: 'User Policy',
                  ),
                );
              },
              child: Container(
                height: 25.w,
                width: 24.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.doc_append,
                      size: 21.sp,
                      color: Colors.orange,
                    ),
                    // Image.asset("assets/accomo.png",height: 12.w,width: 12.w,color: Colors.orange,fit: BoxFit.cover,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "User Policy",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 8.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  supplier() {
    return Container(
      height: 86.w,
      width: 86.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.white.withOpacity(0.4)),
      child: Stack(
        children: [
          Positioned(
            top: 12.w,
            left: 37.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(Certificate());
              },
              child: Container(
                alignment: Alignment.center,
                height: 24.w,
                width: 24.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people,
                      size: 25.sp,
                      color: Colors.green,
                    ),
                    // Image.asset("assets/venue.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.green,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "My Suppliers",
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 31.5.w,
            right: 20.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(AllCategoryScreen());
              },
              child: Container(
                alignment: Alignment.center,
                height: 24.w,
                width: 24.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      size: 25.sp,
                      color: Colors.deepOrangeAccent,
                    ),
                    // Image.asset("assets/venue.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.green,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Approved Suppliers",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 12.w,
            left: 37.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(RequestSupplier());
              },
              child: Container(
                alignment: Alignment.center,
                height: 24.w,
                width: 24.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.support_agent,
                      size: 25.sp,
                      color: Colors.red,
                    ),
                    // Image.asset("assets/supplier.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.red),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    SizedBox(width: 22.w,
                      child: Text(
                        "Request Supplier",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontFamily: 'sofi',
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30.w,
            left: 18.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(
                  ReqestventSupplierscreen(sele: 0)
                );
              },
              child: Container(
                height: 24.w,
                width: 24.w,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_search_outlined,
                      size: 25.sp,
                      color: Colors.blue,
                    ),
                    // Image.asset("assets/accomo.png",height: 12.w,width: 12.w,color: Colors.orange,fit: BoxFit.cover,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Pending Supplier Requests",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  notificationap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().notificationapi().then((response) async {
          notificationmodal =
              NotificationModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && notificationmodal?.status == "1") {
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  unreadnotiap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().unreadnotiapi().then((response) async {
          unreadnotimodal =
              UnreadnotiModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && unreadnotimodal?.status == "1") {
            print(unreadnotimodal?.unreadNoti);
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
