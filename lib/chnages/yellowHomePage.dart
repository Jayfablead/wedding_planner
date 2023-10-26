import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Meetings/Meetings%20Page.dart';
import 'package:wedding_planner/Modal/AddtofavouriteModal.dart';
import 'package:wedding_planner/Modal/HomeModal.dart';
import 'package:wedding_planner/Modal/NotificationModal.dart';
import 'package:wedding_planner/Modal/SuppliersearchModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/Suppliers/SupplierDetailsPage.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../Others/Check List.dart';

class YellowHomeScreen extends StatefulWidget {
  int? sele;

  YellowHomeScreen({super.key, required this.sele});

  @override
  State<YellowHomeScreen> createState() => _YellowHomeScreenState();
}

class _YellowHomeScreenState extends State<YellowHomeScreen> {
  TextEditingController _search = TextEditingController();
  int sel = 1;
  int sel1 = 0;
  int? fav;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      sel = 1;
    });
    homeap();
    notificationap();
  }

  bool istap = false;

  int? mydata;
  bool isLoading = true;
  List<String> type = ["All Suppliers", "To Do", "Meeting"];

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        key: scaffoldKey,
        extendBody: true,
        drawer: drawer1(),
        body: isLoading
            ? Container()
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Platform.isIOS?SizedBox(
                  height: 6.5.h,
                  ): SizedBox(
                        height: 4.5.h,
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 92.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 70.w,
                                          child: Text(
                                            "Hi, " +
                                                (homemodal?.userData?.groomName ==
                                                            null ||
                                                        homemodal?.userData
                                                                ?.groomName ==
                                                            ""
                                                    ? "N/A"
                                                    : (homemodal
                                                            ?.userData?.groomName)
                                                        .toString()) +
                                                " & " +
                                                (homemodal?.userData?.brideName ==
                                                            null ||
                                                        homemodal?.userData
                                                                ?.brideName ==
                                                            ""
                                                    ? "N/A"
                                                    : (homemodal
                                                            ?.userData?.brideName)
                                                        .toString()),
                                            style: TextStyle(
                                                fontSize: 23.sp,
                                                fontFamily: 'sofi',
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1,
                                                color: Colors.blue),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            scaffoldKey.currentState
                                                ?.openDrawer();
                                          },
                                          icon: Icon(
                                            Icons.menu_rounded,
                                            color: Colors.blue,
                                            size: 23.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: .50.h),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.date_range_outlined,
                                            color:
                                                Colors.black.withOpacity(0.75)),
                                        SizedBox(width: 2.w),
                                        Padding(
                                          padding: EdgeInsets.only(top: 0.4.h),
                                          child: Text(
                                            homemodal?.userData?.functionDate ==
                                                        null ||
                                                    homemodal?.userData
                                                            ?.functionDate ==
                                                        ""
                                                ? "N/A"
                                                : homemodal?.userData
                                                        ?.functionDate ??
                                                    "",
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                fontFamily: 'sofi',
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1,
                                                color: Colors.black
                                                    .withOpacity(0.75)),
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
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          searchBox(),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      _search.text != ''
                          ? suppliersearchmodal?.suppliers?.length == 0
                              ? Container(
                                  height: 55.h,
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
                                  width: MediaQuery.of(context).size.width,
                                  height: 45.h,
                                  child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: suppliersearchmodal
                                          ?.suppliers?.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: 80.w,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 2.w, vertical: 1.h),
                                          padding: EdgeInsets.all(1.w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Colors.white),
                                          child: Stack(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 0.20.h,
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(2.w),
                                                    width: 85.w,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        child:
                                                            CachedNetworkImage(
                                                          width: 80.w,
                                                          height: 20.h,
                                                          fit: BoxFit.cover,
                                                          imageUrl: suppliersearchmodal
                                                                  ?.suppliers?[
                                                                      index]
                                                                  .profilePath ??
                                                              "",
                                                          progressIndicatorBuilder:
                                                              (context, url,
                                                                      progress) =>
                                                                  Center(
                                                                      child:
                                                                          CircularProgressIndicator()),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Image.asset(
                                                            'assets/defimg.jpg',
                                                            height: 20.h,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 1.5.h,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 3.w),
                                                    child: Text(
                                                        suppliersearchmodal
                                                                        ?.suppliers?[
                                                                            index]
                                                                        .name ==
                                                                    '' ||
                                                                suppliersearchmodal
                                                                        ?.suppliers?[
                                                                            index]
                                                                        .name ==
                                                                    null
                                                            ? 'N/A'
                                                            : suppliersearchmodal
                                                                    ?.suppliers?[
                                                                        index]
                                                                    .name ??
                                                                "",
                                                        style: TextStyle(
                                                            fontSize: 14.5.sp,
                                                            fontFamily: 'sofi',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            letterSpacing: 1)),
                                                  ),
                                                  SizedBox(
                                                    height: 1.5.h,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 3.w),
                                                    child: Text(
                                                        suppliersearchmodal
                                                                ?.suppliers?[
                                                                    index]
                                                                .service ??
                                                            "",
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 14.5.sp,
                                                            fontFamily: 'sofi',
                                                            color:
                                                                Colors.black54,
                                                            letterSpacing: 1)),
                                                  ),
                                                  SizedBox(
                                                    height: 4.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Get.to(
                                                              SupplierfourScreen(
                                                            suppid:
                                                                suppliersearchmodal
                                                                    ?.suppliers?[
                                                                        index]
                                                                    .id,
                                                            catid:
                                                                suppliersearchmodal
                                                                    ?.suppliers?[
                                                                        index]
                                                                    .categoryId,
                                                            service:
                                                                suppliersearchmodal
                                                                    ?.suppliers?[
                                                                        index]
                                                                    .service,
                                                          ));
                                                        },
                                                        child: Container(
                                                          width: 50.w,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 1.h,
                                                                  horizontal:
                                                                      5.w),
                                                          alignment:
                                                              Alignment.center,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.blue,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25)),
                                                          child: Center(
                                                            child: Text(
                                                                "View Detail",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17.sp,
                                                                    fontFamily:
                                                                        'sofi',
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        1)),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 1.5.h,
                                                  ),
                                                ],
                                              ),
                                              Positioned(
                                                  left: 65.w,
                                                  top: 1.5.h,
                                                  child: Container(
                                                    height: 10.w,
                                                    width: 10.w,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            mydata = index;
                                                            fav = suppliersearchmodal
                                                                        ?.suppliers?[
                                                                            index]
                                                                        .fav ==
                                                                    "1"
                                                                ? 0
                                                                : 1;
                                                          });

                                                          favourite();
                                                        },
                                                        icon: suppliersearchmodal
                                                                    ?.suppliers?[
                                                                        index]
                                                                    .fav ==
                                                                "1"
                                                            ? Icon(
                                                                Icons.favorite,
                                                                color: Colors
                                                                    .white,
                                                                size: 20.sp,
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color: Colors
                                                                    .white,
                                                                size: 20.sp,
                                                              )),
                                                  ))
                                            ],
                                          ),
                                        );
                                      }))
                          : Column(
                              children: [
                                SizedBox(
                                  height: 3.h,
                                ),
                                Container(
                                  height: 4.5.h,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: 3,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              sel1 = index;
                                            });
                                            sel1 == 1
                                                ? Get.to(Check_list())
                                                : sel1 == 2
                                                    ? Get.to(MeetingsPage(
                                                        sele: 0,
                                                      ))
                                                    : Container();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.h, horizontal: 3.w),
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
                                                    fontSize: 14.sp,
                                                    fontFamily: 'sofi',
                                                    color: sel1 == index
                                                        ? Colors.white
                                                        : Colors.blue,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 1)),
                                          ),
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                homemodal?.suppliers?.length == 0 ||
                                        homemodal?.suppliers?.length == null
                                    ? Container(
                                        height: 45.h,
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
                                    : SizedBox(
                                        height: 43.h,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                width: 80.w,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 2.w),
                                                padding: EdgeInsets.all(1.w),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    color: Colors.white),
                                                child: Stack(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.to(
                                                            SupplierfourScreen(
                                                              suppid: homemodal
                                                                  ?.suppliers?[
                                                              index]
                                                                  .id,
                                                              catid: homemodal
                                                                  ?.suppliers?[
                                                              index]
                                                                  .categoryId,
                                                              service: homemodal
                                                                  ?.suppliers?[
                                                              index]
                                                                  .service,
                                                            ));
                                                      },
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            height: 0.20.h,
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.w),
                                                            width: 85.w,
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        1.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  width: 80.w,
                                                                  height: 20.h,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  imageUrl: homemodal
                                                                          ?.suppliers?[
                                                                              index]
                                                                          .profilePath ??
                                                                      "",
                                                                  progressIndicatorBuilder: (context,
                                                                          url,
                                                                          progress) =>
                                                                      Center(
                                                                          child:
                                                                              CircularProgressIndicator()),
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      Image.asset(
                                                                    'assets/defimg.jpg',
                                                                    height: 20.h,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 1.5.h,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 3.w),
                                                            child: Text(
                                                                homemodal?.suppliers?[index].name ==
                                                                            '' ||
                                                                        homemodal
                                                                                ?.suppliers?[
                                                                                    index]
                                                                                .name ==
                                                                            null
                                                                    ? 'N/A'
                                                                    : homemodal
                                                                            ?.suppliers?[
                                                                                index]
                                                                            .name ??
                                                                        "",
                                                                style: TextStyle(
                                                                    fontSize: 14.5
                                                                        .sp,
                                                                    fontFamily:
                                                                        'sofi',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        1)),
                                                          ),
                                                          SizedBox(
                                                            height: 1.5.h,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 3.w),
                                                            child: Text(
                                                                homemodal
                                                                        ?.suppliers?[
                                                                            index]
                                                                        .service ??
                                                                    "",
                                                                maxLines: 2,
                                                                overflow: TextOverflow
                                                                    .ellipsis,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14.5.sp,
                                                                    fontFamily:
                                                                        'sofi',
                                                                    color: Colors
                                                                        .black54,
                                                                    letterSpacing:
                                                                        1)),
                                                          ),
                                                          SizedBox(
                                                            height: 4.h,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  Get.to(
                                                                      SupplierfourScreen(
                                                                    suppid: homemodal
                                                                        ?.suppliers?[
                                                                            index]
                                                                        .id,
                                                                    catid: homemodal
                                                                        ?.suppliers?[
                                                                            index]
                                                                        .categoryId,
                                                                    service: homemodal
                                                                        ?.suppliers?[
                                                                            index]
                                                                        .service,
                                                                  ));
                                                                },
                                                                child: Container(
                                                                  width: 50.w,
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              1.h,
                                                                          horizontal:
                                                                              5.w),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .blue,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              25)),
                                                                  child: Center(
                                                                    child: Text(
                                                                        "View Detail",
                                                                        style: TextStyle(
                                                                            fontSize: 17
                                                                                .sp,
                                                                            fontFamily:
                                                                                'sofi',
                                                                            color: Colors
                                                                                .white,
                                                                            letterSpacing:
                                                                                1)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 1.5.h,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                        left: 64.w,
                                                        top: 2.h,
                                                        child: Container(
                                                          height: 10.w,
                                                          width: 10.w,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.blue,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: IconButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  mydata =
                                                                      index;
                                                                  fav = homemodal
                                                                              ?.suppliers?[index]
                                                                              .fav ==
                                                                          "1"
                                                                      ? 0
                                                                      : 1;
                                                                });

                                                                favourite();
                                                              },
                                                              icon: homemodal
                                                                          ?.suppliers?[
                                                                              index]
                                                                          .fav ==
                                                                      "1"
                                                                  ? Icon(
                                                                      Icons
                                                                          .favorite,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          20.sp,
                                                                    )
                                                                  : Icon(
                                                                      Icons
                                                                          .favorite_border,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          20.sp,
                                                                    )),
                                                        ))
                                                  ],
                                                ),
                                              );
                                            },
                                            itemCount:
                                                homemodal?.suppliers?.length),
                                      ),
                              ],
                            )
                    ],
                  ),
                ),
              ),
        bottomNavigationBar: bottomnavbar(selit: widget.sele),
      ),
    );
  }

  Widget searchBox() {
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
          if (value.isNotEmpty) {
            print(value);
            searchap();
          }
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

  homeap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().homeapi().then((response) async {
          homemodal = HomeModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && homemodal?.status == "1") {
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

  favourite() {
    showModalBottomSheet(
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
                      homemodal?.suppliers?[mydata!].fav == "0"
                          ? 'Are You Sure You Want to add to favourite?'
                          : 'Are You Sure You Want to remove to favourite?',
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
                                  addtofavouriteap(
                                      homemodal?.suppliers?[mydata!].id,
                                      homemodal?.suppliers?[mydata!].serviceId);
                                },
                                child: Container(
                                  width: 30.w,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(2.5.w),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(98)),
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
                                      color: Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(98)),
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

  addtofavouriteap(String? supplierid, String? catid) {
    final Map<String, String> data = {};
    data['userID'] = (userData?.user?.id).toString();
    data['supplierID'] = supplierid.toString();
    data['categoryID'] = catid.toString();
    data['isFav'] = fav.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().addtofavouriteapi(data).then((response) async {
          addtofavouritemodal =
              AddtofavouriteModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              addtofavouritemodal?.status == "1") {
            homeap();
            searchap();
            Get.back();
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

  searchap() {
    final Map<String, String> data = {};
    data['search'] = _search.text.toString();

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().suppliersearchapi(data).then((response) async {
          suppliersearchmodal =
              SuppliersearchModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              suppliersearchmodal?.status == "1") {
            setState(() {
              suppliersearchmodal;
            });
            print(suppliersearchmodal?.suppliers?.length);
            print("ghdfdsh");
          } else {}
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
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
}
