import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

class BookingSuccessfulPage extends StatefulWidget {
  const BookingSuccessfulPage({super.key});

  @override
  State<BookingSuccessfulPage> createState() => _BookingSuccessfulPageState();
}

class _BookingSuccessfulPageState extends State<BookingSuccessfulPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: drawer1(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     IconButton(
              //       onPressed: () {
              //         Get.back();
              //       },
              //       icon: Icon(
              //         Icons.arrow_back_ios_new_rounded,
              //         color: Colors.blue,
              //         size: 23.sp,
              //       ),
              //     ),
              //     Text(
              //       "Booking Successful",
              //       style: TextStyle(
              //         fontSize: 18.sp,
              //         color: Colors.blue,
              //         fontFamily: 'sofi',
              //         letterSpacing: 1,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     IconButton(
              //         onPressed: () {
              //           scaffoldKey.currentState?.openDrawer();
              //         },
              //         icon: Icon(Icons.menu_rounded,
              //             color: Colors.blue, size: 23.sp)),
              //   ],
              // ),
              // headerwid(text: "Booking Successful"),
              header(
                  text: "Booking Successful",
                  callback1: () {
                    scaffoldKey.currentState?.openDrawer();
                  }),
              Image.network(
                "https://www.transparentpng.com/thumb/car-png/car-free-transparent-png-8.png",
                height: 28.h,
              ),
              Text(
                "BMW 6 Series i4 Top Model...",
                style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.bold,
                  fontFamily: "sofi",
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 110.w,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12.0), // Control the border radius here
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                    child: Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 20.sp,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 1.5.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pick-Up Date",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: "sofi",
                                fontSize: 15.sp,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "21-09-2023",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sofi",
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 110.w,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12.0), // Control the border radius here
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 20.sp,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 1.5.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pick-Up Time",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: "sofi",
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  "09:55 Am",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: "sofi",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 20.sp,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 1.5.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Drop-Off Time",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: "sofi",
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  "08:55 Pm",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: "sofi",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 110.w,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12.0), // Control the border radius here
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.currency_rupee_sharp,
                              size: 20.sp,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 1.5.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Amount",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: "sofi",
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  "\$200",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: "sofi",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.black.withOpacity(0.12),
                          height: 5.h,
                          width: 0.5.w,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.people_outline_rounded,
                              size: 20.sp,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 1.5.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "People",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: "sofi",
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  "(1-2)",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: "sofi",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 110.w,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12.0), // Control the border radius here
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 20.sp,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 1.5.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pick-Up Location",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: "sofi",
                                fontSize: 15.sp,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 65.w,
                                  child: Text(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    "Surat,Ktargam,Gujarat,395004",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "sofi",
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 110.w,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12.0), // Control the border radius here
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 20.sp,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 1.5.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Drop-Off Location",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: "sofi",
                                fontSize: 15.sp,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 65.w,
                                  child: Text(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    "Baroda,BhaguNagar,Kamrej395002",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "sofi",
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 6.5.h,
                    width: 90.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(35)),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontFamily: 'sofi',
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
