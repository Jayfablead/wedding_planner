import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../Modal/VenuedetailModal.dart';
import '../Provider/taskprovider.dart';
import '../widgets/buildErrorDialog.dart';
import '../widgets/const.dart';
import '../widgets/headerwidget.dart';

class VenueDetailsview extends StatefulWidget {
  const VenueDetailsview({super.key});

  @override
  State<VenueDetailsview> createState() => _VenueDetailsviewState();
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

class _VenueDetailsviewState extends State<VenueDetailsview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      ind = 0;
      isLoading = true;
    });
    venueap();
    // floordetelisapiwedding();
  }

  // bool isLoading = true;
  CarouselController _controller = CarouselController();

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
                                text: "Venue Details",
                                callback1: () {
                                  scaffoldKey27.currentState?.openDrawer();
                                }),
                            SizedBox(height: 1.h),
                            Padding(
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
                                                        CupertinoIcons.home,
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
                                                          'Venue Name : ',
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
                                                            venuedetail?.venueDetails?.moreInfo
                                                                            ?.vName ==
                                                                        '' ||
                                                                    venuedetail
                                                                            ?.venueDetails
                                                                            ?.moreInfo
                                                                            ?.vName ==
                                                                        null
                                                                ? 'N/A'
                                                                : venuedetail
                                                                        ?.venueDetails
                                                                        ?.moreInfo
                                                                        ?.vName ??
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
                                        ],
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
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
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
                                                        CupertinoIcons.person,
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
                                                          'Venue Owner Name : ',
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
                                                            venuedetail?.venueDetails
                                                                            ?.name ==
                                                                        '' ||
                                                                    venuedetail
                                                                            ?.venueDetails
                                                                            ?.name ==
                                                                        null
                                                                ? 'N/A'
                                                                : venuedetail
                                                                        ?.venueDetails
                                                                        ?.name ??
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
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.5.h),
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
                                                Icons.location_on_outlined,
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
                                                  'Venue Address : ',
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
                                                    venuedetail
                                                                    ?.venueDetails
                                                                    ?.moreInfo
                                                                    ?.address ==
                                                                '' ||
                                                            venuedetail
                                                                    ?.venueDetails
                                                                    ?.moreInfo
                                                                    ?.address ==
                                                                null
                                                        ? 'N/A'
                                                        : venuedetail
                                                                ?.venueDetails
                                                                ?.moreInfo
                                                                ?.address ??
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
                                                CupertinoIcons.info,
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
                                                  'Description : ',
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
                                                    venuedetail
                                                                    ?.venueDetails
                                                                    ?.moreInfo
                                                                    ?.vDetails ==
                                                                '' ||
                                                            venuedetail
                                                                    ?.venueDetails
                                                                    ?.moreInfo
                                                                    ?.vDetails ==
                                                                null
                                                        ? 'N/A'
                                                        : venuedetail
                                                                ?.venueDetails
                                                                ?.moreInfo
                                                                ?.vDetails ??
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
                                  SizedBox(height: 2.5.h),
                                ],
                              ),
                            ),
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

  venueap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().venuedeatilapi().then((response) async {
          venuedetail = VenuedetailModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && venuedetail?.status == "1") {
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
// venueap() {
//   checkInternet().then((internet) async {
//     if (internet) {
//       taskprovider().venuedeatilapi().then((response) async {
//         venuedetail = VenuedetailModal.fromJson(json.decode(response.body));
//         if (response.statusCode == 200 && venuedetail?.status == "1") {
//           setState(() {
//             isLoading = false;
//           });
//         } else {
//           setState(() {
//             isLoading = false;
//           });
//         }
//       });
//     } else {
//       buildErrorDialog(context, 'Error', "Internet Required");
//     }
//   });
// }
//
// floordetelisapiwedding() {
//   checkInternet().then((internet) async {
//     if (internet) {
//       taskprovider().floordetelisapi().then((response) async {
//         floordetalismodal =
//             FloorDetalisModal.fromJson(json.decode(response.body));
//         if (response.statusCode == 200 && floordetalismodal?.status == "1") {
//           setState(() {
//             isLoading = false;
//           });
//         } else {
//           setState(() {
//             isLoading = false;
//           });
//         }
//       });
//     } else {
//       buildErrorDialog(context, 'Error', "Internet Required");
//     }
//   });
// }
}
