import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Authenticate/changePassword.dart';
import 'package:wedding_planner/Authenticate/profilePage.dart';
import 'package:wedding_planner/Chat/ChatListPage.dart';
import 'package:wedding_planner/Guest/GuestList.dart';
import 'package:wedding_planner/Guest/View%20Table.dart';
import 'package:wedding_planner/Meetings/Meetings%20Page.dart';
import 'package:wedding_planner/Modal/UnreadnotiModal.dart';
import 'package:wedding_planner/Others/MoodBoards.dart';
import 'package:wedding_planner/Others/NotificationScreen.dart';
import 'package:wedding_planner/Others/certificate.dart';
import 'package:wedding_planner/Others/guestroomManagement.dart';
import 'package:wedding_planner/Others/viewBudgetPage.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/Quatations/quoatelist2.dart';
import 'package:wedding_planner/Suppliers/CategoryPage.dart';
import 'package:wedding_planner/bookings/view%20all%20bookings.dart';
import 'package:wedding_planner/chart/seatingChart1.dart';
import 'package:wedding_planner/chart/seatingChart2.dart';
import 'package:wedding_planner/chnages/invoiceList.dart';
import 'package:wedding_planner/chnages/myfavourites.dart';
import 'package:wedding_planner/chnages/yellowHomePage.dart';
import 'package:wedding_planner/itenrary/Add%20&%20View%20Itenrary.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/sharedpreferance.dart';

