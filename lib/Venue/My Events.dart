import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/My_Event_Detials_Modal.dart';
import 'package:wedding_planner/widgets/drawer.dart';

import '../Provider/taskprovider.dart';
import '../widgets/buildErrorDialog.dart';
import '../widgets/const.dart';
import '../widgets/headerwidget.dart';
import '../widgets/load.dart';

class My_Event extends StatefulWidget {
  const My_Event({super.key});

  @override
  State<My_Event> createState() => _My_EventState();
}

final GlobalKey<ScaffoldState> scaffoldKey27 = GlobalKey<ScaffoldState>();
final controller = PageController(viewportFraction: 0.8, keepPage: true);
List HotelIm = [
  'https://i0.wp.com/decorsutrablog.com/wp-content/uploads/2020/06/DecorSutra_Wedding-Decor-9_Royal-Decor.jpg?fit=780%2C425&ssl=1',
  'https://i.pinimg.com/originals/2f/10/f6/2f10f6363ce6fd2461cec2bd46dbc916.jpg',
  'https://fancdesigns.com/wp-content/uploads/2016/08/royal-decorations-40-royal-wedding-decorations-2246-x-1162-1.jpg',
  'https://i0.wp.com/eventertainments.com/blog/wp-content/uploads/2021/03/Best-Wedding-Stage-Decoration-with-Flowers.jpg?fit=1200%2C900&ssl=1',
  'https://cdn0.weddingwire.in/vendor/8241/3_2/960/jpg/img-20180903-wa0013_15_158241.jpeg',
  'https://www.dreamzkraft.com/admin/blog-images/big/decoration-for-wedding/wedding-decoration%E2%80%93royal-2.jpg',
];
int ind = 0;
bool isLoading = true;

