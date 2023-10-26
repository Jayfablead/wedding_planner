import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/CheckListModal.dart';
import 'package:wedding_planner/Modal/SearchCheckListModal.dart';
import 'package:wedding_planner/Modal/addchecklistmodal.dart';
import 'package:wedding_planner/Modal/removetodoModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../Modal/markcompletedmodal.dart';

class Check_list extends StatefulWidget {
  const Check_list({super.key});

  @override
  State<Check_list> createState() => _Check_listState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

bool ischeck = false;

class checklist {
  String? title;
  bool? chek;

  checklist(
    this.title,
    this.chek,
  );
}

// List<checklist> lists = [
//   checklist('Make All Bookings Page', true),
//   checklist('Change Signup Page', false),
//   checklist('Make All Certificates Page', true),
//   checklist('Make All itinerary Page', false),
//   checklist('Make All Budget Page', true),
//   checklist('Make All Parcels received', false),
//   checklist('Make All Notifications Page', false),
//   checklist('Make All Bookings Page', true),
//   checklist('Change Signup Page', false),
//   checklist('Make All Certificates Page', true),
//   checklist('Make All itinerary Page', false),
//   checklist('Make All Budget Page', true),
//   checklist('Make All Parcels received', false),
//   checklist('Make All Notifications Page', false),
//   checklist('Make All Bookings Page', true),
//   checklist('Change Signup Page', false),
//   checklist('Make All Certificates Page', true),
//   checklist('Make All itinerary Page', false),
//   checklist('Make All Budget Page', true),
//   checklist('Make All Parcels received', false),
//   checklist('Make All Notifications Page', false),
// ];

class _Check_listState extends State<Check_list> {
  TextEditingController _search = TextEditingController();
  bool isLoading = true;
  int? sel1 = 0;
  int? val;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checklistap();
  }

  TextEditingController _title = TextEditingController();
  TextEditingController _desc = TextEditingController();
  TextEditingController _cate = TextEditingController();
  TextEditingController _start = TextEditingController();
  TextEditingController _date = TextEditingController();
  final formKey = GlobalKey<FormState>();

