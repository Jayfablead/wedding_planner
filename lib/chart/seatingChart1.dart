import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

class SeatingChart1 extends StatefulWidget {
  const SeatingChart1({super.key});

  @override
  State<SeatingChart1> createState() => _SeatingChart1State();
}

int open = 1;

class _SeatingChart1State extends State<SeatingChart1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 5.h),
          header(text: 'Seating Chart', callback1: () {}),
          SizedBox(height: 2.h),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: open == 1 ? Colors.blue : Colors.white,
                borderRadius: open == 1
                    ? BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))
                    : BorderRadius.circular(20),
                border: open != 1
                    ? Border.all(color: Colors.blue, width: 2)
                    : Border.all(color: Colors.transparent, width: 2)),
            padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Floor 1',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'sofi',
                    letterSpacing: 1,
                    color: open == 1 ? Colors.white : Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      open = 1;
                    });
                  },
                  child: Icon(Icons.arrow_drop_down_circle_outlined,
                      color: open == 1 ? Colors.white : Colors.blue),
                )
              ],
            ),
          ),
          open == 1 ? SizedBox(height: 2.h) : SizedBox(),
          open == 1
              ? Container(
                  height: 55.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue)),
                          padding: EdgeInsets.symmetric(
                              vertical: 0.9.h, horizontal: 1.5.w),
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
                              border: Border.all(color: Colors.blue)),
                          padding: EdgeInsets.symmetric(
                              vertical: 1.5.h, horizontal: 10.w),
                          child: Row(
                            children: [
                              Image.asset('assets/stage.webp',
                                  height: 3.h, width: 8.w, color: Colors.blue),
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
                              border: Border.all(color: Colors.blue)),
                          padding: EdgeInsets.symmetric(
                              vertical: 0.9.h, horizontal: 1.5.w),
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
                    SizedBox(height: 2.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
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
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2.h, horizontal: 3.w),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Bride\'s Guest',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 17.sp,
                                                        fontFamily: 'sofi',
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        height: 0.17.h,
                                                        letterSpacing: 1),
                                                  ),
                                                ]),
                                            SizedBox(height: 2.h),
                                            Row(
                                              children: [
                                                Icon(CupertinoIcons.person,color: Colors.blue,size: 17.sp),SizedBox(width: 1.w),
                                                Text(
                                                  'Guest Name :  ',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily: 'sofi',
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      height: 0.17.h,
                                                      letterSpacing: 1),
                                                ),
                                                Text(
                                                  'Ramla Mer',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontFamily: 'sofi',
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      height: 0.17.h,
                                                      letterSpacing: 1),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 1.5.h),
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      height: 0.17.h,
                                                      letterSpacing: 1),
                                                ),
                                                Text(
                                                  '1',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontFamily: 'sofi',
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                            icon: Icon(CupertinoIcons
                                                .clear_circled_solid)))
                                  ],
                                );
                              },
                            );
                          },
                          child: Image.asset(
                            'assets/chair.png',
                            width: 15.w,
                            height: 6.h,
                            color: Colors.blue,
                          ),
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.white,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ]),
                )
              : Container(),
          SizedBox(height: 2.h),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: open == 2 ? Colors.blue : Colors.white,
                borderRadius: open == 2
                    ? BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))
                    : BorderRadius.circular(20),
                border: open != 2
                    ? Border.all(color: Colors.blue, width: 2)
                    : Border.all(color: Colors.transparent, width: 2)),
            padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Floor 2',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'sofi',
                    letterSpacing: 1,
                    color: open == 2 ? Colors.white : Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      open = 2;
                    });
                  },
                  child: Icon(Icons.arrow_drop_down_circle_outlined,
                      color: open == 2 ? Colors.white : Colors.blue),
                )
              ],
            ),
          ),
          open == 2 ? SizedBox(height: 2.h) : SizedBox(),
          open == 2
              ? Container(
                  height: 55.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
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
                              border: Border.all(color: Colors.blue)),
                          padding: EdgeInsets.symmetric(
                              vertical: 1.5.h, horizontal: 10.w),
                          child: Row(
                            children: [
                              Image.asset('assets/stage.webp',
                                  height: 3.h, width: 8.w, color: Colors.blue),
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
                    SizedBox(height: 2.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
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
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2.h, horizontal: 3.w),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Groom\'s Guest',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 17.sp,
                                                        fontFamily: 'sofi',
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        height: 0.17.h,
                                                        letterSpacing: 1),
                                                  ),
                                                ]),
                                            SizedBox(height: 2.h),
                                            Row(
                                              children: [
                                                Icon(CupertinoIcons.person,color: Colors.blue,size: 17.sp),SizedBox(width: 1.w),
                                                Text(
                                                  'Guest Name :  ',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily: 'sofi',
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                            icon: Icon(CupertinoIcons
                                                .clear_circled_solid)))
                                  ],
                                );
                              },
                            );
                          },
                          child: Image.asset(
                            'assets/chair.png',
                            width: 15.w,
                            height: 6.h,
                            color: Colors.blue,
                          ),
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.blue,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.white,
                        ),
                        Image.asset(
                          'assets/chair.png',
                          width: 15.w,
                          height: 6.h,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ]),
                )
              : Container(),
        ]),
      ),
    );
  }
}
