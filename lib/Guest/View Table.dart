import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/GuestseatingModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/main.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

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
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewguestap();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey.shade100,
        key: scaffoldKey,
        drawer: drawer1(),
        bottomNavigationBar: bottomnavbar(selit: -3),
        body: isLoading
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Column(
                  children: [
                    SizedBox(height: 5.h),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     IconButton(
                    //         onPressed: () {
                    //           Get.back();
                    //         },
                    //         icon: Icon(
                    //           Icons.arrow_back_ios_new_rounded,
                    //           color: Colors.blue,
                    //           size: 23.sp,
                    //         )),
                    //     Text(
                    //       'Guests',
                    //       style: TextStyle(
                    //           fontSize: 17.sp,
                    //           fontFamily: 'sofi',
                    //           fontWeight: FontWeight.bold,
                    //           letterSpacing: 1,
                    //           color: Colors.blue),
                    //     ),
                    //     IconButton(
                    //         onPressed: () {
                    //           scaffoldKey.currentState?.openDrawer();
                    //         },
                    //         icon: Icon(
                    //           Icons.menu_rounded,
                    //           color: Colors.blue,
                    //           size: 23.sp,
                    //         )),
                    //   ],
                    // ),
                    header(
                        text: "Guests",
                        callback1: () {
                          scaffoldKey.currentState?.openDrawer();
                        }),
                    // headerwid(text: "Guests"),
                    SizedBox(height: 3.h),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     InkWell(
                    //       onTap: () {
                    //         setState(() {
                    //           sel1 = 1;
                    //         });
                    //       },
                    //       child: Container(
                    //         padding:
                    //             EdgeInsets.symmetric(vertical: 1.3.h, horizontal: 10.w),
                    //         alignment: Alignment.center,
                    //         decoration: BoxDecoration(
                    //             color: sel1 == 1 ? Colors.blue : Colors.white,
                    //             borderRadius: BorderRadius.circular(25)),
                    //         margin: EdgeInsets.symmetric(horizontal: 2.w),
                    //         child: Text('Bride',
                    //             style: TextStyle(
                    //                 fontSize: 14.5.sp,
                    //                 fontFamily: 'sofi',
                    //                 color: sel1 == 1 ? Colors.white : Colors.blue,
                    //                 fontWeight: FontWeight.bold,
                    //                 letterSpacing: 1)),
                    //       ),
                    //     ),
                    //     SizedBox(width: 0.w),
                    //     InkWell(
                    //       onTap: () {
                    //         setState(() {
                    //           sel1 = 2;
                    //         });
                    //       },
                    //       child: Container(
                    //         padding:
                    //             EdgeInsets.symmetric(vertical: 1.3.h, horizontal: 10.w),
                    //         alignment: Alignment.center,
                    //         decoration: BoxDecoration(
                    //             color: sel1 == 2 ? Colors.blue : Colors.white,
                    //             borderRadius: BorderRadius.circular(25)),
                    //         margin: EdgeInsets.symmetric(horizontal: 2.w),
                    //         child: Text('Groom',
                    //             style: TextStyle(
                    //                 fontSize: 14.5.sp,
                    //                 fontFamily: 'sofi',
                    //                 color: sel1 == 2 ? Colors.white : Colors.blue,
                    //                 fontWeight: FontWeight.bold,
                    //                 letterSpacing: 1)),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 1.5.h),
                    guestseatingmodal?.suppliersDetails?.length == 0 || guestseatingmodal?.suppliersDetails?.length == null ?Container(
                      height: 65.h,
                      alignment: Alignment.center,
                      child: Text(
                        "No Tables Available",
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontFamily: 'sofi',
                            color: Colors.black),
                      ),
                    ): Column(
                      children: [
                        for (int index = 0;
                            index <
                                (guestseatingmodal?.suppliersDetails?.length ??
                                    0);
                            index++) ...[
                          Container(
                            // height: 7.h,
                            width: MediaQuery.of(context).size.width,

                            decoration: BoxDecoration(
                                color:
                                    open == index ? Colors.blue : Colors.white,
                                borderRadius: open == index
                                    ? BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))
                                    : BorderRadius.circular(20),
                                border: open != index
                                    ? Border.all(color: Colors.blue, width: 2)
                                    : Border.all(
                                        color: Colors.transparent, width: 2)),
                            padding: EdgeInsets.symmetric(
                                vertical: 1.5.h, horizontal: 3.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  guestseatingmodal?.suppliersDetails?[index]
                                      .table?.name==""||guestseatingmodal?.suppliersDetails?[index]
                                      .table?.name==null?"N/A":guestseatingmodal?.suppliersDetails?[index]
                                          .table?.name ??
                                      "",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'sofi',
                                    letterSpacing: 1,
                                    color: open == index
                                        ? Colors.white
                                        : Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      open = index;
                                    });
                                  },
                                  child: Icon(
                                      Icons.arrow_drop_down_circle_outlined,
                                      color: open == index
                                          ? Colors.white
                                          : Colors.blue),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          open == index
                              ? Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(3.w),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          // Row(
                                          //   children: [
                                          //     Icon(
                                          //       Icons.circle_outlined,
                                          //       color: Colors.grey.shade600,
                                          //     ),
                                          //     SizedBox(
                                          //       width: 3.w,
                                          //     ),
                                          //     Text(
                                          //      guestseatingmodal?.suppliersDetails?[index].,
                                          //       style: TextStyle(
                                          //         fontSize: 16.sp,
                                          //         fontFamily: 'sofi',
                                          //         letterSpacing: 1,
                                          //         color: Colors.blue,
                                          //         fontWeight: FontWeight.bold,
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                          // SizedBox(
                                          //   height: 1.h,
                                          // ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3.w),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.circle_outlined,
                                                  color: Colors.grey.shade600,
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Text(
                                                  "Available Seats " +
                                                      (int.parse((guestseatingmodal
                                                                      ?.suppliersDetails?[
                                                                          index]
                                                                      .table
                                                                      ?.capacity)
                                                                  .toString()) -
                                                              int.parse((guestseatingmodal
                                                                      ?.suppliersDetails?[
                                                                          index]
                                                                      .guestList
                                                                      ?.length)
                                                                  .toString()))
                                                          .toString() +
                                                      " out of " +
                                                      (guestseatingmodal
                                                              ?.suppliersDetails?[
                                                                  index]
                                                              .table
                                                              ?.capacity)
                                                          .toString(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.sp,
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
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                for (int index1 = 0;
                                                    index1 <
                                                        (guestseatingmodal
                                                                ?.suppliersDetails?[
                                                                    index]
                                                                .guestList
                                                                ?.length ??
                                                            0);
                                                    index1++) ...[
                                                  Text(
                                                    (index1 + 1).toString() +
                                                        " . " +
                                                        (guestseatingmodal
                                                                ?.suppliersDetails?[
                                                                    index]
                                                                .guestList?[
                                                                    index1]
                                                                .guestName)
                                                            .toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12.sp,
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  SizedBox(height: 1.h),
                                                ]
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
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
      ),
    );
  }

  viewguestap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().guestseatingapi().then((response) async {
          guestseatingmodal =
              GuestseatingModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && guestseatingmodal?.status == "1") {
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
