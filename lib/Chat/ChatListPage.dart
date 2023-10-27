import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Chat/msg2.dart';
import 'package:wedding_planner/Modal/ChatListModal.dart';
import 'package:wedding_planner/Modal/ChatSerchModal.dart';
import 'package:wedding_planner/Provider/authprovider.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/main.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

class ChatlistPage extends StatefulWidget {
  int? sele;

  ChatlistPage({super.key, required this.sele});

  @override
  State<ChatlistPage> createState() => _ChatlistPageState();
}

final GlobalKey<ScaffoldState> scaffoldKey7 = GlobalKey<ScaffoldState>();
TextEditingController _search = TextEditingController();


class _ChatlistPageState extends State<ChatlistPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      setit = 2;
    });
    chatlistap();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        bottomNavigationBar: bottomnavbar(selit: widget.sele),
        extendBody: true,
        drawer: drawer1(),
        key: scaffoldKey7,
        body: isLoading
            ? Container()
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    header(
                        text: "",
                        callback1: () {
                          scaffoldKey7.currentState?.openDrawer();
                        }),
                    SizedBox(height: 1.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 1.w),
                          child: Text(
                            'Messages',
                            style: TextStyle(
                                fontSize: 25.sp,
                                fontFamily: 'sofi',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    searchBox(),
                    _search.text != ""
                        ? chatserchmodal?.data?.length == 0 || chatserchmodal?.data == null
                            ? Container(
                      height: 50.h,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Text("No Suppliers found" ,style: TextStyle(
                            fontSize:
                            16.sp,
                            fontWeight:
                            FontWeight
                                .bold,
                            letterSpacing:
                            1,
                            fontFamily:
                            'sofi',
                            color: Colors
                                .black)))
                            : Column(
                                children: [
                                  for (int index = 0;
                                      index <
                                          (chatserchmodal?.data?.length ?? 0);
                                      index++) ...[
                                    InkWell(
                                      onTap: () {
                                        print(chatserchmodal
                                            ?.data?[index].profile);
                                        Get.to(Msg2(
                                          id: chatserchmodal?.data?[index].id,
                                          name:
                                              chatserchmodal?.data?[index].name,
                                          img: chatserchmodal
                                              ?.data?[index].profile,
                                        ));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w, vertical: 1.h),
                                        margin:
                                            EdgeInsets.symmetric(vertical: 1.h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 1.w),
                                              height: 7.h,
                                              width: 15.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(90),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl: chatserchmodal
                                                          ?.data?[index]
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
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   width: 3.w,
                                            // ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 68.w,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        chatserchmodal
                                                            ?.data?[index]
                                                            .name==""||chatserchmodal
                                                            ?.data?[index]
                                                            .name==null?"N/A":chatserchmodal
                                                                ?.data?[index]
                                                                .name ??
                                                            "",
                                                        style: TextStyle(
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            letterSpacing: 1,
                                                            fontFamily: 'sofi',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        chatserchmodal
                                                                    ?.data?[
                                                                        index]
                                                                    .lastChatMessageInfo1 ==
                                                                null
                                                            ? ""
                                                            : DateFormat(
                                                                    'HH:mm')
                                                                .format(DateTime.parse(chatserchmodal
                                                                        ?.data?[
                                                                            index]
                                                                        .lastChatMessageInfo1
                                                                        ?.createdAt ??
                                                                    "")),
                                                        style: TextStyle(
                                                            fontSize: 10.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily: 'sofi',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                SizedBox(
                                                  width: 52.w,
                                                  child: Text(
                                                    chatserchmodal?.data?[index]
                                                                .lastChatMessageInfo1 ==
                                                            null
                                                        ? ""
                                                        : chatserchmodal
                                                                    ?.data?[
                                                                        index]
                                                                    .lastChatMessageInfo1
                                                                    ?.messageType ==
                                                                "2"
                                                            ? "Image"
                                                            : chatserchmodal
                                                                        ?.data?[
                                                                            index]
                                                                        .lastChatMessageInfo1
                                                                        ?.messageType ==
                                                                    "3"
                                                                ? "Video"
                                                                : chatserchmodal
                                                                            ?.data?[
                                                                                index]
                                                                            .lastChatMessageInfo1
                                                                            ?.messageType ==
                                                                        "4"
                                                                    ? "File"
                                                                    : chatserchmodal
                                                                            ?.data?[index]
                                                                            .lastChatMessageInfo1
                                                                            ?.message ??
                                                                        "",
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'sofi',
                                                        color: Colors.black54),
                                                  ),
                                                )
                                              ],
                                            ),
                                            // SizedBox(
                                            //   width: 3.w,
                                            // ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ]
                                ],
                              )
                        : Column(
                            children: [
                              SizedBox(height: 2.h),
                              Row(
                                children: [
                                  SizedBox(width: 2.w),
                                  Text(
                                    'My Venue ',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                        fontFamily: 'sofi',
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                              InkWell(
                                onTap: () {
                                  Get.to(Msg2(
                                    id: chatlistmodal?.venue?.id,
                                    name: chatlistmodal?.venue?.name,
                                    img: chatlistmodal?.venue?.profile,
                                  ));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.w, vertical: 1.h),
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 1.w),
                                        height: 7.h,
                                        width: 15.w,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(90),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl:
                                                chatlistmodal?.venue?.profile ??
                                                    "",
                                            progressIndicatorBuilder: (context,
                                                    url, progress) =>
                                                Center(
                                                    child:
                                                        CircularProgressIndicator()),
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
                                        width: 3.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 68.w,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  chatlistmodal?.venue?.name=="" ||chatlistmodal?.venue?.name ==null?"N/A":chatlistmodal?.venue?.name ??
                                                      "",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 1,
                                                      fontFamily: 'sofi',
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  chatlistmodal?.venue
                                                              ?.lastChatMessageInfo ==
                                                          null
                                                      ? ""
                                                      : DateFormat('HH:mm').format(
                                                          DateTime.parse(chatlistmodal
                                                                  ?.venue
                                                                  ?.lastChatMessageInfo
                                                                  ?.createdAt ??
                                                              "")),
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'soi',
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          SizedBox(
                                            width: 52.w,
                                            child: Text(
                                              chatlistmodal?.venue
                                                          ?.lastChatMessageInfo ==
                                                      null
                                                  ? ""
                                                  : chatlistmodal
                                                              ?.venue
                                                              ?.lastChatMessageInfo
                                                              ?.messageType ==
                                                          "2"
                                                      ? "Image"
                                                      : chatlistmodal
                                                                  ?.venue
                                                                  ?.lastChatMessageInfo
                                                                  ?.messageType ==
                                                              "3"
                                                          ? "Video"
                                                          : chatlistmodal
                                                                      ?.venue
                                                                      ?.lastChatMessageInfo
                                                                      ?.messageType ==
                                                                  "4"
                                                              ? "File"
                                                              : chatlistmodal
                                                                      ?.venue
                                                                      ?.lastChatMessageInfo
                                                                      ?.message ??
                                                                  "",
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'soi',
                                                  color: Colors.black54),
                                            ),
                                          )
                                        ],
                                      ),
                                      // SizedBox(
                                      //   width: 3.w,
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Divider(color: Colors.black87),
                              ),
                              SizedBox(height: 1.h),
                              Row(
                                children: [
                                  SizedBox(width: 2.w),
                                  Text(
                                    'Suppliers ',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                        fontFamily: 'sofi',
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                              chatlistmodal?.suppliers?.length == 0
                                  ? Container(height: 40.h,alignment: Alignment.center,
                                    child: Text("No Supplier available", style: TextStyle(
                                    fontSize:
                                    16.sp,
                                    fontWeight:
                                    FontWeight
                                        .bold,
                                    letterSpacing:
                                    1,
                                    fontFamily:
                                    'sofi',
                                    color: Colors
                                        .black)),
                                  )
                                  : Column(
                                      children: [
                                        for (int index = 0;
                                            index <
                                                (chatlistmodal
                                                        ?.suppliers?.length ??
                                                    0);
                                            index++) ...[
                                          InkWell(
                                            onTap: () {
                                              print(chatlistmodal
                                                  ?.suppliers?[index].profile);
                                              Get.to(Msg2(
                                                id: chatlistmodal
                                                    ?.suppliers?[index].id,
                                                name: chatlistmodal
                                                    ?.suppliers?[index].name,
                                                img: chatlistmodal
                                                    ?.suppliers?[index].profile,
                                              ));
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3.w,
                                                  vertical: 1.h),
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 1.h),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1.w),
                                                    height: 7.h,
                                                    width: 15.w,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              90),
                                                      child: CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl: chatlistmodal
                                                                ?.suppliers?[
                                                                    index]
                                                                .profile ??
                                                            "",
                                                        progressIndicatorBuilder:
                                                            (context, url,
                                                                    progress) =>
                                                                CircularProgressIndicator(),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.asset(
                                                          'assets/user.png',
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  // SizedBox(
                                                  //   width: 3.w,
                                                  // ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 68.w,
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              chatlistmodal
                                                                  ?.suppliers?[
                                                              index]
                                                                  .name==""||chatlistmodal
                                                                  ?.suppliers?[
                                                              index]
                                                                  .name==null?"N/A":chatlistmodal
                                                                      ?.suppliers?[
                                                                          index]
                                                                      .name ??
                                                                  "",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      16.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      1,
                                                                  fontFamily:
                                                                      'sofi',
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            Text(
                                                              chatlistmodal
                                                                          ?.suppliers?[
                                                                              index]
                                                                          .lastChatMessageInfo1 ==
                                                                      null
                                                                  ? ""
                                                                  : DateFormat(
                                                                          'HH:mm')
                                                                      .format(DateTime.parse(chatlistmodal
                                                                              ?.suppliers?[index]
                                                                              .lastChatMessageInfo1
                                                                              ?.createdAt ??
                                                                          "")),
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      10.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'sofi',
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                      SizedBox(
                                                        width: 52.w,
                                                        child: Text(
                                                          chatlistmodal
                                                                      ?.suppliers?[
                                                                          index]
                                                                      .lastChatMessageInfo1 ==
                                                                  null
                                                              ? ""
                                                              : chatlistmodal
                                                                          ?.suppliers?[
                                                                              index]
                                                                          .lastChatMessageInfo1
                                                                          ?.messageType ==
                                                                      "2"
                                                                  ? "Image"
                                                                  : chatlistmodal
                                                                              ?.suppliers?[
                                                                                  index]
                                                                              .lastChatMessageInfo1
                                                                              ?.messageType ==
                                                                          "3"
                                                                      ? "Video"
                                                                      : chatlistmodal?.suppliers?[index].lastChatMessageInfo1?.messageType ==
                                                                              "4"
                                                                          ? "File"
                                                                          : chatlistmodal?.suppliers?[index].lastChatMessageInfo1?.message ??
                                                                              "",
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  'sofi',
                                                              color: Colors
                                                                  .black54),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  // SizedBox(
                                                  //   width: 3.w,
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ]
                                      ],
                                    ),
                            ],
                          ),

                    // ListView.builder(
                    //   itemCount: chatlistmodal?.suppliers?.length,
                    //   itemBuilder: (context, index) {
                    //     String? formattedTime;
                    //     if (chatlistmodal
                    //         ?.suppliers?[index].lastChatMessageInfo1 !=
                    //         null) {
                    //       DateTime dateTime = DateTime.parse(chatlistmodal
                    //           ?.suppliers?[index]
                    //           .lastChatMessageInfo1
                    //           ?.createdAt ??
                    //           "");
                    //       DateFormat timeFormat = DateFormat(
                    //           'HH:mm'); // Customize the format as needed
                    //       formattedTime = timeFormat.format(dateTime);
                    //     } else {
                    //       formattedTime = "";
                    //     }
                    //     return InkWell(
                    //       onTap: () {
                    //         print(chatlistmodal?.suppliers?[index].profile);
                    //         Get.to(Msg2(
                    //           id: chatlistmodal?.suppliers?[index].id,
                    //           name: chatlistmodal?.suppliers?[index].name,
                    //           img: chatlistmodal?.suppliers?[index].profile,
                    //         ));
                    //       },
                    //       child: Container(
                    //         padding: EdgeInsets.symmetric(
                    //             horizontal: 3.w, vertical: 1.h),
                    //         margin: EdgeInsets.symmetric(vertical: 1.h),
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //           color: Colors.white,
                    //         ),
                    //         child: Row(
                    //           mainAxisAlignment:
                    //           MainAxisAlignment.spaceBetween,
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             Container(
                    //               margin:
                    //               EdgeInsets.symmetric(horizontal: 1.w),
                    //               height: 7.h,
                    //               width: 15.w,
                    //               child: ClipRRect(
                    //                 borderRadius: BorderRadius.circular(90),
                    //                 child: CachedNetworkImage(
                    //                   fit: BoxFit.cover,
                    //                   imageUrl: chatlistmodal
                    //                       ?.suppliers?[index].profile ??
                    //                       "",
                    //                   progressIndicatorBuilder:
                    //                       (context, url, progress) =>
                    //                       CircularProgressIndicator(),
                    //                   errorWidget: (context, url, error) =>
                    //                       Image.asset(
                    //                         'assets/user.png',
                    //                         color: Colors.white,
                    //                       ),
                    //                 ),
                    //               ),
                    //             ),
                    //             // SizedBox(
                    //             //   width: 3.w,
                    //             // ),
                    //             Column(
                    //               crossAxisAlignment:
                    //               CrossAxisAlignment.start,
                    //               mainAxisAlignment:
                    //               MainAxisAlignment.center,
                    //               children: [
                    //                 Container(
                    //                   width: 68.w,
                    //                   child: Row(
                    //                     crossAxisAlignment:
                    //                     CrossAxisAlignment.center,
                    //                     mainAxisAlignment:
                    //                     MainAxisAlignment.spaceBetween,
                    //                     children: [
                    //                       Text(
                    //                         chatlistmodal?.suppliers?[index]
                    //                             .name ??
                    //                             "",
                    //                         style: TextStyle(
                    //                             fontSize: 16.sp,
                    //                             fontWeight: FontWeight.bold,
                    //                             letterSpacing: 1,
                    //                             fontFamily: 'sofi',
                    //                             color: Colors.black),
                    //                       ),
                    //                       Text(
                    //                         DateFormat('HH:mm').format(
                    //                             DateTime.parse(chatlistmodal
                    //                                 ?.suppliers?[index]
                    //                                 .lastChatMessageInfo1
                    //                                 ?.createdAt ??
                    //                                 "")),
                    //                         style: TextStyle(
                    //                             fontSize: 10.sp,
                    //                             fontWeight: FontWeight.w400,
                    //                             fontFamily: 'sofi',
                    //                             color: Colors.black),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 SizedBox(
                    //                   height: 1.h,
                    //                 ),
                    //                 SizedBox(
                    //                   width: 52.w,
                    //                   child: Text(
                    //                     chatlistmodal?.suppliers?[index]
                    //                         .lastChatMessageInfo1 ==
                    //                         null
                    //                         ? ""
                    //                         : chatlistmodal
                    //                         ?.suppliers?[index]
                    //                         .lastChatMessageInfo1
                    //                         ?.messageType ==
                    //                         "2"
                    //                         ? "Image"
                    //                         : chatlistmodal
                    //                         ?.suppliers?[
                    //                     index]
                    //                         .lastChatMessageInfo1
                    //                         ?.messageType ==
                    //                         "3"
                    //                         ? "Video"
                    //                         : chatlistmodal
                    //                         ?.suppliers?[
                    //                     index]
                    //                         .lastChatMessageInfo1
                    //                         ?.messageType ==
                    //                         "4"
                    //                         ? "File"
                    //                         : chatlistmodal
                    //                         ?.suppliers?[
                    //                     index]
                    //                         .lastChatMessageInfo1
                    //                         ?.message ??
                    //                         "",
                    //                     maxLines: 2,
                    //                     style: TextStyle(
                    //                         fontSize: 12.sp,
                    //                         fontWeight: FontWeight.w500,
                    //                         fontFamily: 'sofi',
                    //                         color: Colors.black54),
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //             // SizedBox(
                    //             //   width: 3.w,
                    //             // ),
                    //           ],
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ]),
                ),
              ),
      ),
    );
  }

  // Widget searchBox() {
  //   return Container(
  //     alignment: Alignment.center,
  //     height: 6.h,
  //     padding: const EdgeInsets.symmetric(horizontal: 7),
  //     decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black),
  //       borderRadius: BorderRadius.circular(90),
  //     ),
  //     child: TextField(
  //       controller: _search,
  //       onChanged: (value) {},
  //       style:
  //           TextStyle(color: Colors.black, fontSize: 12.sp, fontFamily: 'get'),
  //       decoration: InputDecoration(
  //         prefixIcon: Icon(
  //           Icons.search,
  //           color: Colors.black,
  //           size: 25,
  //         ),
  //         prefixIconConstraints: BoxConstraints(
  //           maxHeight: 35,
  //           minWidth: 40,
  //         ),
  //         border: InputBorder.none,
  //         hintText: 'Search',
  //         hintStyle: TextStyle(color: Colors.black, fontFamily: 'get'),
  //       ),
  //     ),
  //   );
  // }

  Widget search() {
    return Container(
      width: 95.w,
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.4.h),
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
          prefixIcon: Icon(CupertinoIcons.search,
              color: Colors.black.withOpacity(0.65)),
          hintText: 'Search',
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.65), fontFamily: 'Meta1'),
        ),
      ),
    );
  }

  chatlistap() {
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().chatlistapi().then((response) async {
          chatlistmodal = ChatListModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && chatlistmodal?.status == "1") {
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
          chatserchap(value);
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
          hintText: 'Search Suppliers',
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.65), fontFamily: 'get'),
        ),
      ),
    );
  }

  chatserchap(String value) {
    final Map<String, String> data = {};
    data['search'] = _search.text.toString();
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().chatserchapi(data).then((response) async {
          chatserchmodal = ChatSerchModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && chatserchmodal?.status == "1") {
            setState(() {
              chatserchmodal;
            });
          } else {}
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
