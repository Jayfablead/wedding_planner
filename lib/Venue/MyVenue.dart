import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/VenuedetailModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../widgets/headerwidget.dart';

class VenueView extends StatefulWidget {
  const VenueView({super.key});

  @override
  State<VenueView> createState() => _VenueViewState();
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

class _VenueViewState extends State<VenueView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
      ind = 0;
    });
    venueap();
  }

  bool isLoading = true;
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
                                text: "Venue Profile",
                                callback1: () {
                                  scaffoldKey27.currentState?.openDrawer();
                                }),
                            SizedBox(height: 1.h),
                            Container(
                              height: 28.w,
                              width: 28.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      venuedetail?.venueDetails?.profile ?? "",
                                  progressIndicatorBuilder:
                                      (context, url, progress) =>
                                          CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    'assets/user.png',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
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
                                                        Icons.person,
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
                                                            venuedetail?.venueDetails
                                                                            ?.vName ==
                                                                        "" ||
                                                                    venuedetail
                                                                            ?.venueDetails
                                                                            ?.vName ==
                                                                        null
                                                                ? "N/A"
                                                                : venuedetail
                                                                        ?.venueDetails
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
                                                  'Venue Email : ',
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
                                                    venuedetail?.venueDetails
                                                                    ?.email ==
                                                                "" ||
                                                            venuedetail
                                                                    ?.venueDetails
                                                                    ?.email ==
                                                                null
                                                        ? "N/A"
                                                        : venuedetail
                                                                ?.venueDetails
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
                                                Icons.home,
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
                                                Text(
                                                  venuedetail?.venueDetails
                                                                  ?.address ==
                                                              "" ||
                                                          venuedetail
                                                                  ?.venueDetails
                                                                  ?.address ==
                                                              null
                                                      ? "N/A"
                                                      : venuedetail
                                                              ?.venueDetails
                                                              ?.address ??
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
                                                  venuedetail?.venueDetails
                                                                  ?.contact ==
                                                              '' ||
                                                          venuedetail
                                                                  ?.venueDetails
                                                                  ?.contact ==
                                                              null
                                                      ? 'N/A'
                                                      : venuedetail
                                                              ?.venueDetails
                                                              ?.contact ??
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
                                                Icons.email_outlined,
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
                                                Text(
                                                  venuedetail?.venueDetails
                                                                  ?.coupleEmail ==
                                                              "" ||
                                                          venuedetail
                                                                  ?.venueDetails
                                                                  ?.coupleEmail ==
                                                              null
                                                      ? "N/A"
                                                      : venuedetail
                                                              ?.venueDetails
                                                              ?.coupleEmail ??
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
}
