import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/main.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class ViewTables extends StatefulWidget {
  const ViewTables({super.key});

  @override
  State<ViewTables> createState() => _ViewTablesState();
}

int sel1 = 1;
int sel = 1;

class _ViewTablesState extends State<ViewTables> {
  int? open = 0;
  bool test = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xffefefef),
      key: scaffoldKey,
      drawer: drawer1(),
      bottomNavigationBar: bottomnavbar(selit: -3),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          children: [
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded)),
                Text(
                  'Guests',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'sofi',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                IconButton(
                    onPressed: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    icon: Icon(Icons.menu_rounded)),
              ],
            ),
            SizedBox(height: 1.5.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      sel1 = 1;
                    });
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 8.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: sel1 == 1 ? Colors.amber : Colors.white,
                        borderRadius: BorderRadius.circular(9)),
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Text('Bride',
                        style: TextStyle(
                            fontSize: 12.5.sp,
                            fontFamily: 'sofi',
                            color: sel1 == 1 ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1)),
                  ),
                ),
                SizedBox(width: 0.w),
                InkWell(
                  onTap: () {
                    setState(() {
                      sel1 = 2;
                    });
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 8.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: sel1 == 2 ? Colors.amber : Colors.white,
                        borderRadius: BorderRadius.circular(9)),
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Text('Groom',
                        style: TextStyle(
                            fontSize: 12.5.sp,
                            fontFamily: 'sofi',
                            color: sel1 == 2 ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.5.h),
            Column(
              children: [
                for (int index = 0; index < 4; index++) ...[
                  Container(
                    // height: 7.h,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.shade300,
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Table " + (index + 1).toString(),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'sofi',
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              open = index;
                            });
                          },
                          child: open != index
                              ? Icon(Icons.keyboard_arrow_down_outlined)
                              : Icon(Icons.keyboard_arrow_up),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  open == index
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              children: [
                                Icon(Icons.circle),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  "Bride",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'sofi',
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        "Available Seats",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontFamily: 'sofi',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "5 / 5",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 12.sp,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Guest 1",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(height: 1.h),
                                  Text(
                                    "Guest 2",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(height: 1.h),
                                  Text(
                                    "Guest 3",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(height: 1.h),
                                  Text(
                                    "Guest 4",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(height: 1.h),
                                  Text(
                                    "Guest 5",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: 1.h,
                  ),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
