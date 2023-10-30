import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/NotificationModal.dart';
import 'package:wedding_planner/Modal/ReadnotiModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../Modal/UserProfileModal.dart';
import '../Provider/authprovider.dart';
import '../widgets/drawer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

final GlobalKey<ScaffoldState> scaffoldKey19 = GlobalKey<ScaffoldState>();

class _NotificationScreenState extends State<NotificationScreen> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationap();
    readnotiap();
    userprofileap();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
        extendBody: true,
        bottomNavigationBar: bottomnavbar(selit: -3),
        drawer: drawer1(),
        key: scaffoldKey19,
        body: isLoading
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: SingleChildScrollView(
                  child: Column(
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
                              icon: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.blue,
                                size: 23.sp,
                              )),
                          Text(
                            "",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'sofi',
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                scaffoldKey19.currentState?.openDrawer();
                              },
                              icon: Icon(
                                Icons.menu_rounded,
                                color: Colors.blue,
                                size: 23.sp,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Notifications",
                              style: TextStyle(
                                fontSize: 27.sp,
                                fontFamily: 'sofi',
                                color: Colors.blue,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 0.5.w),
                              height: 8.h,
                              padding: EdgeInsets.all(0.7.w),
                              width: 17.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90),
                                  border:
                                      Border.all(color: Colors.blue, width: 3)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(90),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      userprofile?.userDetails?.profileImg ??
                                          "",
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 70.h,
                        width: MediaQuery.of(context).size.width,
                        child: notificationmodal?.notiDetails?.length == 0
                            ? Center(
                                child: Text(
                                  "No notification available.",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'sofi',
                                    color: Colors.black,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount:
                                    notificationmodal?.notiDetails?.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 10.h,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0.70.h),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    margin: EdgeInsets.symmetric(vertical: 1.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(2.w),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                              border: Border.all(
                                                  color: Colors.blue,
                                                  width: 2)),
                                          child: Icon(
                                              notificationmodal
                                                          ?.notiDetails?[index]
                                                          .notiType ==
                                                      'chat'
                                                  ? Icons.chat_outlined
                                                  : notificationmodal
                                                              ?.notiDetails?[
                                                                  index]
                                                              .notiType ==
                                                          'booking'
                                                      ? Icons
                                                          .bookmark_outline_rounded
                                                      : notificationmodal
                                                                  ?.notiDetails?[
                                                                      index]
                                                                  .notiType ==
                                                              'invoice'
                                                          ? Icons
                                                              .attach_money_rounded
                                                          : Icons.quora,
                                              color: Colors.blue,
                                              size: 24.sp),
                                        ),
                                        SizedBox(width: 2.w),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 65.w,
                                                  child: Text(
                                                    notificationmodal
                                                                    ?.notiDetails?[
                                                                        index]
                                                                    .notiTitle ==
                                                                "" ||
                                                            notificationmodal
                                                                    ?.notiDetails?[
                                                                        index]
                                                                    .notiTitle ==
                                                                null
                                                        ? "N/A"
                                                        : notificationmodal
                                                                ?.notiDetails?[
                                                                    index]
                                                                .notiTitle ??
                                                            "",
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontFamily: 'sofi',
                                                      color: Colors.black,
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  notificationmodal
                                                              ?.notiDetails?[
                                                                  index]
                                                              .createdAt ==
                                                          null
                                                      ? "N/A"
                                                      : DateFormat('HH:mm')
                                                          .format(DateTime.parse(
                                                              notificationmodal
                                                                      ?.notiDetails?[
                                                                          index]
                                                                      .createdAt ??
                                                                  "")),
                                                  style: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontFamily: 'sofi',
                                                    color: Colors.black
                                                        .withOpacity(0.65),
                                                    letterSpacing: 1,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 0.8.h),
                                            SizedBox(
                                              width: 75.w,
                                              child: Text(
                                                notificationmodal
                                                                ?.notiDetails?[
                                                                    index]
                                                                .notiBody ==
                                                            "" ||
                                                        notificationmodal
                                                                ?.notiDetails?[
                                                                    index]
                                                                .notiBody ==
                                                            null
                                                    ? "N/A"
                                                    : notificationmodal
                                                            ?.notiDetails?[
                                                                index]
                                                            .notiBody ??
                                                        "",
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontFamily: 'sofi',
                                                  height: 0.15.h,
                                                  color: Colors.black
                                                      .withOpacity(0.65),
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  notificationap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().notificationapi().then((response) async {
          notificationmodal =
              NotificationModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && notificationmodal?.status == "1") {
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

  readnotiap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().readnotiapi().then((response) async {
          readnotimodal = ReadnotiModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && readnotimodal?.status == "1") {
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

  userprofileap() {
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().userprofileapi().then((response) async {
          userprofile = UserProfileModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && userprofile?.status == "1") {
            print(userprofile?.userDetails?.groomName);
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
