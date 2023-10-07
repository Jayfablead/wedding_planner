import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/chnages/Meetings%20Page.dart';
import 'package:wedding_planner/chnages/my%20suppliers.dart';
import 'package:wedding_planner/chnages/myQuoteReqs.dart';
import 'package:wedding_planner/chnages/yellowHomePage.dart';
import 'package:wedding_planner/new%20pages/Check%20List.dart';
import 'package:wedding_planner/new%20pages/NotificationScreen.dart';
import 'package:wedding_planner/new%20pages/certificate.dart';
import 'package:wedding_planner/new%20pages/view%20all%20bookings.dart';
import 'package:wedding_planner/screens/LoginPage.dart';
import 'package:wedding_planner/screens/other%20Pages/ChatListPage.dart';
import 'package:wedding_planner/screens/other%20Pages/GuestChairManagement.dart';
import 'package:wedding_planner/screens/other%20Pages/guestroomManagement.dart';
import 'package:wedding_planner/screens/pages2/fbpage.dart';
import 'package:wedding_planner/screens/pages2/quoatelist2.dart';
import 'package:wedding_planner/screens/profilePage.dart';
import 'package:wedding_planner/screens/scrns/Accomendation%20Page.dart';
import 'package:wedding_planner/screens/scrns/BookingDetailsPage.dart';
import 'package:wedding_planner/screens/scrns/Transportationmanagement.dart';
import 'package:wedding_planner/screens/scrns/budgeting_Page.dart';
import 'package:wedding_planner/screens/scrns/foodMenu.dart';

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
            color: Colors.amber,
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
                            print("vari");
                            print(vari);
                            setState(() {
                              show = !show;
                              vari == 1 || vari == 2 || vari == 3
                                  ? vari = 0
                                  : vari;
                              print("after");
                              print(vari);
                              vari == 1 || vari == 2 || vari == 3
                                  ? ""
                                  : show
                                      ? Get.back()
                                      : '';
                            });
                            print(show);
                          },
                          icon: Icon(Icons.arrow_back_ios))
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
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
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                SizedBox(
                  height: 5.h,
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
                                        color: Colors.pink,
                                      ),
                                      // Image.asset("assets/chat.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.pink),
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
                  height: 7.h,
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
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text("My Profile",
                                        style: TextStyle(
                                          fontSize: 14.sp,
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
                SizedBox(height: 3.h),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.notifications_none_rounded,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text("Notifications",
                                        style: TextStyle(
                                          fontSize: 14.sp,
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
                SizedBox(height: 3.h),
                InkWell(
                    onTap: () async {
                      Get.back();
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          fontSize: 14.sp,
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
                Get.to(ChairManagement());
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
                      color: Colors.pink,
                    ),
                    // Image.asset("assets/chat.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.pink),
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
                Get.to(QuoateList2());
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
                      Icons.request_page,
                      size: 25.sp,
                      color: Colors.blue,
                    ),
                    // Image.asset("assets/accomo.png",height: 12.w,width: 12.w,color: Colors.orange,fit: BoxFit.cover,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Quote Request",
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
                Get.to(FoodMenusPage());
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
                      Icons.food_bank,
                      size: 25.sp,
                      color: Colors.green,
                    ),
                    // Image.asset("assets/venue.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.green,),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "Food Menu",
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
                Get.to(BookingListPage());
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
                      "Transportation",
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
                      color: Colors.pink,
                    ),
                    // Image.asset("assets/chat.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.pink),
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
                Get.to(BudgetingList());
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
            top: 10.w,
            left: 36.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(MySuppliers(
                  sele: 4,
                ));
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
                      Icons.person,
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
            bottom: 17.w,
            right: 17.w,
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
            bottom: 17.w,
            left: 17.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
                Get.to(MyQuoateReq());
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
                      Icons.monetization_on_outlined,
                      size: 25.sp,
                      color: Colors.orange,
                    ),
                    // Image.asset("assets/home.png",fit: BoxFit.cover,height: 10.w,width: 10.w,color: Colors.orange),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      "My Quotes",
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
        ],
      ),
    );
  }
}

