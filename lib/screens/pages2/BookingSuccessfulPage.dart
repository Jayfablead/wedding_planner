import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class BookingSuccessfulPage extends StatefulWidget {
  const BookingSuccessfulPage({super.key});

  @override
  State<BookingSuccessfulPage> createState() => _BookingSuccessfulPageState();
}

class _BookingSuccessfulPageState extends State<BookingSuccessfulPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(null)),
                  Text(
                    "Booking Successful",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'sofi',
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Icon(Icons.menu_rounded)),
                ],
              ),
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


              // Column(
              //   children: [
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Container(
              //           height: 15.h,
              //           width: 30.w,
              //           child: Card(
              //             child: Padding(
              //               padding: EdgeInsets.symmetric(
              //                   vertical: 2.h, horizontal: 4.w),
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Icon(
              //                     Icons.currency_rupee_sharp,
              //                     size: 20.sp,
              //                     color: Colors.pink,
              //                   ),
              //                   SizedBox(
              //                     height: 1.h,
              //                   ),
              //                   Text(
              //                     "\$200",
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 15.sp,
              //                       fontFamily: "sofi",
              //                     ),
              //                   ),
              //                   SizedBox(
              //                     height: 1.h,
              //                   ),
              //                   Text(
              //                     "Amount",
              //                     style: TextStyle(
              //                         fontWeight: FontWeight.normal,
              //                         fontFamily: "sofi",
              //                         fontSize: 12.sp),
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //           width: 10.w,
              //         ),
              //         Container(
              //           height: 15.h,
              //           width: 30.w,
              //           child: Card(
              //             child: Padding(
              //               padding: EdgeInsets.symmetric(
              //                   vertical: 2.h, horizontal: 4.w),
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Icon(
              //                     Icons.people_outline_rounded,
              //                     size: 22.sp,
              //                     color: Colors.pink,
              //                   ),
              //                   SizedBox(
              //                     height: 1.h,
              //                   ),
              //                   Text(
              //                     "People",
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 15.sp,
              //                       fontFamily: "sofi",
              //                     ),
              //                   ),
              //                   SizedBox(
              //                     height: 1.h,
              //                   ),
              //                   Text(
              //                     "( 1-2 )",
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.normal,
              //                       fontSize: 12.sp,
              //                       fontFamily: "sofi",
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //         // Container(
              //         //   height: 15.h,
              //         //   width: 30.w,
              //         //   child: Card(
              //         //     child: Padding(
              //         //       padding: EdgeInsets.symmetric(
              //         //           vertical: 2.h, horizontal: 4.w),
              //         //       child: Column(
              //         //         mainAxisAlignment: MainAxisAlignment.start,
              //         //         crossAxisAlignment: CrossAxisAlignment.start,
              //         //         children: [
              //         //           Icon(
              //         //             Icons.shopping_bag_sharp,
              //         //             size: 22.sp,
              //         //             color: Colors.pink,
              //         //           ),
              //         //           SizedBox(
              //         //             height: 1.h,
              //         //           ),
              //         //           Text(
              //         //             "Bags",
              //         //             style: TextStyle(
              //         //                 fontWeight: FontWeight.bold,
              //         //                 fontFamily: "sofi",
              //         //                 fontSize: 15.sp),
              //         //           ),
              //         //           SizedBox(
              //         //             height: 1.h,
              //         //           ),
              //         //           Text(
              //         //             "( 1-2 )",
              //         //             style: TextStyle(
              //         //                 fontWeight: FontWeight.normal,
              //         //                 fontFamily: "sofi",
              //         //                 fontSize: 12.sp),
              //         //           ),
              //         //         ],
              //         //       ),
              //         //     ),
              //         //   ),
              //         // ),
              //       ],
              //     ),
              //   ],
              // ),




              Container(
                height: 10.h,
                width: 110.w,
                child: Card(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                    child: Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 20.sp,
                          color: Colors.pink,
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
                height: 10.h,
                width: 110.w,
                child: Card(
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
                              color: Colors.pink,
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
                                  "09:55Am",
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
                              color: Colors.pink,
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
                                  "08:55Pm",
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
                height: 10.h,
                width: 110.w,
                child: Card(
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
                              color: Colors.pink,
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
                              color: Colors.pink,
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
                height: 14.h,
                width: 110.w,
                child: Card(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 20.sp,
                          color: Colors.pink,
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
                height: 14.h,
                width: 110.w,
                child: Card(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 20.sp,
                          color: Colors.pink,
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

            ],
          ),
        ),
      ),
    );
  }
}