  List<String> type = ["All", "Today Alert", "Completed", "Pending"];

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        key: scaffoldKey,
        drawer: drawer1(),
        body: isLoading
            ? Container()
            : SingleChildScrollView(
                child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 100.h,
                        child: Column(children: [
                          SizedBox(
                            height: 5.5.h,
                          ),
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
                          //           size: 23.sp,
                          //           color: Colors.blue,
                          //         )),
                          //     Text(
                          //       "Check List",
                          //       style: TextStyle(
                          //         fontSize: 18.sp,
                          //         fontFamily: 'sofi',
                          //         letterSpacing: 1,
                          //         color: Colors.blue,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //     Row(
                          //       crossAxisAlignment: CrossAxisAlignment.center,
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         IconButton(
                          //             onPressed: () {
                          //               Get.to(NotificationScreen());
                          //             },
                          //             icon: Icon(
                          //               Icons.notifications_none_rounded,
                          //               color: Colors.blue,
                          //               size: 21.sp,
                          //             )),
                          //         IconButton(
                          //             onPressed: () {
                          //               scaffoldKey.currentState?.openDrawer();
                          //             },
                          //             icon: Icon(
                          //               Icons.menu_rounded,
                          //               color: Colors.blue,
                          //               size: 23.sp,
                          //             )),
                          //       ],
                          //     )
                          //   ],
                          // ),
                          header(
                              text: "Check List",
                              callback1: () {
                                scaffoldKey.currentState?.openDrawer();
                              }),
                          // headerwid(text: "Check List"),
                          SizedBox(height: 1.h),
                          searchBox1(),
                          SizedBox(height: 2.h),
                          _search.text == ''
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 4.5.h,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              sel1 = index;
                                            });
                                            checklistap();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.h, horizontal: 5.w),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: sel1 == index
                                                    ? Colors.blue
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2.w),
                                            child: Text(type[index],
                                                style: TextStyle(
                                                    fontSize: 14.5.sp,
                                                    fontFamily: 'sofi',
                                                    color: sel1 == index
                                                        ? Colors.white
                                                        : Colors.blue,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 1)),
                                          ),
                                        );
                                      }),
                                )
                              : Container(),
                          _search.text == ''
                              ? SizedBox(height: 2.h)
                              : SizedBox(),
                          _search.text == ''
                              ? sel1 == 0
                                  ? checklistmodal?.all?.length == 0 ||
                                          checklistmodal?.all?.length == null
                                      ? Container(
                                          alignment: Alignment.center,
                                          height: 60.h,
                                          child: Text(
                                            "No Checklist Added",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontFamily: 'sofi',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ))
                                      : Container(
                                          height: 63.h,
                                          child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            itemCount:
                                                (checklistmodal?.all?.length),
                                            itemBuilder: (context, index) {
                                              return Container(
                                                child: Card(
                                                  elevation: 2,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical: checklistmodal
                                                                    ?.all?[
                                                                        index]
                                                                    .isCompleted ==
                                                                "1"
                                                            ? 2.h
                                                            : 1.h,
                                                        horizontal: 1.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                val = checklistmodal
                                                                            ?.all?[index]
                                                                            .isCompleted ==
                                                                        "1"
                                                                    ? 0
                                                                    : 1;
                                                              });
                                                              checklistmodal
                                                                          ?.all?[
                                                                              index]
                                                                          .isCompleted ==
                                                                      "1"
                                                                  ? null
                                                                  : markreadap(
                                                                      val,
                                                                      checklistmodal
                                                                          ?.all?[
                                                                              index]
                                                                          .id);
                                                            },
                                                            child: (checklistmodal
                                                                        ?.all?[
                                                                            index]
                                                                        .isCompleted ==
                                                                    "1")
                                                                ? Icon(
                                                                    Icons
                                                                        .check_box_rounded,
                                                                    color: Colors
                                                                        .blue,
                                                                    size: 22.sp,
                                                                  )
                                                                : Icon(
                                                                    Icons
                                                                        .check_box_outline_blank_rounded,
                                                                    color: Colors
                                                                        .black54,
                                                                    size: 22.sp,
                                                                  )),
                                                        SizedBox(width: 3.w),
                                                        Container(
                                                          width: 65.w,
                                                          child: Text(
                                                            (checklistmodal
                                                                ?.all?[
                                                            index]
                                                                .taskTitle)==""||(checklistmodal
                                                                  ?.all?[
                                                              index]
                                                                  .taskTitle)==null?"N/A":(checklistmodal
                                                                    ?.all?[
                                                                        index]
                                                                    .taskTitle)
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: (checklistmodal
                                                                            ?.all?[
                                                                                index]
                                                                            .isCompleted ==
                                                                        "1"
                                                                    ? Colors
                                                                        .blue
                                                                    : Colors
                                                                        .black87),
                                                                decoration: (checklistmodal
                                                                            ?.all?[
                                                                                index]
                                                                            .isCompleted ==
                                                                        "1"
                                                                    ? TextDecoration
                                                                        .lineThrough
                                                                    : TextDecoration
                                                                        .none),
                                                                decorationColor:
                                                                    Colors.blue,
                                                                decorationThickness:
                                                                    2,
                                                                fontSize: 13.sp,
                                                                fontFamily:
                                                                    'sofi',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ),
                                                        checklistmodal
                                                                    ?.all?[
                                                                        index]
                                                                    .isCompleted ==
                                                                "1"
                                                            ? Container()
                                                            : IconButton(
                                                                onPressed: () {
                                                                  delet(checklistmodal
                                                                      ?.all?[
                                                                          index]
                                                                      .id);
                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .delete_forever,
                                                                  color: Colors
                                                                      .red,
                                                                ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                  : sel1 == 1
                                      ? checklistmodal?.todayAlerts?.length ==
                                                  0 ||
                                              checklistmodal
                                                      ?.todayAlerts?.length ==
                                                  null
                                          ? Container(
                                              alignment: Alignment.center,
                                              height: 60.h,
                                              child: Text(
                                                "No Checklist Added",
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontFamily: 'sofi',
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ))
                                          : Container(
                                              height: 63.h,
                                              child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: (checklistmodal
                                                    ?.todayAlerts?.length),
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    child: Card(
                                                      elevation: 2,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 1.h,
                                                                horizontal:
                                                                    1.w),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    val = checklistmodal?.todayAlerts?[index].isCompleted ==
                                                                            "1"
                                                                        ? 0
                                                                        : 1;
                                                                  });
                                                                  markreadap(
                                                                      val,
                                                                      checklistmodal
                                                                          ?.todayAlerts?[
                                                                              index]
                                                                          .id);
                                                                },
                                                                child: (checklistmodal
                                                                            ?.todayAlerts?[index]
                                                                            .isCompleted ==
                                                                        "1")
                                                                    ? Icon(
                                                                        Icons
                                                                            .check_box_rounded,
                                                                        color: Colors
                                                                            .blue,
                                                                        size: 22
                                                                            .sp,
                                                                      )
                                                                    : Icon(
                                                                        Icons
                                                                            .check_box_outline_blank_rounded,
                                                                        color: Colors
                                                                            .black54,
                                                                        size: 22
                                                                            .sp,
                                                                      )),
                                                            SizedBox(
                                                                width: 3.w),
                                                            Container(
                                                              width: 65.w,
                                                              child: Text(
                                                                (checklistmodal
                                                                    ?.todayAlerts?[
                                                                index]
                                                                    .taskTitle)==""||(checklistmodal
                                                                    ?.todayAlerts?[
                                                                index]
                                                                    .taskTitle)==null?"N/A":(checklistmodal
                                                                        ?.todayAlerts?[
                                                                            index]
                                                                        .taskTitle)
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: (checklistmodal?.todayAlerts?[index].isCompleted == "1"
                                                                        ? Colors
                                                                            .blue
                                                                        : Colors
                                                                            .black87),
                                                                    decoration: (checklistmodal?.todayAlerts?[index].isCompleted == "1"
                                                                        ? TextDecoration
                                                                            .lineThrough
                                                                        : TextDecoration
                                                                            .none),
                                                                    decorationColor:
                                                                        Colors
                                                                            .blue,
                                                                    decorationThickness:
                                                                        2,
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontFamily:
                                                                        'sofi',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                            IconButton(
                                                                onPressed: () {
                                                                  delet(checklistmodal
                                                                      ?.todayAlerts?[
                                                                          index]
                                                                      .id);
                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .delete_forever,
                                                                  color: Colors
                                                                      .red,
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                      : sel1 == 2
                                          ? checklistmodal?.completed?.length ==
                                                      0 ||
                                                  checklistmodal
                                                          ?.completed?.length ==
                                                      null
                                              ? Container(
                                                  alignment: Alignment.center,
                                                  height: 60.h,
                                                  child: Text(
                                                    "No Checklist Added",
                                                    style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ))
                                              : Container(
                                                  alignment: Alignment.center,
                                                  height: 63.h,
                                                  child: ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    itemCount: checklistmodal
                                                        ?.completed?.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Container(
                                                        child: Card(
                                                          elevation: 2,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        2.h,
                                                                    horizontal:
                                                                        1.w),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                InkWell(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        val = checklistmodal?.completed?[index].isCompleted ==
                                                                                "1"
                                                                            ? 0
                                                                            : 1;
                                                                      });
                                                                    },
                                                                    child: (checklistmodal?.completed?[index].isCompleted ==
                                                                            "1")
                                                                        ? Icon(
                                                                            Icons.check_box_rounded,
                                                                            color:
                                                                                Colors.blue,
                                                                            size:
                                                                                22.sp,
                                                                          )
                                                                        : Icon(
                                                                            Icons.check_box_outline_blank_rounded,
                                                                            color:
                                                                                Colors.black54,
                                                                            size:
                                                                                22.sp,
                                                                          )),
                                                                SizedBox(
                                                                    width: 3.w),
                                                                Container(
                                                                  width: 78.w,
                                                                  child: Text(
                                                                    (checklistmodal
                                                                        ?.completed?[index]
                                                                        .taskTitle)==""||(checklistmodal
                                                                        ?.completed?[index]
                                                                        .taskTitle)==null?"N/A":(checklistmodal
                                                                            ?.completed?[index]
                                                                            .taskTitle)
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: (checklistmodal?.completed?[index].isCompleted ==
                                                                                "1"
                                                                            ? Colors
                                                                                .blue
                                                                            : Colors
                                                                                .black87),
                                                                        decoration: (checklistmodal?.completed?[index].isCompleted ==
                                                                                "1"
                                                                            ? TextDecoration
                                                                                .lineThrough
                                                                            : TextDecoration
                                                                                .none),
                                                                        decorationColor:
                                                                            Colors
                                                                                .blue,
                                                                        decorationThickness:
                                                                            2,
                                                                        fontSize: 13
                                                                            .sp,
                                                                        fontFamily:
                                                                            'sofi',
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                )
                                          : checklistmodal?.pending?.length ==
                                                      0 ||
                                                  checklistmodal
                                                          ?.pending?.length ==
                                                      null
                                              ? Container(
                                                  alignment: Alignment.center,
                                                  height: 60.h,
                                                  child: Text(
                                                    "No Checklist Added",
                                                    style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ))
                                              : Container(
                                                  height: 63.h,
                                                  child: ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    itemCount: checklistmodal
                                                        ?.pending?.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Container(
                                                        child: Card(
                                                          elevation: 2,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        1.h,
                                                                    horizontal:
                                                                        1.w),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      val = checklistmodal?.pending?[index].isCompleted ==
                                                                              "1"
                                                                          ? 0
                                                                          : 1;
                                                                    });
                                                                    markreadap(
                                                                        val,
                                                                        checklistmodal
                                                                            ?.pending?[index]
                                                                            .id);
                                                                  },
                                                                  child: checklistmodal
                                                                              ?.pending?[index]
                                                                              .isCompleted ==
                                                                          "1"
                                                                      ? Icon(
                                                                          Icons
                                                                              .check_box_rounded,
                                                                          color:
                                                                              Colors.blue,
                                                                          size:
                                                                              22.sp,
                                                                        )
                                                                      : Icon(
                                                                          Icons
                                                                              .check_box_outline_blank_rounded,
                                                                          color:
                                                                              Colors.black54,
                                                                          size:
                                                                              22.sp,
                                                                        ),
                                                                ),
                                                                SizedBox(
                                                                    width: 3.w),
                                                                Container(
                                                                  width: 65.w,
                                                                  child: Text(
                                                                    (checklistmodal
                                                                        ?.pending?[index]
                                                                        .taskTitle)==""||(checklistmodal
                                                                        ?.pending?[index]
                                                                        .taskTitle)==null?"N/A":(checklistmodal
                                                                            ?.pending?[index]
                                                                            .taskTitle)
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: (checklistmodal?.pending?[index].isCompleted ==
                                                                                "1"
                                                                            ? Colors
                                                                                .blue
                                                                            : Colors
                                                                                .black87),
                                                                        decoration: (checklistmodal?.pending?[index].isCompleted ==
                                                                                "1"
                                                                            ? TextDecoration
                                                                                .lineThrough
                                                                            : TextDecoration
                                                                                .none),
                                                                        decorationColor:
                                                                            Colors
                                                                                .blue,
                                                                        decorationThickness:
                                                                            2,
                                                                        fontSize: 13
                                                                            .sp,
                                                                        fontFamily:
                                                                            'sofi',
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ),
                                                                IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      delet(checklistmodal
                                                                          ?.pending?[
                                                                              index]
                                                                          .id);
                                                                    },
                                                                    icon: Icon(
                                                                      Icons
                                                                          .delete_forever,
                                                                      color: Colors
                                                                          .red,
                                                                    ))
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                )
                              : searchchecklist?.searched?.length == 0 ||
                                      searchchecklist?.searched?.length == null
                                  ? Container(
                                      alignment: Alignment.center,
                                      height: 60.h,
                                      child: Text(
                                        "No Checklist Found",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: 'sofi',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))
                                  : Container(
                                      height: 63.h,
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount:
                                            (searchchecklist?.searched?.length),
                                        itemBuilder: (context, index) {
                                          return Container(
                                            child: Card(
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: searchchecklist
                                                                ?.searched?[
                                                                    index]
                                                                .isCompleted ==
                                                            "1"
                                                        ? 2.h
                                                        : 1.h,
                                                    horizontal: 1.w),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            val = searchchecklist
                                                                        ?.searched?[
                                                                            index]
                                                                        .isCompleted ==
                                                                    "1"
                                                                ? 0
                                                                : 1;
                                                          });
                                                          searchchecklist
                                                                      ?.searched?[
                                                                          index]
                                                                      .isCompleted ==
                                                                  "1"
                                                              ? null
                                                              : markreadap(
                                                                  val,
                                                                  searchchecklist
                                                                      ?.searched?[
                                                                          index]
                                                                      .id);
                                                        },
                                                        child: (searchchecklist
                                                                    ?.searched?[
                                                                        index]
                                                                    .isCompleted ==
                                                                "1")
                                                            ? Icon(
                                                                Icons
                                                                    .check_box_rounded,
                                                                color:
                                                                    Colors.blue,
                                                                size: 22.sp,
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .check_box_outline_blank_rounded,
                                                                color: Colors
                                                                    .black54,
                                                                size: 22.sp,
                                                              )),
                                                    SizedBox(width: 3.w),
                                                    Container(
                                                      width: 65.w,
                                                      child: Text(
                                                        (searchchecklist
                                                            ?.searched?[
                                                        index]
                                                            .taskTitle)==""||(searchchecklist
                                                            ?.searched?[
                                                        index]
                                                            .taskTitle)==null?"N/A":(searchchecklist
                                                                ?.searched?[
                                                                    index]
                                                                .taskTitle)
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: (searchchecklist
                                                                        ?.searched?[
                                                                            index]
                                                                        .isCompleted ==
                                                                    "1"
                                                                ? Colors.blue
                                                                : Colors
                                                                    .black87),
                                                            decoration: (searchchecklist
                                                                        ?.searched?[
                                                                            index]
                                                                        .isCompleted ==
                                                                    "1"
                                                                ? TextDecoration
                                                                    .lineThrough
                                                                : TextDecoration
                                                                    .none),
                                                            decorationColor:
                                                                Colors.blue,
                                                            decorationThickness:
                                                                2,
                                                            fontSize: 13.sp,
                                                            fontFamily: 'sofi',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                    searchchecklist
                                                                ?.searched?[
                                                                    index]
                                                                .isCompleted ==
                                                            "1"
                                                        ? Container()
                                                        : IconButton(
                                                            onPressed: () {
                                                              delet(
                                                                  checklistmodal
                                                                      ?.all?[
                                                                          index]
                                                                      .id);
                                                            },
                                                            icon: Icon(
                                                              Icons
                                                                  .delete_forever,
                                                              color: Colors.red,
                                                            ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                        ]),
                      ),
                      Positioned(
                        top: 91.5.h,
                        left: 25.w,
                        child: InkWell(
                            onTap: () {
                              addcheklistdialog();
                              // Get.off(addchecklist());
                            },
                            child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(2.5.w),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Row(
                                  children: [
                                    Center(
                                        child: Icon(
                                      CupertinoIcons.add,
                                      size: 18.sp,
                                      color: Colors.white,
                                    )),
                                    Text(
                                      "Add Check List",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'sofi',
                                        letterSpacing: 1,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ))),
                      ),
                    ],
                  ),
                ),
              )),
      ),
    );
  }

  Widget checkdetails() {
    return Container(
      width: 80.w,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        // controller: _search,
        onChanged: (value) {},
        style: TextStyle(color: Colors.black, fontFamily: 'Meta1'),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Add Something',
          hintStyle: TextStyle(color: Colors.black, fontFamily: 'Meta1'),
        ),
      ),
    );
  }

  Widget searchBox1() {
    return Container(
      alignment: Alignment.center,
      width: 94.w,
      height: 6.5.h,
      padding: EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(65),
      ),
      child: TextField(
        controller: _search,
        onChanged: (value) {
          searchchecklistap();
        },
        style:
            TextStyle(color: Colors.black, fontSize: 13.sp, fontFamily: 'get'),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black.withOpacity(0.65),
            size: 25,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 35,
            minWidth: 40,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.65), fontFamily: 'get'),
        ),
      ),
    );
  }

  checklistap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().checklistapi().then((response) async {
          checklistmodal = CheckListModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && checklistmodal?.status == "1") {
            print(checklistmodal?.todayAlerts?[0].taskTitle);
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

  searchchecklistap() {
    final Map<String, String> data = {};
    data['search'] = _search.text.toString();
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().searchchecklistapi(data).then((response) async {
          searchchecklist =
              SearchCheckListModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && searchchecklist?.status == "1") {
            print(searchchecklist?.searched?[0].taskTitle);
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

  markreadap(value, id) {
    print("api");
    print(value);
    final Map<String, String> data = {};
    data['isCompleted'] = value.toString();
    print(data);

    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().markcompletedapi(data, id).then((response) async {
          markcompletemodal =
              MarkcompletedModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && markcompletemodal?.status == "1") {
            checklistap();
            searchchecklistap();
          } else {
            buildErrorDialog(
                context, "Login Error", (userData?.message).toString());
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  delet(id) {
    showModalBottomSheet(
      backgroundColor: Colors.grey.shade100,
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
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 3.h),
                    Text(
                      'Are You Sure You Want to Delete This Task ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'sofi',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          height: 0.17.h,
                          letterSpacing: 1),
                    ),
                    SizedBox(height: 3.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                  deleteap(id);
                                },
                                child: Container(
                                  width: 30.w,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(2.5.w),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontFamily: 'sofi',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  width: 30.w,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(2.5.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontFamily: 'sofi',
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
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
                    icon: Icon(CupertinoIcons.clear_circled_solid)))
          ],
        );
      },
    );
  }

  deleteap(id) {
    print("api");
    print(id);

    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().removetodoapi(id).then((response) async {
          removetodo = removeTodoModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && removetodo?.status == "1") {
            checklistap();
          } else {
            buildErrorDialog(
                context, "Login Error", (userData?.message).toString());
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  addcheckap() {
    if (formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['title'] = _title.text.trim().toString();
      data['description'] = _desc.text.trim().toString();
      data['category'] = 'Success';
      data['start_time'] = _start.text.trim().toString();
      data['end_time'] = _date.text.trim().toString();
      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          taskprovider().addchecklistapi(data).then((response) async {
            addchecklistmodal =
                AddchecklistModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 &&
                addchecklistmodal?.status == "1") {
              checklistap();
              Get.back();
              _title.clear();
              _start.clear();
              _desc.clear();
              _date.clear();

              print("fffd");
            } else {
              buildErrorDialog(
                  context, " Error", (addchecklistmodal?.message).toString());
            }
          });
        } else {
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    }
  }

  addcheklistdialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.grey.shade100,
          child: Stack(
            children: [
              Container(
                width: 80.w,
                  // height: 70.h,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 3.h),
                              // header(
                              //     text: "Add Your CheckList",
                              //     callback1: () {
                              //       scaffoldKey.currentState?.openDrawer();
                              //     }),
                              Center(
                                child: Text(
                                  'Add Your CheckList',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontFamily: 'sofi',
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      height: 0.17.h,
                                      letterSpacing: 1),
                                ),
                              ),
                              SizedBox(height: 3.h),
                              // Text(
                              //   'Title :',
                              //   style: TextStyle(
                              //       fontSize: 14.sp,
                              //       fontFamily: 'sofi',
                              //       color: Colors.black,
                              //       fontWeight: FontWeight.bold,
                              //       letterSpacing: 1),
                              // ),
                              // SizedBox(height: 1.h),
                              TextFormField(
                                controller: _title,
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter check title';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.67),
                                    fontFamily: 'Meta1'),
                                decoration: InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.note_add, color: Colors.blue),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  hintText: 'Title',
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.67),
                                      fontFamily: 'Meta1'),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SizedBox(height: 2.h),
                                  // Text(
                                  //   'Description :',
                                  //   style: TextStyle(
                                  //       fontSize: 14.sp,
                                  //       fontFamily: 'sofi',
                                  //       color: Colors.black,
                                  //       fontWeight: FontWeight.bold,
                                  //       letterSpacing: 1),
                                  // ),
                                  SizedBox(height: 1.h),
                                  TextFormField(
                                    maxLines: 4,
                                    controller: _desc,
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter check description';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.67),
                                        fontFamily: 'Meta1'),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.description,
                                        color: Colors.blue,
                                      ),
                                      border: InputBorder.none,
                                      fillColor: Colors.white,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      hintText: 'Description',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.67),
                                          fontFamily: 'Meta1'),
                                    ),
                                  ),
                                  // Column(
                                  //   children: [
                                  //     SizedBox(height: 2.h),
                                  //     Text(
                                  //       'Category :',
                                  //       style: TextStyle(
                                  //           fontSize: 14.sp,
                                  //           fontFamily: 'sofi',
                                  //           color: Colors.black,
                                  //           fontWeight: FontWeight.bold,
                                  //           letterSpacing: 1),
                                  //     ),
                                  //     SizedBox(height: 1.h),
                                  //     TextFormField(
                                  //       controller: _cate,
                                  //       onChanged: (value) {},
                                  //       validator: (value) {
                                  //         if (value == null || value.isEmpty) {
                                  //           return 'Please enter check category';
                                  //         }
                                  //         return null;
                                  //       },
                                  //       style: TextStyle(
                                  //           color: Colors.black.withOpacity(0.67),
                                  //           fontFamily: 'Meta1'),
                                  //       decoration: InputDecoration(
                                  //         prefixIcon: Icon(Icons.category),
                                  //         border: InputBorder.none,
                                  //         fillColor: Colors.grey.withOpacity(0.12),
                                  //         filled: true,
                                  //         enabledBorder: OutlineInputBorder(
                                  //             borderRadius: BorderRadius.circular(20),
                                  //             borderSide:
                                  //                 BorderSide(color: Colors.transparent)),
                                  //         hintText: 'category',
                                  //         hintStyle: TextStyle(
                                  //             color: Colors.black.withOpacity(0.67),
                                  //             fontFamily: 'Meta1'),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 35.w,
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: _start,
                                      onChanged: (value) {},
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter check start date';
                                        }
                                        return null;
                                      },
                                      onTap: () async {
                                        DateTime? picked = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          // Initial date, can be the current date or a specific date
                                          firstDate: DateTime(2000),
                                          // The first date that can be selected
                                          lastDate: DateTime(
                                              2101), // The last date that can be selected
                                        );

                                        if (picked != null) {
                                          setState(() {
                                            print(picked);
                                            String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(picked);
                                            _start.text = formattedDate
                                                .toString(); // Store the selected date in a variable
                                          });
                                        }
                                      },
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.67),
                                          fontFamily: 'Meta1'),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.calendar_month,
                                            color: Colors.blue),
                                        border: InputBorder.none,
                                        fillColor: Colors.white,
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(25),
                                            borderSide:
                                            BorderSide(color: Colors.white)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(25),
                                            borderSide:
                                            BorderSide(color: Colors.white)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(25),
                                            borderSide:
                                            BorderSide(color: Colors.white)),
                                        errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(25),
                                            borderSide:
                                            BorderSide(color: Colors.white)),
                                        hintText: 'Start date',
                                        hintStyle: TextStyle(
                                            color: Colors.black.withOpacity(0.67),
                                            fontFamily: 'Meta1'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  SizedBox(
                                    width: 35.w,
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: _date,
                                      onChanged: (value) {},
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter check end date';
                                        }
                                        return null;
                                      },
                                      onTap: () async {
                                        DateTime? picked = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          // Initial date, can be the current date or a specific date
                                          firstDate: DateTime(2000),
                                          // The first date that can be selected
                                          lastDate: DateTime(
                                              2101), // The last date that can be selected
                                        );

                                        if (picked != null) {
                                          setState(() {
                                            print(picked);
                                            String formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(picked);
                                            _date.text = formattedDate
                                                .toString(); // Store the selected date in a variable
                                          });
                                        }
                                      },
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.67),
                                          fontFamily: 'Meta1'),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.calendar_month,
                                            color: Colors.blue),
                                        border: InputBorder.none,
                                        fillColor: Colors.white,
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(25),
                                            borderSide:
                                            BorderSide(color: Colors.white)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(25),
                                            borderSide:
                                            BorderSide(color: Colors.white)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(25),
                                            borderSide:
                                            BorderSide(color: Colors.white)),
                                        errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(25),
                                            borderSide:
                                            BorderSide(color: Colors.white)),
                                        hintText: 'End date',
                                        hintStyle: TextStyle(
                                            color: Colors.black.withOpacity(0.67),
                                            fontFamily: 'Meta1'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Text(
                              //   'Start Date :',
                              //   style: TextStyle(
                              //       fontSize: 14.sp,
                              //       fontFamily: 'sofi',
                              //       color: Colors.black,
                              //       fontWeight: FontWeight.bold,
                              //       letterSpacing: 1),
                              // ),
                              // SizedBox(height: 1.h),


                              // Text(
                              //   'End Date :',
                              //   style: TextStyle(
                              //       fontSize: 14.sp,
                              //       fontFamily: 'sofi',
                              //       color: Colors.black,
                              //       fontWeight: FontWeight.bold,
                              //       letterSpacing: 1),
                              // ),
                              // SizedBox(height: 1.h),

                              SizedBox(height: 3.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      addcheckap();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(2.5.w),
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            CupertinoIcons.add,
                                            size: 17.sp,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            'Add Check List',
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                fontFamily: 'sofi',
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                            ],
                          ),
                        ),
                      ))),
              Positioned(
                  right: 0,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(CupertinoIcons.clear_circled_solid)))
            ],
          ),
        );
      },
    );
  }
}
