import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/main.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

class ViewTables2 extends StatefulWidget {
  const ViewTables2({super.key});

  @override
  State<ViewTables2> createState() => _ViewTables2State();
}

int sel1 = 1;
int sel = 1;

class _ViewTables2State extends State<ViewTables2> {
  int? open = 0;
  bool test = false;
  final GlobalKey<ScaffoldState>  scaffoldKey16 = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey.shade100,
      key: scaffoldKey16,
      drawer: drawer1(),
      bottomNavigationBar: bottomnavbar(selit: -3),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            children: [
              SizedBox(height: 5.h),
              header(text: 'Seating Chart', callback1: () {
                scaffoldKey16.currentState?.openDrawer();
              }),
              SizedBox(height: 1.5.h),
              Column(
                children: [
                  for (int index = 0; index < 2; index++) ...[
                    Container(
                      // height: 7.h,
                      width: MediaQuery.of(context).size.width,

                      decoration: BoxDecoration(
                          color: open == index ? Colors.blue : Colors.white,
                          borderRadius: open == index
                              ? BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))
                              : BorderRadius.circular(20),
                          border: open != index
                              ? Border.all(color: Colors.blue, width: 2)
                              : Border.all(color: Colors.transparent, width: 2)),

                      padding:
                          EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Floor " + (index + 1).toString(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'sofi',
                              letterSpacing: 1,
                              color: open == index ? Colors.white : Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                open = index;
                              });
                            },
                            child: Icon(Icons.arrow_drop_down_circle_outlined,
                                color:
                                    open == index ? Colors.white : Colors.blue),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height:1.h),
                    open == index
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.blue)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.2.h, horizontal: 1.5.w),
                                    child: SizedBox(
                                        width: 20.w,
                                        child: Text(
                                          'Cake Table',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'sofi',
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                              fontSize: 13.sp,
                                              color: Colors.blue),
                                        )),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.blue)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.5.h, horizontal: 10.w),
                                    child: Row(
                                      children: [
                                        Image.asset('assets/stage.webp',
                                            height: 3.h,
                                            width: 8.w,
                                            color: Colors.blue),
                                        SizedBox(width: 2.w),
                                        Text(
                                          'Stage',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'sofi',
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                              fontSize: 13.sp,
                                              color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.blue)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2.h, horizontal: 1.5.w),
                                    child: SizedBox(
                                        width: 20.w,
                                        child: Text(
                                          'Gift Table',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'sofi',
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                              fontSize: 13.sp,
                                              color: Colors.blue),
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                              Row(children: [
                                Text(
                                  'Guest-Tables : ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                      fontSize: 15.sp,
                                      color: Colors.blue),
                                )
                              ]),
                            ],
                          )
                        : Container(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        open == index
                            ? Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(3.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: 21.w,
                                              alignment: Alignment.center,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  for (int ind = 0;
                                                      ind < 2;
                                                      ind++) ...[
                                                    GestureDetector(
                                                      onTap: () {
                                                        showbridedata();
                                                      },
                                                      child: Image.asset(
                                                        'assets/chair1.png',
                                                        width: 7.w,
                                                        height: 3.5.h,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                  ]
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    showbridedata();
                                                  },
                                                  child: Image.asset(
                                                    'assets/chair1.png',
                                                    width: 7.w,
                                                    height: 3.5.h,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                Center(
                                                  child: Container(
                                                    height: 5.h,
                                                    width: 25.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.blue,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Table 1',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'sofi',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 1,
                                                          fontSize: 12.sp),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    showbridedata();
                                                  },
                                                  child: Image.asset(
                                                    'assets/chair1.png',
                                                    width: 7.w,
                                                    height: 3.5.h,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Container(
                                              width: 21.w,
                                              alignment: Alignment.center,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  for (int ind = 5;
                                                      ind > 3;
                                                      ind--) ...[
                                                    GestureDetector(
                                                      onTap: () {
                                                        showbridedata();
                                                      },
                                                      child: Image.asset(
                                                        'assets/chair1.png',
                                                        width: 7.w,
                                                        height: 3.5.h,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                  ]
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                ],
                              )
                            : Container(),
                        open == index
                            ? Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(3.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: 21.w,
                                              alignment: Alignment.center,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  for (int ind = 6;
                                                      ind < 8;
                                                      ind++) ...[
                                                    GestureDetector(
                                                      onTap: () {
                                                        showbridedata();
                                                      },
                                                      child:Image.asset(
                                                        'assets/chair1.png',
                                                        width: 7.w,
                                                        height: 3.5.h,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                  ]
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    showbridedata();
                                                  },
                                                  child:Image.asset(
                                                    'assets/chair1.png',
                                                    width: 7.w,
                                                    height: 3.5.h,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                Center(
                                                  child: Container(
                                                    height: 5.h,
                                                    width: 25.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.blue,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Table 2',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'sofi',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 1,
                                                          fontSize: 12.sp),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    showbridedata();
                                                  },
                                                  child: Image.asset(
                                                    'assets/chair1.png',
                                                    width: 7.w,
                                                    height: 3.5.h,
                                                    color: Colors.blue,
                                                  ),
                                                ),],
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Container(
                                              width: 21.w,
                                              alignment: Alignment.center,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  for (int ind = 11;
                                                      ind > 9;
                                                      ind--) ...[
                                                    GestureDetector(
                                                      onTap: () {
                                                        showbridedata();
                                                      },
                                                      child: Image.asset(
                                                        'assets/chair1.png',
                                                        width: 7.w,
                                                        height: 3.5.h,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                  ]
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    open == index
                        ? Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.w),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 60.w,
                                    alignment: Alignment.center,
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        for (int ind = 12;
                                        ind < 17;
                                        ind++) ...[
                                          GestureDetector(
                                            onTap: () {
                                              showbridedata();
                                            },
                                            child: Image.asset(
                                              'assets/chair1.png',
                                              width: 7.w,
                                              height: 3.5.h,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ]
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          showbridedata();
                                        },
                                        child: Image.asset(
                                          'assets/chair1.png',
                                          width: 7.w,
                                          height: 3.5.h,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Center(
                                        child: Container(
                                          height: 7.5.h,
                                          width: 68.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                10),
                                            color: Colors.blue,
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Table 3',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'sofi',
                                                fontWeight:
                                                FontWeight.w600,
                                                letterSpacing: 1,
                                                fontSize: 12.sp),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showbridedata();
                                        },
                                        child: Image.asset(
                                          'assets/chair1.png',
                                          width: 7.w,
                                          height: 3.5.h,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  Container(
                                    width: 60.w,
                                    alignment: Alignment.center,
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        for (int ind = 23;
                                        ind > 18;
                                        ind--) ...[
                                          GestureDetector(
                                            onTap: () {
                                              showbridedata();
                                            },
                                            child: Image.asset(
                                              'assets/chair1.png',
                                              width: 7.w,
                                              height: 3.5.h,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ]
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                      ],
                    )
                        : Container(),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        open == index
                            ? Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(3.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: 18.w,
                                              alignment: Alignment.center,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  for (int ind = 24;
                                                      ind < 26;
                                                      ind++) ...[
                                                    GestureDetector(
                                                      onTap: () {
                                                        showgroomdata();
                                                      },
                                                      child: Image.asset(
                                                        'assets/chair1.png',
                                                        width: 7.w,
                                                        height: 3.5.h,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                  ]
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    showgroomdata();
                                                  },
                                                  child: Image.asset(
                                                    'assets/chair1.png',
                                                    width: 7.w,
                                                    height: 3.5.h,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                Center(
                                                  child: Container(
                                                    height: 9.5.h,
                                                    width: 21.5.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1000),
                                                      color: Colors.blue,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Table 4',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'sofi',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 1,
                                                          fontSize: 12.sp),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    showgroomdata();
                                                  },
                                                  child: Image.asset(
                                                    'assets/chair1.png',
                                                    width: 7.w,
                                                    height: 3.5.h,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Container(
                                              width: 18.w,
                                              alignment: Alignment.center,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  for (int ind = 29;
                                                      ind > 27;
                                                      ind--) ...[
                                                    GestureDetector(
                                                      onTap: () {
                                                        showgroomdata();
                                                      },
                                                      child:Image.asset(
                                                        'assets/chair1.png',
                                                        width: 7.w,
                                                        height: 3.5.h,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                  ]
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                ],
                              )
                            : Container(),
                        open == index
                            ? Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(3.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: 18.w,
                                              alignment: Alignment.center,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  for (int ind = 30;
                                                      ind < 32;
                                                      ind++) ...[
                                                    GestureDetector(
                                                      onTap: () {
                                                        showgroomdata();
                                                      },
                                                      child: Image.asset(
                                                        'assets/chair1.png',
                                                        width: 7.w,
                                                        height: 3.5.h,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                  ]
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 0.7.h,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    showgroomdata();
                                                  },
                                                  child:Image.asset(
                                                    'assets/chair1.png',
                                                    width: 7.w,
                                                    height: 3.5.h,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                Center(
                                                  child: Container(
                                                    height: 9.5.h,
                                                    width: 21.5.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1000),
                                                      color: Colors.blue,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Table 5',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'sofi',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 1,
                                                          fontSize: 12.sp),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    showgroomdata();
                                                  },
                                                  child: Image.asset(
                                                    'assets/chair1.png',
                                                    width: 7.w,
                                                    height: 3.5.h,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Container(
                                              width: 18.w,
                                              alignment: Alignment.center,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  for (int ind = 35;
                                                      ind > 33;
                                                      ind--) ...[
                                                    GestureDetector(
                                                      onTap: () {
                                                        showgroomdata();
                                                      },
                                                      child: Image.asset(
                                                        'assets/chair1.png',
                                                        width: 7.w,
                                                        height: 3.5.h,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                  ]
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                  ]
                ],
              ),
              SizedBox(height: 10.h)
            ],
          ),
        ),
      ),
    );
  }

  showbridedata() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        'Groom\'s Guest',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontFamily: 'sofi',
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            height: 0.17.h,
                            letterSpacing: 1),
                      ),
                    ]),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Icon(CupertinoIcons.person_alt,
                            color: Colors.blue, size: 17.sp),
                        SizedBox(width: 1.w),
                        Text(
                          'Guest Name :  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                        Text(
                          'Steave Austin',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'sofi',
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Image.asset(
                          'assets/chair.png',
                          width: 6.w,
                          height: 3.h,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 1.w),
                        Text(
                          'Seat No :  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                        Text(
                          '10',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'sofi',
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                  ],
                ),
              ),
            ),
            Positioned(
                right: 0,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(CupertinoIcons.clear_circled_solid)))
          ],
        );
      },
    );
  }

  showgroomdata() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        'Groom\'s Guest',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontFamily: 'sofi',
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            height: 0.17.h,
                            letterSpacing: 1),
                      ),
                    ]),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Icon(CupertinoIcons.person_alt,
                            color: Colors.blue, size: 17.sp),
                        SizedBox(width: 1.w),
                        Text(
                          'Guest Name :  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                        Text(
                          'Steave Austin',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'sofi',
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Image.asset(
                          'assets/chair.png',
                          width: 6.w,
                          height: 3.h,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 1.w),
                        Text(
                          'Seat No :  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                        Text(
                          '10',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'sofi',
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                  ],
                ),
              ),
            ),
            Positioned(
                right: 0,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(CupertinoIcons.clear_circled_solid)))
          ],
        );
      },
    );
  }
}
