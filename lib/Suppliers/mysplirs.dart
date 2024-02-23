import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/Suppliers/AddNewSupplier.dart';
import 'package:wedding_planner/Suppliers/SupplierDetailsPage.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

import '../Modal/mySupplierModal.dart';
import '../widgets/load.dart';

class MySups extends StatefulWidget {
  MySups({super.key});

  @override
  State<MySups> createState() => _MySupsState();
}

TextEditingController _search = TextEditingController();
final GlobalKey<ScaffoldState> scaffoldKey25 = GlobalKey<ScaffoldState>();

class chat {
  String? image;
  String? name;
  String? type;
  String? date;
  String? details;

  chat(
    this.image,
    this.name,
    this.type,
    this.date,
    this.details,
  );
}

bool more = true;
bool isLoading = true;
int sel1 = 1;

class _MySupsState extends State<MySups> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      sel1 = 1;
      isLoading = true;
    });
    homeap();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey.shade100,
        drawer: drawer1(),
        key: scaffoldKey25,
        body: isLoading
            ? Container()
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      header(
                          text: "My Suppliers",
                          callback1: () {
                            scaffoldKey25.currentState?.openDrawer();
                          }),
                      // headerwid(text: "All Suppliers"),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(RequestSupplier());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 5.h,
                              width: 52.w,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(90)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                  Text(
                                    'Request Supplier',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          PopupMenuButton(
                            elevation: 00,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(10)),
                            icon: Icon(Icons.filter_alt_outlined,
                                color: Colors.blue, size: 22.sp),
                            itemBuilder: (context) {
                              return <PopupMenuEntry>[
                                PopupMenuItem(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            height: 60.h,
                                            child: AlertDialog(
                                                backgroundColor:
                                                    Colors.grey.shade100,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    side: BorderSide(
                                                        color: Colors.white)),
                                                title: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Select Supplier type',
                                                          style: TextStyle(
                                                              fontFamily: "pop",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 15.sp,
                                                              letterSpacing: 1,
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                          child: Icon(
                                                              Icons.close,
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 1.h),
                                                    Divider()
                                                  ],
                                                ),
                                                // content: categoryandfilter
                                                //     ?.workertypeModel
                                                //     ?.length ==
                                                //     0 ||
                                                //     categoryandfilter
                                                //         ?.workertypeModel
                                                //         ?.length ==
                                                //         null ||
                                                //     categoryandfilter
                                                //         ?.workertypeModel ==
                                                //         null
                                                //     ? Container(
                                                //   height: 25.h,
                                                //   alignment:
                                                //   Alignment.center,
                                                //   child: Text(
                                                //     "No Work types Available",
                                                //     style: TextStyle(
                                                //         fontFamily:
                                                //         "pop",
                                                //         fontSize: 14.sp,
                                                //         color: Colors
                                                //             .black),
                                                //   ),
                                                // )
                                                //     :

                                                content: SizedBox(
                                                  height: 25.h,
                                                  width: 95.w,
                                                  child: GridView.builder(
                                                    padding: EdgeInsets.zero,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                            childAspectRatio:
                                                                10 / 4.5,
                                                            crossAxisCount: 2),
                                                    itemCount: 10,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return InkWell(
                                                        onTap: () {},
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 1.w,
                                                                  horizontal:
                                                                      1.w),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      0.5.h,
                                                                  horizontal:
                                                                      1.w),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          child: Text(
                                                            'Supplier Type ${index + 1}',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                letterSpacing:
                                                                    1,
                                                                fontFamily:
                                                                    'pop'),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                )),
                                          );
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Supplier Type',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 13.sp,
                                        fontFamily: 'sofi',
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2,
                                      ),
                                    )),
                              ];
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h),
                      mysupps?.suppliersDetails?.length == 0 ||
                              mysupps?.suppliersDetails?.length == null
                          ? Container(
                              height: 80.h,
                              alignment: Alignment.center,
                              child: Text(
                                "No Suppliers Available",
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontFamily: 'sofi',
                                    color: Colors.black),
                              ),
                            )
                          : Container(
                              height: more ? 50.5.h : 71.h,
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: more
                                    ? (mysupps?.suppliersDetails?.length ??
                                                0) <=
                                            3
                                        ? mysupps?.suppliersDetails?.length
                                        : 3
                                    : mysupps?.suppliersDetails?.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.w, vertical: 2.h),
                                    margin:
                                        EdgeInsets.symmetric(vertical: 0.5.h),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            // Color of the shadow
                                            offset: Offset(0.2, 0.5),

                                            blurRadius:
                                                2, // Spread of the shadow
                                            // How much the shadow extends
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 1.w),
                                              height: 22.w,
                                              width: 22.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(90),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl: mysupps
                                                          ?.suppliersDetails?[
                                                              index]
                                                          .profile ??
                                                      "",
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                              progress) =>
                                                          CircularProgressIndicator(),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Image.asset(
                                                    'assets/user.png',
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  mysupps
                                                                  ?.suppliersDetails?[
                                                                      index]
                                                                  .services
                                                                  ?.category
                                                                  ?.categoryName ==
                                                              '' ||
                                                          mysupps
                                                                  ?.suppliersDetails?[
                                                                      index]
                                                                  .services
                                                                  ?.category
                                                                  ?.categoryName ==
                                                              null
                                                      ? 'N/A'
                                                      : mysupps
                                                              ?.suppliersDetails?[
                                                                  index]
                                                              .services
                                                              ?.category
                                                              ?.categoryName ??
                                                          "",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 1,
                                                      fontFamily: 'sofi',
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                SizedBox(
                                                  width: 55.w,
                                                  child: Text(
                                                    mysupps
                                                                    ?.suppliersDetails?[
                                                                        index]
                                                                    .name ==
                                                                '' ||
                                                            mysupps
                                                                    ?.suppliersDetails?[
                                                                        index]
                                                                    .name ==
                                                                null
                                                        ? 'N/A'
                                                        : mysupps
                                                                ?.suppliersDetails?[
                                                                    index]
                                                                .name ??
                                                            "",
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'sofi',
                                                      color: Colors.black
                                                          .withOpacity(0.75),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Center(
                                                  child: InkWell(
                                                    onTap: () {
                                                      Get.to(SupplierfourScreen(
                                                        suppid: mysupps
                                                            ?.suppliersDetails?[
                                                                index]
                                                            .id,
                                                        catid: mysupps
                                                            ?.suppliersDetails?[
                                                                index]
                                                            .services
                                                            ?.category
                                                            ?.categoryId,
                                                        service: mysupps
                                                            ?.suppliersDetails?[
                                                                index]
                                                            .services
                                                            ?.category
                                                            ?.categoryName,
                                                      ));
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 4.5.h,
                                                      width: 38.w,
                                                      decoration: BoxDecoration(
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      90)),
                                                      child: Text(
                                                        'View Details',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 13.sp,
                                                          fontFamily: 'sofi',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          letterSpacing: 2,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                      SizedBox(height: 1.2.h),
                      mysupps?.suppliersDetails?.length == 0 ||
                              mysupps?.suppliersDetails?.length == null
                          ? Container()
                          : (mysupps?.suppliersDetails?.length ?? 0) <= 3
                              ? Container()
                              : Center(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        more = !more;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 5.h,
                                      width: 38.w,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(90)),
                                      child: Text(
                                        more ? 'View More' : 'View Less',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.sp,
                                          fontFamily: 'sofi',
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                      SizedBox(height: 3.h),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  homeap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().Mysups().then((response) async {
          mysupps = MySuppliersModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && mysupps?.status == "1") {
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
