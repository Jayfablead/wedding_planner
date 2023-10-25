import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../../widgets/drawer.dart';
import '../Modal/BookingListModal.dart';
import 'BookingDetailsPage.dart';

class BookingList extends StatefulWidget {
  const BookingList({super.key});

  @override
  State<BookingList> createState() => _BookingListState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class icon {
  String? image;
  String? name;
  String? price;

  icon(
    this.image,
    this.name,
    this.price,
  );
}

List<icon> Icns = [
  icon('https://cdn-icons-png.flaticon.com/512/4474/4474469.png', 'Venue',
      '2500'),
  icon(
      'https://www.seekpng.com/png/full/41-415194_set-menu-food-black-icon.png',
      'Food',
      '2500'),
  icon('https://cdn-icons-png.flaticon.com/512/2907/2907439.png', 'Drinks',
      '500'),
  icon(
      'https://cdn-icons-png.flaticon.com/512/1683/1683807.png', 'Cake', '500'),
  icon(
      'https://i.pinimg.com/originals/61/3a/4f/613a4f9d74d7efc8fb5fc28c8a63446c.png',
      'Rings',
      '500'),
  icon('https://static.thenounproject.com/png/639559-200.png', 'Ceremony',
      '1000'),
  icon('https://cdn-icons-png.flaticon.com/512/2956/2956744.png', 'Photos',
      '1000'),
  icon('https://cdn-icons-png.flaticon.com/512/6491/6491292.png', 'Transport',
      '1000'),
  icon('https://cdn-icons-png.flaticon.com/512/2706/2706309.png', 'Planners',
      '1000'),
];

class _BookingListState extends State<BookingList> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    booklinglistap();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
        drawer: drawer1(),
        key: scaffoldKey,
        body: isLoading
            ? Container()
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),

                          header(
                              text: "All Bookings",
                              callback1: () {
                                scaffoldKey.currentState?.openDrawer();
                              }),
                          // headerwid(text: "All Bookings"),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                      bookinglistmodal?.bookings?.length == 0 ||
                              bookinglistmodal?.bookings == null
                          ? Container(
                              height: 80.h,
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              child: Text(
                                "No booking added",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,fontFamily: 'sofi',
letterSpacing: 1,                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          : Column(
                              children: [
                                for (int index = 0;
                                    index <
                                        (bookinglistmodal?.bookings?.length ??
                                            0);
                                    index++) ...[
                                  Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Container(
                                        height: 18.h,
                                        padding: EdgeInsets.all(1.w),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 1.w),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 0.5.w),
                                              height: 16.h,
                                              width: 30.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl: bookinglistmodal
                                                          ?.bookings?[index]
                                                          .supplierDetails
                                                          ?.profile ??
                                                      "",
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                              progress) =>
                                                          Center(
                                                              child:
                                                                  CircularProgressIndicator()),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Image.asset(
                                                    'assets/user.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(
                                                  width: 54.w,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 1.w),
                                                        child: Text(
                                                          bookinglistmodal
                                                                          ?.bookings?[
                                                                              index]
                                                                          .supplierDetails
                                                                          ?.name ==
                                                                      '' ||
                                                                  bookinglistmodal
                                                                          ?.bookings?[
                                                                              index]
                                                                          .supplierDetails
                                                                          ?.name ==
                                                                      null
                                                              ? 'N/A'
                                                              : bookinglistmodal
                                                                      ?.bookings?[
                                                                          index]
                                                                      .supplierDetails
                                                                      ?.name ??
                                                                  "",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 1.w),
                                                  width: 55.w,
                                                  child: Text(
                                                    bookinglistmodal
                                                                    ?.bookings?[
                                                                        index]
                                                                    .supplierDetails
                                                                    ?.description ==
                                                                '' ||
                                                            bookinglistmodal
                                                                    ?.bookings?[
                                                                        index]
                                                                    .supplierDetails
                                                                    ?.description ==
                                                                null
                                                        ? 'N/A'
                                                        : bookinglistmodal
                                                                ?.bookings?[
                                                                    index]
                                                                .supplierDetails
                                                                ?.description ??
                                                            "",
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.7),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: 11.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      size: 15.sp,
                                                      color: Colors.black
                                                          .withOpacity(0.8),
                                                    ),
                                                    SizedBox(
                                                      width: 1.w,
                                                    ),
                                                    Text(
                                                      bookinglistmodal
                                                                      ?.bookings?[
                                                                          index]
                                                                      .supplierDetails
                                                                      ?.address ==
                                                                  '' ||
                                                              bookinglistmodal
                                                                      ?.bookings?[
                                                                          index]
                                                                      .supplierDetails
                                                                      ?.address ==
                                                                  null
                                                          ? 'N/A'
                                                          : bookinglistmodal
                                                                  ?.bookings?[
                                                                      index]
                                                                  .supplierDetails
                                                                  ?.address ??
                                                              "",
                                                      style: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.8),
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 1.h),
                                                SizedBox(
                                                  width: 55.w,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Get.to(
                                                              ViewBookingDetailsPage(
                                                            bId:
                                                                bookinglistmodal
                                                                    ?.bookings?[
                                                                        index]
                                                                    .id,
                                                          ));
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      3.w,
                                                                  vertical:
                                                                      1.3.h),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.blue,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          90)),
                                                          child: Text(
                                                            'View Details',
                                                            style: TextStyle(
                                                                fontSize: 11.sp,
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'sofi',
                                                                letterSpacing:
                                                                    1,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                  ),
                                ]
                              ],
                            ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  booklinglistap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().bookinglistapi().then((response) async {
          bookinglistmodal =
              BookinglistModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && unreadnotimodal?.status == "1") {
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