import '../Authenticate/LoginPage.dart';
import '../Modal/NotificationModal.dart';
import '../Others/Check List.dart';
import '../Suppliers/mysplirs.dart';
import '../Venue/MyVenue.dart';
import '../wait/Accomendation Page.dart';
import '../wait/Transportationmanagement.dart';

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
                              vari == 1 || vari == 2 || vari == 3
                                  ? vari = 0
                                  : vari;

                              vari == 1 || vari == 2 || vari == 3
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
                            : Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: Center(
                                  child: Text(
                                    "Others",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
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
                              top: 34.w,
                              left: 3.w,
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
                                  height: 26.w,
                                  width: 26.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.place_rounded,
                                        size: 30.sp,
                                        color: Colors.green,
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
                              top: 34.w,
                              right: 3.w,
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
                                  height: 26.w,
                                  width: 26.w,
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
                                        "Supplier",
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
                                    sele: 2,
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
                                        color: Colors.orange,
                                      ),
                                      // Image.asset("assets/home.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.orange),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "Home",
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
                              top: 5.w,
                              left: 20.w,
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                  Get.to(
                                    MeetingsPage(
                                      sele: 0,
                                    ),
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 26.w,
                                  width: 26.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.meeting_room_sharp,
                                        size: 30.sp,
                                        color: Colors.blueAccent,
                                      ),
                                      // Image.asset("assets/meeting.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.blueAccent),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "Meeting",
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
                              top: 5.w,
                              right: 20.w,
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                  Get.to(
                                    PostPage(sele: 1),
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 26.w,
                                  width: 26.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.developer_board,
                                        size: 30.sp,
                                        color: Colors.deepOrange,
                                      ),
                                      // Image.asset("assets/board.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.deepOrange),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "Board",
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
                              bottom: 5.w,
                              left: 20.w,
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
                                  height: 26.w,
                                  width: 26.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.more,
                                        size: 30.sp,
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
                              bottom: 5.w,
                              right: 20.w,
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                  Get.to(
                                    Check_list(),
                                  );
                                },
                                child: Container(
                                  height: 26.w,
                                  width: 26.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.checklist_outlined,
                                        size: 30.sp,
                                        color: Colors.blue,
                                      ),
                                      // Image.asset("assets/accomo.png",height: 12.w,width: 12.w,color: Colors.orange,fit: BoxFit.cover,),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "Check List",
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
                            : other(),
                SizedBox(
                  height: 4.h,
                ),
                // SizedBox(height: 0.5.h,),
                InkWell(
                    onTap: () async {
                      Get.back();
                      Get.to(MyProfile());
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person_2_outlined,
                                      color: Colors.white,
                                      size: 22.sp,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text("My Profile",
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
                    )),
                SizedBox(height: 2.h),
                // InkWell(
                //     onTap: () async {
                //       Get.back();
                //       Get.to(GuestList());
                //     },
                //     child: Container(
                //       child: Row(
                //         children: [
                //           SizedBox(
                //             width: 6.w,
                //           ),
                //           Container(
                //             width: 63.w,
                //             child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Row(
                //                   children: [
                //                     Icon(
                //                       Icons.people_alt_outlined,
                //                       color: Colors.white,
                //                       size: 22.sp,
                //                     ),
                //                     SizedBox(
                //                       width: 2.w,
                //                     ),
                //                     Text("Guests List",
                //                         style: TextStyle(
                //                           fontSize: 17.sp,
                //                           fontWeight: FontWeight.bold,
                //                           fontFamily: 'sofi',
                //                           color: Colors.white,
                //                         )),
                //                   ],
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ],
                //       ),
                //     )),
                // SizedBox(height: 2.h),
                Stack(
                  children: [
                    InkWell(
                        onTap: () async {
                          Get.back();
                          Get.to(NotificationScreen());
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
                                          Icons.notifications_none_rounded,
                                          color: Colors.white,
                                          size: 22.sp,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text("Notifications",
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
                        )),
                    unreadnotimodal?.status == "1"
                        ? Positioned(
                            left: 47.w,
                            bottom: 1.2.h,
                            child: Container(
                              width: 5.w,
                              height: 5.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                              child:
                                  Text((unreadnotimodal?.unreadNoti).toString(),
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'sofi',
                                        color: Colors.white,
                                      )),
                            ))
                        : Container()
                  ],
                ),
                SizedBox(height: 2.h),
                // InkWell(
                //   onTap: () {
                //     Get.back();
                //     Get.to(ViewTables());
                //   },
                //   child: Row(
                //     children: [
                //       SizedBox(
                //         width: 6.w,
                //       ),
                //       Container(
                //         width: 63.w,
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Icon(
                //               Icons.chair_rounded,
                //               color: Colors.white,
                //               size: 22.sp,
                //             ),
                //             // Image.asset("assets/supplier.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.red),
                //             SizedBox(
                //               width: 2.w,
                //             ),
                //             Text(
                //               "Seating Chart",
                //                 style: TextStyle(
                //                   fontSize: 17.sp,
                //                   fontWeight: FontWeight.bold,
                //                   fontFamily: 'sofi',
                //                   color: Colors.white,
                //                 )
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                InkWell(
                    onTap: () async {
                      Get.back();
                      Get.to(ViewTables2());
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.chair_rounded,
                                      color: Colors.white,
                                      size: 22.sp,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text("Seating Chart ",
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
                    )),
                SizedBox(height: 2.h),
                InkWell(
                    onTap: () async {
                      Get.back();
                      Get.to(ChangePassword());
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.lock_open_outlined,
                                      color: Colors.white,
                                      size: 22.sp,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text("Change Password",
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
                    )),
                SizedBox(height: 2.h),
                InkWell(
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
            top: 11.w,
            left: 19.w,
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
                      Icons.location_on,
                      size: 25.sp,
                      color: Colors.green,
                    ),
                    // Image.asset("assets/venue.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.green,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "My venue",
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
                Get.to(ViewTables2());
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
                      "Seating Chart",
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
            top: 29.w,
            left: 36.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(Accomendation_Page());
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
                      Icons.local_hotel_rounded,
                      size: 25.sp,
                      color: Colors.orange,
                    ),
                    // Image.asset("assets/home.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.orange),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Accommodation",
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
                Get.to(ChatlistPage(
                  sele: 3,
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
            bottom: 11.w,
            right: 19.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(GuestList());
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
                      Icons.people_alt_outlined,
                      size: 25.sp,
                      color: Colors.pink,
                    ),
                    // Image.asset("assets/accomo.png",height: 12.w,width: 12.w,color: Colors.orange,fit: BoxFit.cover,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Guest List",
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
                Get.to(AddViewItenrary());
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
                      Icons.emoji_transportation_outlined,
                      size: 25.sp,
                      color: Colors.red,
                    ),
                    // Image.asset("assets/supplier.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.red),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Itinerary",
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

  supplier() {
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
                      Icons.contrast,
                      size: 25.sp,
                      color: Colors.green,
                    ),
                    // Image.asset("assets/venue.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.green,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Contracts",
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
                      color: Colors.red,
                    ),
                    // Image.asset("assets/venue.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.green,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "All Suppliers",
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
            top: 29.w,
            left: 36.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(QuoateList2());
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
                      Icons.support_agent,
                      size: 25.sp,
                      color: Colors.red,
                    ),
                    // Image.asset("assets/supplier.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.red),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "New Supplier Quotes",
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
            bottom: 11.w,
            left: 19.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(InvoiceList());
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
                      Icons.monetization_on,
                      size: 25.sp,
                      color: Colors.amber,
                    ),
                    // Image.asset("assets/chat.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.blue),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Invoice Detail",
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
                Get.to(
                  MySups(
                    sele: 4,
                  ),
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
                      Icons.person_outline,
                      size: 25.sp,
                      color: Colors.blue,
                    ),
                    // Image.asset("assets/accomo.png",height: 12.w,width: 12.w,color: Colors.orange,fit: BoxFit.cover,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "My Supplier",
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