//--=*=*=*=*=*=*=*=*=*=*=*   OLD DRAWER  *=*=*=*=*=*=*=*=*=*=*=--

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
// import 'package:wedding_planner/screens/BannerPage.dart';
// import 'package:wedding_planner/screens/DecorationsPage.dart';
// import 'package:wedding_planner/screens/HomePage.dart';
// import 'package:wedding_planner/screens/LoginPage.dart';
// import 'package:wedding_planner/screens/changePassword.dart';
// import 'package:wedding_planner/screens/other%20Pages/ChatListPage.dart';
// import 'package:wedding_planner/screens/other%20Pages/booking%20page.dart';
// import 'package:wedding_planner/screens/pages2/fbpage.dart';
// import 'package:wedding_planner/screens/pages2/quoatelist2.dart';
// import 'package:wedding_planner/screens/pages2/venue%202.dart';
// import 'package:wedding_planner/screens/profilePage.dart';
// import 'package:wedding_planner/screens/scrns/Accomendation%20Page.dart';
// import 'package:wedding_planner/screens/scrns/Transportationmanagement.dart';
// import 'package:wedding_planner/screens/scrns/foodMenu.dart';
// import 'package:wedding_planner/screens/scrns/viewBudgetPage.dart';
// import 'package:wedding_planner/screens/view_all%20Categ.dart';
//
// class drawer1 extends StatefulWidget {
//   const drawer1({Key? key}) : super(key: key);
//
//   @override
//   State<drawer1> createState() => _drawer1State();
// }
//
// bool isloading = false;
//
// class _drawer1State extends State<drawer1> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     print('open');
//   }
//
//   Widget build(BuildContext context) {
//     double widthDrawer = MediaQuery.of(context).size.width * 0.85;
//     return Drawer(
//       child: isloading
//           ? Container(
//               child: Center(
//                   child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Loading... ',
//                     style: TextStyle(fontFamily: 'sofi', fontSize: 15.sp),
//                   ),
//                   SizedBox(height: 3.h),
//                   CircularProgressIndicator(
//                     color: Colors.pink,
//                   )
//                 ],
//               )),
//             )
//           : Container(
//               color: Colors.white,
//               // color: Colors.black,
//               child: Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: widthDrawer,
//                 color: Colors.white,
//                 // color: Colors.black,
//                 child: ListView(
//                   //padding: EdgeInsets.all(2.w),
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Get.to(MyProfile());
//                       },
//                       child: Container(
//                         height: 12.h,
//                         padding: EdgeInsets.all(1.w),
//                         width: widthDrawer,
//                         // color: Colors.black.withOpacity(0.3),
//                         decoration: BoxDecoration(),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               margin: EdgeInsets.symmetric(horizontal: 1.w),
//                               height: 8.5.h,
//                               width: 18.w,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(90),
//                                 child: CachedNetworkImage(
//                                   fit: BoxFit.cover,
//                                   imageUrl:
//                                       'https://i.pinimg.com/280x280_RS/fc/71/56/fc7156e9ddbd524ab1541d3942725efd.jpg',
//                                   progressIndicatorBuilder:
//                                       (context, url, progress) =>
//                                           CircularProgressIndicator(),
//                                   errorWidget: (context, url, error) =>
//                                       Image.asset(
//                                     'assets/deprf.png',
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             // CircleAvatar(
//                             //     radius: 9.w,
//                             //     backgroundImage: NetworkImage(
//                             //         "https://icdn.football-espana.net/wp-content/uploads/2022/06/Neymar-Junior2.jpeg")),
//                             SizedBox(
//                               width: 5.w,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 SizedBox(
//                                   height: 0.5.h,
//                                 ),
//                                 Text(
//                                   'Roronoa Zoro',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 12.sp,
//                                       letterSpacing: 0.5,
//                                       fontFamily: 'sofi',
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 SizedBox(
//                                   height: 0.5.h,
//                                 ),
//                                 SizedBox(
//                                   width: 42.w,
//                                   child: Text("roronoa.zoro@gmail.com",
//                                       maxLines: 2,
//                                       style: TextStyle(
//                                           color: Colors.pink,
//                                           fontFamily: 'sofi',
//                                           fontSize: 11.sp,
//                                           letterSpacing: 1,
//                                           fontWeight: FontWeight.bold)),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Divider(
//                       color: Colors.grey,
//                     ),
//                     SizedBox(
//                       height: 1.5.h,
//                     ),
//                     Column(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Get.to(HomeScreen());
//                           },
//                           child: Container(
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 Container(
//                                   width: 64.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             CupertinoIcons.house,
//                                             color: Colors.black,
//                                           ),
//                                           SizedBox(
//                                             width: 2.w,
//                                           ),
//                                           Text("Home",
//                                               style: TextStyle(
//                                                 fontSize: 12.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'sofi',
//                                                 color: Colors.black,
//                                               )),
//                                         ],
//                                       ),
//                                       Icon(
//                                         Icons.chevron_right_rounded,
//                                         color: Colors.black,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 2.h),
//                         InkWell(
//                           onTap: () {
//                             Get.to(MyProfile());
//                           },
//                           child: Container(
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 Container(
//                                   width: 64.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             CupertinoIcons.person,
//                                             color: Colors.black,
//                                           ),
//                                           SizedBox(
//                                             width: 2.w,
//                                           ),
//                                           Text("Profile",
//                                               style: TextStyle(
//                                                 fontSize: 12.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'sofi',
//                                                 color: Colors.black,
//                                               )),
//                                         ],
//                                       ),
//                                       Icon(
//                                         Icons.chevron_right_rounded,
//                                         color: Colors.black,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 2.h),
//                         InkWell(
//                           onTap: () {
//                             Get.to(ChatlistPage());
//                           },
//                           child: Container(
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 Container(
//                                   width: 64.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             CupertinoIcons.chat_bubble_text,
//                                             color: Colors.black,
//                                           ),
//                                           SizedBox(
//                                             width: 2.w,
//                                           ),
//                                           Text("Chat",
//                                               style: TextStyle(
//                                                 fontSize: 12.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'sofi',
//                                                 color: Colors.black,
//                                               )),
//                                         ],
//                                       ),
//                                       Icon(
//                                         Icons.chevron_right_rounded,
//                                         color: Colors.black,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 2.h),
//                         InkWell(
//                           onTap: () {
//                             Get.to(PostPage());
//                           },
//                           child: Container(
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 Container(
//                                   width: 64.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             CupertinoIcons.placemark,
//                                             color: Colors.black,
//                                           ),
//                                           SizedBox(
//                                             width: 2.w,
//                                           ),
//                                           Text("Posts",
//                                               style: TextStyle(
//                                                 fontSize: 12.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'sofi',
//                                                 color: Colors.black,
//                                               )),
//                                         ],
//                                       ),
//                                       Icon(
//                                         Icons.chevron_right_rounded,
//                                         color: Colors.black,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 2.h),
//                         InkWell(
//                           onTap: () {
//                             Get.to(ViewBudget());
//                           },
//                           child: Container(
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 Container(
//                                   width: 64.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             CupertinoIcons.money_dollar_circle,
//                                             color: Colors.black,
//                                           ),
//                                           SizedBox(
//                                             width: 2.w,
//                                           ),
//                                           Text("Budget Page",
//                                               style: TextStyle(
//                                                 fontSize: 12.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'sofi',
//                                                 color: Colors.black,
//                                               )),
//                                         ],
//                                       ),
//                                       Icon(
//                                         Icons.chevron_right_rounded,
//                                         color: Colors.black,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 2.h),
//                         InkWell(
//                           onTap: () {
//                             Get.to(QuoateList2());
//                           },
//                           child: Container(
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 Container(
//                                   width: 64.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             CupertinoIcons.info_circle,
//                                             color: Colors.black,
//                                           ),
//                                           SizedBox(
//                                             width: 2.w,
//                                           ),
//                                           Text("All Quotations",
//                                               style: TextStyle(
//                                                 fontSize: 12.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'sofi',
//                                                 color: Colors.black,
//                                               )),
//                                         ],
//                                       ),
//                                       Icon(
//                                         Icons.chevron_right_rounded,
//                                         color: Colors.black,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 2.h),
//                         InkWell(
//                           onTap: () {
//                             Get.to(BookingsPage());
//                           },
//                           child: Container(
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 Container(
//                                   width: 64.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             CupertinoIcons.bookmark,
//                                             color: Colors.black,
//                                           ),
//                                           SizedBox(
//                                             width: 2.w,
//                                           ),
//                                           Text("Bookings Page",
//                                               style: TextStyle(
//                                                 fontSize: 12.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'sofi',
//                                                 color: Colors.black,
//                                               )),
//                                         ],
//                                       ),
//                                       Icon(
//                                         Icons.chevron_right_rounded,
//                                         color: Colors.black,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 2.h),
//                         InkWell(
//                           onTap: () {
//                             Get.to(ViewAllCategory());
//                           },
//                           child: Container(
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 Container(
//                                   width: 64.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             CupertinoIcons.collections,
//                                             color: Colors.black,
//                                             size: 15.sp,
//                                           ),
//                                           SizedBox(
//                                             width: 2.w,
//                                           ),
//                                           Text("Categories",
//                                               style: TextStyle(
//                                                 fontSize: 12.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'sofi',
//                                                 color: Colors.black,
//                                               )),
//                                         ],
//                                       ),
//                                       Icon(
//                                         Icons.chevron_right_rounded,
//                                         color: Colors.black,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 2.h),
//                         InkWell(
//                           onTap: () {
//                             Get.to(Venue2());
//                           },
//                           child: Container(
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 Container(
//                                   width: 64.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             CupertinoIcons.globe,
//                                             color: Colors.black,
//                                           ),
//                                           SizedBox(
//                                             width: 2.w,
//                                           ),
//                                           Text("Venue",
//                                               style: TextStyle(
//                                                 fontSize: 12.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'sofi',
//                                                 color: Colors.black,
//                                               )),
//                                         ],
//                                       ),
//                                       Icon(
//                                         Icons.chevron_right_rounded,
//                                         color: Colors.black,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 2.h),
//                         InkWell(
//                           onTap: () {
//                             Get.to(BookingListPage());
//                           },
//                           child: Container(
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 Container(
//                                   width: 64.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             CupertinoIcons.car_detailed,
//                                             color: Colors.black,
//                                           ),
//                                           SizedBox(
//                                             width: 2.w,
//                                           ),
//                                           Text("Transportation",
//                                               style: TextStyle(
//                                                 fontSize: 12.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'sofi',
//                                                 color: Colors.black,
//                                               )),
//                                         ],
//                                       ),
//                                       Icon(
//                                         Icons.chevron_right_rounded,
//                                         color: Colors.black,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 2.h),
//                         InkWell(
//                           onTap: () {
//                             Get.to(FoodMenusPage());
//                           },
//                           child: Container(
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 Container(
//                                   width: 64.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.fastfood_outlined,
//                                             color: Colors.black,
//                                           ),
//                                           SizedBox(
//                                             width: 2.w,
//                                           ),
//                                           Text("Food Menu",
//                                               style: TextStyle(
//                                                 fontSize: 12.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'sofi',
//                                                 color: Colors.black,
//                                               )),
//                                         ],
//                                       ),
//                                       Icon(
//                                         Icons.chevron_right_rounded,
//                                         color: Colors.black,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 2.h),
//                         InkWell(
//                           onTap: () {
//                             Get.to(Accomendation_Page());
//                           },
//                           child: Container(
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 Container(
//                                   width: 64.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.pages_outlined,
//                                             color: Colors.black,
//                                           ),
//                                           SizedBox(
//                                             width: 2.w,
//                                           ),
//                                           Text("Accommodation Page",
//                                               style: TextStyle(
//                                                 fontSize: 12.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'sofi',
//                                                 color: Colors.black,
//                                               )),
//                                         ],
//                                       ),
//                                       Icon(
//                                         Icons.chevron_right_rounded,
//                                         color: Colors.black,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 2.h),
//                         InkWell(
//                           onTap: () {
//                             Get.to(DecorationPage());
//                           },
//                           child: Container(
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 Container(
//                                   width: 64.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             CupertinoIcons.crop_rotate,
//                                             color: Colors.black,
//                                           ),
//                                           SizedBox(
//                                             width: 2.w,
//                                           ),
//                                           Text("Decoration",
//                                               style: TextStyle(
//                                                 fontSize: 12.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'sofi',
//                                                 color: Colors.black,
//                                               )),
//                                         ],
//                                       ),
//                                       Icon(
//                                         Icons.chevron_right_rounded,
//                                         color: Colors.black,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 2.h),
//                         InkWell(
//                           onTap: () {
//                             Get.to(ChangePassword());
//                           },
//                           child: Container(
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 Container(
//                                   width: 64.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             CupertinoIcons.lock,
//                                             color: Colors.black,
//                                           ),
//                                           SizedBox(
//                                             width: 2.w,
//                                           ),
//                                           Text("Change Password",
//                                               style: TextStyle(
//                                                 fontSize: 12.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'sofi',
//                                                 color: Colors.black,
//                                               )),
//                                         ],
//                                       ),
//                                       Icon(
//                                         Icons.chevron_right_rounded,
//                                         color: Colors.black,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 4.h,
//                         ),
//                         InkWell(
//                           onTap: () async {
//                             Get.offAll(LoginPage());
//                           },
//                           child: Container(
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 Container(
//                                   width: 63.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.logout,
//                                             color: Colors.red,
//                                           ),
//                                           SizedBox(
//                                             width: 2.w,
//                                           ),
//                                           Text("Logout",
//                                               style: TextStyle(
//                                                 fontSize: 12.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'sofi',
//                                                 color: Colors.red,
//                                               )),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }
//
//   TextStyle textStyle = TextStyle(
//       color: Colors.black,
//       fontSize: 12.sp,
//       fontFamily: 'sofi',
//       fontWeight: FontWeight.bold);
// }
