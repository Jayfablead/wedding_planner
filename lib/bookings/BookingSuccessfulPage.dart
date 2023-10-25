import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Chat/msg2.dart';
import 'package:wedding_planner/Modal/BookSuccessfullModal.dart';
import 'package:wedding_planner/chnages/yellowHomePage.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../Provider/authprovider.dart';
import '../widgets/buildErrorDialog.dart';
import '../widgets/const.dart';

class BookingSuccessfulPage extends StatefulWidget {
  String? bId;

  BookingSuccessfulPage({super.key, this.bId});

  @override
  State<BookingSuccessfulPage> createState() => _BookingSuccessfulPageState();
}

class _BookingSuccessfulPageState extends State<BookingSuccessfulPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BookSuccessap();
  }

  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
        key: scaffoldKey,
        drawer: drawer1(),
        body: isLoading
            ? Container()
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        header(
                            text: "Booking Successful",
                            callback1: () {
                              scaffoldKey.currentState?.openDrawer();
                            }),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 0.5.w),
                              height: 25.h,
                              width: 95.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: CachedNetworkImage(
                                  // fit: BoxFit.cover,
                                  imageUrl:
                                      booksuccess?.supplierInfo?.profile ?? '',
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, progress) => Center(
                                          child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    'assets/user.png',
                                  ),
                                ),
                              ),
                            ),
                            // Image.network(
                            //   "https://www.transparentpng.com/thumb/car-png/car-free-transparent-png-8.png",
                            //   height: 28.h,
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 1.8.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                booksuccess?.supplierInfo?.services
                                                ?.categoryName ==
                                            '' ||
                                        booksuccess?.supplierInfo?.services
                                                ?.categoryName ==
                                            null
                                    ? 'N/A'
                                    : booksuccess?.supplierInfo?.services
                                            ?.categoryName ??
                                        '',
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.black.withOpacity(0.9),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "sofi",
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(Msg2(
                                    id: supplierdetailmodal?.supplierInfo?.id ??
                                        "",
                                    name: supplierdetailmodal
                                            ?.supplierInfo?.name ??
                                        "",
                                    img: supplierdetailmodal
                                            ?.supplierInfo?.profile ??
                                        "",
                                  ));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(2.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.blue),
                                  child: Icon(
                                    Icons.chat,
                                    color: Colors.white,
                                    size: 18.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 92.w,
                              height: 10.h,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      12.0), // Control the border radius here
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        booksuccess?.supplierInfo?.name == "" ||
                                                booksuccess
                                                        ?.supplierInfo?.name ==
                                                    null
                                            ? "N/A"
                                            : booksuccess?.supplierInfo?.name ??
                                                '',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "sofi",
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.5.h,
                                      ),
                                      Text(
                                        booksuccess?.supplierInfo?.email ==
                                                    "" ||
                                                booksuccess
                                                        ?.supplierInfo?.email ==
                                                    null
                                            ? "N/A"
                                            : booksuccess
                                                    ?.supplierInfo?.email ??
                                                '',
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "sofi",
                                            fontSize: 16.sp,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          width: 110.w,
                          height: 10.h,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12.0), // Control the border radius here
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Booking ID : ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "sofi",
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    SizedBox(height: 1.5.h),
                                    Text(
                                      booksuccess?.bookingInfo?.bookingNo ==
                                                  "" ||
                                              booksuccess?.bookingInfo
                                                      ?.bookingNo ==
                                                  null
                                          ? "N/A"
                                          : booksuccess
                                                  ?.bookingInfo?.bookingNo ??
                                              '',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.7),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "sofi",
                                        letterSpacing: 1.3,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          width: 110.w,
                          height: 7.h,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12.0), // Control the border radius here
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Booking Status : ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "sofi",
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    booksuccess?.bookingInfo?.bStatus == '0'
                                        ? "Pending"
                                        : 'Conmpleted',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "sofi",
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: 110.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 45.w,
                                height: 7.5.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        12.0), // Control the border radius here
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.date_range,
                                          color: Colors.blue,
                                          size: 16.sp,
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Date :",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "sofi",
                                                  fontSize: 16.sp,
                                                  letterSpacing: 1),
                                            ),
                                            SizedBox(height: 0.5.h),
                                            Text(
                                              booksuccess?.bookingInfo?.bDate ==
                                                          "" ||
                                                      booksuccess?.bookingInfo
                                                              ?.bDate ==
                                                          null
                                                  ? "N/A"
                                                  : booksuccess?.bookingInfo
                                                          ?.bDate ??
                                                      '',
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.7),
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "sofi",
                                                  fontSize: 16.sp,
                                                  letterSpacing: 1),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 45.w,
                                height: 7.5.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        12.0), // Control the border radius here
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          color: Colors.blue,
                                          size: 16.sp,
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Time :",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "sofi",
                                                  fontSize: 16.sp,
                                                  letterSpacing: 1),
                                            ),
                                            SizedBox(height: 0.5.h),
                                            Text(
                                              booksuccess?.bookingInfo?.bTime ==
                                                          "" ||
                                                      booksuccess?.bookingInfo
                                                              ?.bTime ==
                                                          null
                                                  ? "N/A"
                                                  : booksuccess?.bookingInfo
                                                          ?.bTime ??
                                                      '',
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.7),
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "sofi",
                                                  fontSize: 16.sp,
                                                  letterSpacing: 1),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     // Container(
                        //     //   width: 50.w,
                        //     //   height: 7.5.h,
                        //     //   decoration: BoxDecoration(
                        //     //       borderRadius: BorderRadius.circular(12),
                        //     //       ),
                        //     //   child: Card(shape: RoundedRectangleBorder(
                        //     //     borderRadius: BorderRadius.circular(
                        //     //         12.0), // Control the border radius here
                        //     //   ),
                        //     //     child: Padding(
                        //     //       padding: EdgeInsets.symmetric(horizontal: 2.w),
                        //     //       child: Row(
                        //     //         children: [
                        //     //           Icon(
                        //     //             Icons.attach_money_rounded,
                        //     //             color: Colors.blue,
                        //     //             size: 16.sp,
                        //     //           ),
                        //     //           SizedBox(
                        //     //             width: 4.w,
                        //     //           ),
                        //     //           Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                        //     //             children: [
                        //     //               Text(
                        //     //                 "Starting Cost :",
                        //     //                 style: TextStyle(
                        //     //                   color: Colors.black,
                        //     //                   fontWeight: FontWeight.w600,
                        //     //                   fontFamily: "sofi",
                        //     //                   fontSize: 16.sp,letterSpacing: 1
                        //     //                 ),
                        //     //               ),SizedBox(height: 0.5.h),
                        //     //               Text(
                        //     //                 "\$ 1,50,000",
                        //     //                 style: TextStyle(
                        //     //                     color: Colors.black.withOpacity(0.7),
                        //     //                     fontWeight: FontWeight.w600,
                        //     //                     fontFamily: "sofi",
                        //     //                     fontSize: 16.sp,letterSpacing: 1
                        //     //                 ),
                        //     //               ),
                        //     //             ],
                        //     //           )
                        //     //         ],
                        //     //       ),
                        //     //     ),
                        //     //   ),
                        //     // ),
                        //     // InkWell(
                        //     //   onTap: () {},
                        //     //   child: Container(
                        //     //     width: 45.w,
                        //     //     height: 7.5.h,
                        //     //     decoration: BoxDecoration(
                        //     //       borderRadius: BorderRadius.circular(12),
                        //     //     ),
                        //     //     child: Card(
                        //     //       shape: RoundedRectangleBorder(
                        //     //         borderRadius: BorderRadius.circular(
                        //     //             12.0), // Control the border radius here
                        //     //       ),
                        //     //       child: Padding(
                        //     //         padding:
                        //     //             EdgeInsets.symmetric(horizontal: 2.w),
                        //     //         child: Row(
                        //     //           children: [
                        //     //             Icon(
                        //     //               Icons.chat,
                        //     //               color: Colors.blue,
                        //     //               size: 21.sp,
                        //     //             ),
                        //     //             SizedBox(width: 2.w),
                        //     //             Text(
                        //     //               "Chat Now",
                        //     //               style: TextStyle(
                        //     //                   color:
                        //     //                       Colors.black.withOpacity(0.7),
                        //     //                   fontWeight: FontWeight.w600,
                        //     //                   fontFamily: "sofi",
                        //     //                   fontSize: 17.sp,
                        //     //                   letterSpacing: 1),
                        //     //             ),
                        //     //           ],
                        //     //         ),
                        //     //       ),
                        //     //     ),
                        //     //   ),
                        //     // ),
                        //   ],
                        // ),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.offAll(
                                  YellowHomeScreen(sele: 2),
                                );
                              },
                              child: Container(
                                height: 6.5.h,
                                width: 90.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(35)),
                                child: Text(
                                  'Continue',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                      ]),
                ),
              ),
      ),
    );
  }

  BookSuccessap() {
    checkInternet().then((internet) async {
      if (internet) {
        authprovider()
            .booksuccess(widget.bId.toString())
            .then((response) async {
          booksuccess =
              BookSuccessfullModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && booksuccess?.status == "1") {
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
