import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

import '../Modal/DeleteRequestedSupplierModal.dart';
import '../Modal/ReusestViewSuppliersModal.dart';
import '../widgets/load.dart';
import 'AddNewSupplier.dart';
import 'UpdateSuppilersScreen.dart';

class ReqestventSupplierscreen extends StatefulWidget {
  int? sele;

  ReqestventSupplierscreen({
    super.key,
    required this.sele,
  });

  @override
  State<ReqestventSupplierscreen> createState() =>
      _ReqestventSupplierscreenState();
}

final GlobalKey<ScaffoldState> scaffoldKey23 = GlobalKey<ScaffoldState>();
TextEditingController _search = TextEditingController();

bool more = true;
bool isLoading = true;

class _ReqestventSupplierscreenState extends State<ReqestventSupplierscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // homeap();
    setState(() {
      isLoading = true;
      more = true;
    });
    resuetsviewsuppliers();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey.shade100,
        drawer: drawer1(),
        key: scaffoldKey23,
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
                          text: "Requested Suppliers",
                          callback1: () {
                            scaffoldKey23.currentState?.openDrawer();
                          }),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                        ],
                      ),
                      SizedBox(height: 1.h),
                      reusestviewsuppliersmodal?.suppliers?.length == 0 ||
                              reusestviewsuppliersmodal?.suppliers?.length ==
                                  null
                          ? Container(
                              height: 100.h,
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
                              height:  80.h,
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: reusestviewsuppliersmodal
                                        ?.suppliers?.length,
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
                                                  imageUrl:
                                                      reusestviewsuppliersmodal
                                                              ?.suppliers?[
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  (reusestviewsuppliersmodal
                                                                  ?.suppliers?[
                                                                      index]
                                                                  .name) ==
                                                              "" ||
                                                          (reusestviewsuppliersmodal
                                                                  ?.suppliers?[
                                                                      index]
                                                                  .name) ==
                                                              null
                                                      ? "N/A"
                                                      : (reusestviewsuppliersmodal
                                                              ?.suppliers?[
                                                                  index]
                                                              .name)
                                                          .toString(),
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                                    (reusestviewsuppliersmodal
                                                                    ?.suppliers?[
                                                                        index]
                                                                    .description) ==
                                                                "" ||
                                                            (reusestviewsuppliersmodal
                                                                    ?.suppliers?[
                                                                        index]
                                                                    .description) ==
                                                                null
                                                        ? "N/A"
                                                        : (reusestviewsuppliersmodal
                                                                ?.suppliers?[
                                                                    index]
                                                                .description)
                                                            .toString(),
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      height: 1.3,
                                                      fontSize: 14.sp,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: 'sofi',
                                                      color: Colors.black
                                                          .withOpacity(0.75),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Get.to(
                                                            UpdateSuppilersScreen(
                                                          suppid:
                                                              (reusestviewsuppliersmodal
                                                                      ?.suppliers?[
                                                                          index]
                                                                      .id)
                                                                  .toString(),
                                                          catid: (reusestviewsuppliersmodal
                                                                  ?.suppliers?[
                                                                      index]
                                                                  .categoryId)
                                                              .toString(),
                                                        ));
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 4.5.h,
                                                        width: 22.w,
                                                        decoration: BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        90)),
                                                        child: Text(
                                                          'Edit',
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
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        deletesuppilers(
                                                          (reusestviewsuppliersmodal
                                                                  ?.suppliers?[
                                                                      index]
                                                                  .id)
                                                              .toString(),
                                                        );
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 4.5.h,
                                                        width: 22.w,
                                                        decoration: BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        90)),
                                                        child: Text(
                                                          'Delete',
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
                                                  ],
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
                      reusestviewsuppliersmodal?.suppliers?.length == 0 ||
                              categorywisesuppliersmodal?.suppliers?.length ==
                                  null
                          ? Container()
                          : (reusestviewsuppliersmodal?.suppliers?.length ??
                                      0) <=
                                  4
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
                      SizedBox(height: 2.h),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  resuetsviewsuppliers() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().restetsuppliersviewapi().then((response) async {
          reusestviewsuppliersmodal =
              ReusestViewSuppliersModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              reusestviewsuppliersmodal?.status == "1") {
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

  deletesuppilers(String value) {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider()
            .deletesuppliersresuestapi(value.toString())
            .then((response) async {
          deleterequestedsuppliermodal =
              DeleteRequestedSupplierModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              deleterequestedsuppliermodal?.status == "1") {
            resuetsviewsuppliers();
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