class _My_EventState extends State<My_Event> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
    });
    MyEventDetailsapi();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
        key: scaffoldKey27,
        drawer: drawer1(),
        body: isLoading
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Center(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 6.h,
                            ),
                            header(
                                text: "My Event Details",
                                callback1: () {
                                  scaffoldKey27.currentState?.openDrawer();
                                }),
                            SizedBox(height: 1.h),
                            myevent?.eventDetails == null?Container(height: 80.h,child: Center(
                              child: Text("No Event Details Available", style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.black,
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  fontWeight:
                                  FontWeight.bold),),
                            )): Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 1.5.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 90.w,
                                            height: 10.h,
                                            padding: EdgeInsets.only(left: 2.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(3.w),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      color: Colors.blue),
                                                  child: Icon(
                                                    CupertinoIcons.person,
                                                    color: Colors.white,
                                                    size: 18.sp,
                                                  ),
                                                ),
                                                SizedBox(width: 5.w),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Event Owner Name : ',
                                                      style: TextStyle(
                                                          fontSize: 17.sp,
                                                          color: Colors.blue,
                                                          fontFamily: 'sofi',
                                                          letterSpacing: 1,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(height: 0.5.h),
                                                    SizedBox(
                                                      width: 45.w,
                                                      child: Text(
                                                        myevent?.eventDetails
                                                                        ?.groomName ==
                                                                    '' ||
                                                                myevent?.eventDetails
                                                                        ?.groomName ==
                                                                    null
                                                            ? 'N/A'
                                                            : "${myevent?.eventDetails?.groomName} ${myevent?.eventDetails?.brideName}",
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.8),
                                                            fontFamily: 'sofi',
                                                            letterSpacing: 1,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          myevent?.eventDetails?.eventCompanies
                                                          ?.length ==
                                                      0 ||
                                                  myevent
                                                          ?.eventDetails
                                                          ?.eventCompanies
                                                          ?.length ==
                                                      null ||
                                                  myevent?.eventDetails
                                                          ?.eventCompanies ==
                                                      null
                                              ? Container()
                                              : SizedBox(height: 1.5.h),
                                          myevent?.eventDetails?.eventCompanies
                                                          ?.length ==
                                                      0 ||
                                                  myevent
                                                          ?.eventDetails
                                                          ?.eventCompanies
                                                          ?.length ==
                                                      null ||
                                                  myevent?.eventDetails
                                                          ?.eventCompanies ==
                                                      null
                                              ? Container()
                                              : Text(
                                                  'Event Company Names :',
                                                  style: TextStyle(
                                                      fontSize: 17.sp,
                                                      color: Colors.blue,
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                          myevent?.eventDetails?.eventCompanies
                                                          ?.length ==
                                                      0 ||
                                                  myevent
                                                          ?.eventDetails
                                                          ?.eventCompanies
                                                          ?.length ==
                                                      null ||
                                                  myevent?.eventDetails
                                                          ?.eventCompanies ==
                                                      null
                                              ? Container()
                                              : SizedBox(height: 0.5.h),
                                          myevent?.eventDetails?.eventCompanies
                                                          ?.length ==
                                                      0 ||
                                                  myevent
                                                          ?.eventDetails
                                                          ?.eventCompanies
                                                          ?.length ==
                                                      null ||
                                                  myevent?.eventDetails
                                                          ?.eventCompanies ==
                                                      null
                                              ? Container()
                                              : Column(children: [
                                                  for (int i = 0;
                                                      i <
                                                          (myevent
                                                                  ?.eventDetails
                                                                  ?.eventCompanies
                                                                  ?.length ??
                                                              0);
                                                      i++) ...[
                                                    Container(
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .symmetric(
                                                                  vertical:
                                                                      1.h),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 90.w,
                                                            height: 10.h,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left:
                                                                        2.15.w),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            child: Row(
                                                              // mainAxisAlignment: MainAxisAlignment.start,
                                                              // crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(3
                                                                              .w),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              7),
                                                                      color: Colors
                                                                          .blue),
                                                                  child: Icon(
                                                                    Icons
                                                                        .access_alarm,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 18.sp,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    width: 5.w),
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      myevent
                                                                              ?.eventDetails
                                                                              ?.eventCompanies?[i]
                                                                              .companyName ??
                                                                          '',
                                                                      style: TextStyle(
                                                                          fontSize: 17
                                                                              .sp,
                                                                          color: Colors
                                                                              .blue,
                                                                          fontFamily:
                                                                              'sofi',
                                                                          letterSpacing:
                                                                              1,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ]),
                                          SizedBox(height: 1.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 90.w,
                                                height: 10.h,
                                                padding: EdgeInsets.only(
                                                    left: 2.15.w),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.white,
                                                ),
                                                child: Row(
                                                  // mainAxisAlignment: MainAxisAlignment.start,
                                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(3.w),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          color: Colors.blue),
                                                      child: Icon(
                                                        Icons.calendar_month,
                                                        color: Colors.white,
                                                        size: 18.sp,
                                                      ),
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Event Date :',
                                                          style: TextStyle(
                                                              fontSize: 17.sp,
                                                              color:
                                                                  Colors.blue,
                                                              fontFamily:
                                                                  'sofi',
                                                              letterSpacing: 1,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(height: 0.5.h),
                                                        Text(
                                                          myevent?.eventDetails
                                                                          ?.functionDate ==
                                                                      '' ||
                                                                  myevent?.eventDetails
                                                                          ?.functionDate ==
                                                                      null
                                                              ? 'N/A'
                                                              : myevent
                                                                      ?.eventDetails
                                                                      ?.functionDate ??
                                                                  "",
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.8),
                                                              fontFamily:
                                                                  'sofi',
                                                              letterSpacing: 1,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 1.5.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 90.w,
                                                height: 10.h,
                                                padding:
                                                    EdgeInsets.only(left: 2.w),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.white,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(3.w),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          color: Colors.blue),
                                                      child: Icon(
                                                        CupertinoIcons.info,
                                                        color: Colors.white,
                                                        size: 18.sp,
                                                      ),
                                                    ),
                                                    SizedBox(width: 5.w),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Event Name : ',
                                                          style: TextStyle(
                                                              fontSize: 17.sp,
                                                              color:
                                                                  Colors.blue,
                                                              fontFamily:
                                                                  'sofi',
                                                              letterSpacing: 1,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(height: 0.5.h),
                                                        SizedBox(
                                                          width: 52.w,
                                                          child: Text(
                                                            myevent?.eventDetails
                                                                            ?.eventName ==
                                                                        '' ||
                                                                    myevent?.eventDetails
                                                                            ?.eventName ==
                                                                        null
                                                                ? 'N/A'
                                                                : myevent
                                                                        ?.eventDetails
                                                                        ?.eventName ??
                                                                    "",
                                                            style: TextStyle(
                                                                fontSize: 15.sp,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.8),
                                                                fontFamily:
                                                                    'sofi',
                                                                letterSpacing:
                                                                    1,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 1.5.h),
                                          Text(
                                            'Event Space Timings :',
                                            style: TextStyle(
                                                fontSize: 17.sp,
                                                color: Colors.blue,
                                                fontFamily: 'sofi',
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 0.5.h),
                                          myevent?.eventDetails?.eventSpaceIds
                                                          ?.length ==
                                                      0 ||
                                                  myevent
                                                          ?.eventDetails
                                                          ?.eventSpaceIds
                                                          ?.length ==
                                                      null ||
                                                  myevent?.eventDetails
                                                          ?.eventSpaceIds ==
                                                      null
                                              ? Container()
                                              : Column(children: [
                                                  for (int i = 0;
                                                      i <
                                                          (myevent
                                                                  ?.eventDetails
                                                                  ?.eventSpaceIds
                                                                  ?.length ??
                                                              0);
                                                      i++) ...[
                                                    Container(
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .symmetric(
                                                                  vertical:
                                                                      1.h),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 90.w,
                                                            height: 10.h,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left:
                                                                        2.15.w),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            child: Row(
                                                              // mainAxisAlignment: MainAxisAlignment.start,
                                                              // crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(3
                                                                              .w),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              7),
                                                                      color: Colors
                                                                          .blue),
                                                                  child: Icon(
                                                                    Icons
                                                                        .access_alarm,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 18.sp,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    width: 5.w),
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      myevent
                                                                              ?.eventDetails
                                                                              ?.eventSpaceIds?[i]
                                                                              .eventSpaceName ??
                                                                          '',
                                                                      style: TextStyle(
                                                                          fontSize: 17
                                                                              .sp,
                                                                          color: Colors
                                                                              .blue,
                                                                          fontFamily:
                                                                              'sofi',
                                                                          letterSpacing:
                                                                              1,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            0.5.h),
                                                                    Text(
                                                                      myevent
                                                                              ?.eventDetails
                                                                              ?.eventSpaceIds?[i]
                                                                              .eventSpaceTime ??
                                                                          '',
                                                                      style: TextStyle(
                                                                          fontSize: 16
                                                                              .sp,
                                                                          color: Colors.black.withOpacity(
                                                                              0.8),
                                                                          fontFamily:
                                                                              'sofi',
                                                                          letterSpacing:
                                                                              1,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ]),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 90.w,
                                        height: 10.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(3.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: Colors.blue),
                                              child: Icon(
                                                CupertinoIcons.mail,
                                                color: Colors.white,
                                                size: 18.sp,
                                              ),
                                            ),
                                            SizedBox(width: 5.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Event Email : ',
                                                  style: TextStyle(
                                                      fontSize: 17.sp,
                                                      color: Colors.blue,
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 0.5.h),
                                                SizedBox(
                                                  width: 67.w,
                                                  child: Text(
                                                    myevent?.eventDetails
                                                                    ?.email ==
                                                                '' ||
                                                            myevent?.eventDetails
                                                                    ?.email ==
                                                                null
                                                        ? 'N/A'
                                                        : myevent?.eventDetails
                                                                ?.email ??
                                                            "",
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        color: Colors.black
                                                            .withOpacity(0.8),
                                                        fontFamily: 'sofi',
                                                        letterSpacing: 1,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.5.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 90.w,
                                        height: 10.h,
                                        padding: EdgeInsets.only(left: 2.15.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(3.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: Colors.blue),
                                              child: Icon(
                                                CupertinoIcons.phone,
                                                color: Colors.white,
                                                size: 18.sp,
                                              ),
                                            ),
                                            SizedBox(width: 5.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Contact : ',
                                                  style: TextStyle(
                                                      fontSize: 17.sp,
                                                      color: Colors.blue,
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 0.5.h),
                                                Text(
                                                  myevent?.eventDetails
                                                                  ?.phone ==
                                                              '' ||
                                                          myevent?.eventDetails
                                                                  ?.phone ==
                                                              null
                                                      ? 'N/A'
                                                      : myevent?.eventDetails
                                                              ?.phone ??
                                                          "",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: Colors.black
                                                          .withOpacity(0.8),
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.5.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 90.w,
                                        height: 10.h,
                                        padding: EdgeInsets.only(left: 2.15.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(3.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: Colors.blue),
                                              child: Icon(
                                                CupertinoIcons
                                                    .person_2_square_stack,
                                                color: Colors.white,
                                                size: 18.sp,
                                              ),
                                            ),
                                            SizedBox(width: 5.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Guests : ',
                                                  style: TextStyle(
                                                      fontSize: 17.sp,
                                                      color: Colors.blue,
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 0.5.h),
                                                Text(
                                                  myevent?.eventDetails
                                                                  ?.guests ==
                                                              '' ||
                                                          myevent?.eventDetails
                                                                  ?.guests ==
                                                              null
                                                      ? 'N/A'
                                                      : myevent?.eventDetails
                                                              ?.guests ??
                                                          "",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: Colors.black
                                                          .withOpacity(0.8),
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.5.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 90.w,
                                        height: 10.h,
                                        padding: EdgeInsets.only(left: 2.15.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(3.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: Colors.blue),
                                              child: Icon(
                                                Icons.bedroom_baby_outlined,
                                                color: Colors.white,
                                                size: 18.sp,
                                              ),
                                            ),
                                            SizedBox(width: 5.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Furniture Required :',
                                                  style: TextStyle(
                                                      fontSize: 17.sp,
                                                      color: Colors.blue,
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 0.5.h),
                                                Text(
                                                  myevent?.eventDetails
                                                                  ?.guests ==
                                                              '' ||
                                                          myevent?.eventDetails
                                                                  ?.guests ==
                                                              null
                                                      ? 'N/A'
                                                      : myevent?.eventDetails
                                                              ?.guests ??
                                                          "",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: Colors.black
                                                          .withOpacity(0.8),
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.5.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 90.w,
                                        height: 10.h,
                                        padding: EdgeInsets.only(left: 2.15.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(3.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: Colors.blue),
                                              child: Icon(
                                                Icons.people_alt_outlined,
                                                color: Colors.white,
                                                size: 18.sp,
                                              ),
                                            ),
                                            SizedBox(width: 5.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Venue coordinator :',
                                                  style: TextStyle(
                                                      fontSize: 17.sp,
                                                      color: Colors.blue,
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 0.5.h),
                                                Text(
                                                  myevent?.eventDetails
                                                                  ?.guests ==
                                                              '' ||
                                                          myevent?.eventDetails
                                                                  ?.guests ==
                                                              null
                                                      ? 'N/A'
                                                      : myevent?.eventDetails
                                                              ?.guests ??
                                                          "",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: Colors.black
                                                          .withOpacity(0.8),
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Team Members : ',
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            color: Colors.blue,
                                            fontFamily: 'sofi',
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.h),
                                  Column(children: [
                                    for (int i = 0;
                                        i <
                                            (myevent?.eventDetails?.teamMembers
                                                    ?.length ??
                                                0);
                                        i++) ...[
                                      Container(
                                        margin: EdgeInsetsDirectional.symmetric(
                                            vertical: 1.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 90.w,
                                              height: 10.h,
                                              padding:
                                                  EdgeInsets.only(left: 2.15.w),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                // mainAxisAlignment: MainAxisAlignment.start,
                                                // crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 7.h,
                                                    width: 14.w,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadiusDirectional
                                                              .circular(8),
                                                      child: CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl: myevent
                                                                ?.eventDetails
                                                                ?.teamMembers?[
                                                                    i]
                                                                .profilePicture ??
                                                            '',
                                                        progressIndicatorBuilder:
                                                            (context, url,
                                                                    progress) =>
                                                                CircularProgressIndicator(),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.asset(
                                                          'assets/def.jpeg',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.w),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        myevent
                                                                ?.eventDetails
                                                                ?.teamMembers?[
                                                                    i]
                                                                .fullName ??
                                                            '',
                                                        style: TextStyle(
                                                            fontSize: 17.sp,
                                                            color: Colors.blue,
                                                            fontFamily: 'sofi',
                                                            letterSpacing: 1,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(height: 0.5.h),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ]),
                                  SizedBox(height: 2.5.h),
                                ],
                              ),
                            ),
                            SizedBox(height: 1.h),
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(height: 3.h),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  MyEventDetailsapi() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().MyEventDetailsApi().then((response) async {
          myevent = My_Event_Details_Modal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && myevent?.status == "0") {
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
