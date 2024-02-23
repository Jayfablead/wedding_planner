import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Chat/ThreadPage.dart';
import 'package:wedding_planner/Chat/msg2.dart';
import 'package:wedding_planner/Modal/AddtopicModal.dart';
import 'package:wedding_planner/Modal/ChatListModal.dart';
import 'package:wedding_planner/Modal/ChatSerchModal.dart';
import 'package:wedding_planner/Modal/SupplierDropdownModal.dart';
import 'package:wedding_planner/Modal/ThreadListModal.dart';
import 'package:wedding_planner/Provider/authprovider.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/main.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../Modal/VenuedetailModal.dart';

class ChatlistPage extends StatefulWidget {
  int? sele;

  ChatlistPage({super.key, required this.sele});

  @override
  State<ChatlistPage> createState() => _ChatlistPageState();
}

final GlobalKey<ScaffoldState> scaffoldKey7 = GlobalKey<ScaffoldState>();
TextEditingController _search = TextEditingController();
TextEditingController _topic = TextEditingController();
final _formKeychat = GlobalKey<FormState>();
String? _selectedLocation;
String? _selectedSupp;
List<String> _locations = ['Venue', 'Suppliers'];
Timer? _timer;
int sel1 = 1;

class _ChatlistPageState extends State<ChatlistPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      sel1 = 1;
      isLoading = true;
      setit = 2;
    });
    chatlistap();
    Supplierap();
    venueap();
    threadlistap();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      chatlistap();
      Supplierap();
      venueap();
      threadlistap();
    });
  }

  bool isLoading = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }

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
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      header(
                          text: "",
                          callback1: () {
                            scaffoldKey7.currentState?.openDrawer();
                          }),
                      SizedBox(height: 2.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            sel1 == 1 ? 'Messages' : 'Threads',
                            style: TextStyle(
                                fontSize: 25.sp,
                                fontFamily: 'sofi',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                color: Colors.black),
                          ),
                          sel1 == 1
                              ? Container()
                              : InkWell(
                                  onTap: () {
                                    setState(() {
                                      _topic.clear();
                                      _selectedSupp = null;
                                      _selectedLocation = null;
                                    });
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Form(
                                          key: _formKeychat,
                                          child: StatefulBuilder(
                                            builder: (context, setState) {
                                              return AlertDialog(
                                                backgroundColor:
                                                    Colors.grey.shade100,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                content: Stack(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Start Thread',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      15.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  letterSpacing:
                                                                      1,
                                                                  fontFamily:
                                                                      'sofi',
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 2.h),
                                                        Text(
                                                          'Topic Title :',
                                                          style: TextStyle(
                                                              fontSize: 13.sp,
                                                              letterSpacing: 1,
                                                              fontFamily:
                                                                  'sofi',
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        SizedBox(height: 1.h),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 65.w,
                                                          height: 6.5.h,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      7),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .white),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        65),
                                                          ),
                                                          child: TextFormField(
                                                            controller: _topic,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 13.sp,
                                                              fontFamily: 'get',
                                                            ),
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintText:
                                                                  'Enter Topic Title',
                                                              hintStyle:
                                                                  TextStyle(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.65),
                                                                fontFamily:
                                                                    'get',
                                                              ),
                                                            ),
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'Please enter a topic title';
                                                              }
                                                              // You can add additional validation logic as needed
                                                              return null; // Return null if the input is valid
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(height: 2.h),
                                                        SizedBox(height: 2.h),
                                                        Text(
                                                          'Venue :',
                                                          style: TextStyle(
                                                              fontSize: 13.sp,
                                                              letterSpacing: 1,
                                                              fontFamily:
                                                                  'sofi',
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              venuedetail
                                                                      ?.venueDetails
                                                                      ?.name ??
                                                                  '',
                                                              style: TextStyle(
                                                                fontSize: 13.sp,
                                                                letterSpacing:
                                                                    1,
                                                                fontFamily:
                                                                    'sofi',
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 3.h),
                                                        InkWell(
                                                          onTap: () {
                                                            if (_formKeychat
                                                                .currentState!
                                                                .validate()) {
                                                              adtopicap();
                                                              _selectedLocation ==
                                                                      'Venue'
                                                                  ? print(
                                                                      'topic: ${_topic.text}\nid: ${venuedetail?.venueDetails?.id}\nname: ${venuedetail?.venueDetails?.name}')
                                                                  : print(
                                                                      'Supplier');
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 65.w,
                                                            height: 6.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.blue,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25.sp),
                                                            ),
                                                            child: Center(
                                                                child: Text(
                                                              "Start",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      13.sp,
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      'get'),
                                                            )),
                                                          ),
                                                        ),
                                                        SizedBox(height: 1.h),
                                                      ],
                                                    ),
                                                    Positioned(
                                                      right: 0,
                                                      child: InkWell(
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                          child: Icon(
                                                              Icons.close)),
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                    size: 22.sp,
                                  ))
                        ],
                      ),
                      SizedBox(height: 1.h),
                      sel1 == 1 ? searchBox() : Container(),
                      sel1 == 1 ? SizedBox(height: 2.h) : SizedBox(height: 0.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                sel1 = 1;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.8.h, horizontal: 11.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: sel1 == 1 ? Colors.blue : Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Chat',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'sofi',
                                          color: sel1 == 1
                                              ? Colors.white
                                              : Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1)),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                sel1 = 2;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.8.h, horizontal: 11.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: sel1 == 2 ? Colors.blue : Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Threads',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'sofi',
                                          color: sel1 == 2
                                              ? Colors.white
                                              : Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      _search.text != ""
                          ? chatserchmodal?.data?.length == 0 ||
                                  chatserchmodal?.data == null
                              ? Container(
                                  height: 50.h,
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  child: Text("No Suppliers found",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          fontFamily: 'sofi',
                                          color: Colors.black)))
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
                                            name: chatserchmodal
                                                ?.data?[index].name,
                                            img: chatserchmodal
                                                ?.data?[index].profile,
                                          ));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.w, vertical: 1.h),
                                          margin: EdgeInsets.symmetric(
                                              vertical: 1.h),
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
                                                height: 15.w,
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
                                                                          ?.data?[
                                                                              index]
                                                                          .name ==
                                                                      "" ||
                                                                  chatserchmodal
                                                                          ?.data?[
                                                                              index]
                                                                          .name ==
                                                                      null
                                                              ? "N/A"
                                                              : chatserchmodal
                                                                      ?.data?[
                                                                          index]
                                                                      .name ??
                                                                  "",
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              letterSpacing: 1,
                                                              fontFamily:
                                                                  'sofi',
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
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  'sofi',
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
                                                      chatserchmodal
                                                                  ?.data?[index]
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
                                                          color:
                                                              Colors.black54),
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
                                sel1 == 1
                                    ? Row(
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
                                      )
                                    : Container(),
                                sel1 == 1 ? SizedBox(height: 2.h) : Container(),
                                sel1 == 1
                                    ? InkWell(
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
                                          margin: EdgeInsets.symmetric(
                                              vertical: 1.h),
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
                                                height: 14.w,
                                                width: 14.w,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(90),
                                                  child: CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    imageUrl: chatlistmodal
                                                            ?.venue?.profile ??
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
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          chatlistmodal?.venue
                                                                          ?.name ==
                                                                      "" ||
                                                                  chatlistmodal
                                                                          ?.venue
                                                                          ?.name ==
                                                                      null
                                                              ? "N/A"
                                                              : chatlistmodal
                                                                      ?.venue
                                                                      ?.name ??
                                                                  "",
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              letterSpacing: 1,
                                                              fontFamily:
                                                                  'sofi',
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        Text(
                                                          chatlistmodal?.venue
                                                                      ?.lastChatMessageInfo ==
                                                                  null
                                                              ? ""
                                                              : DateFormat(
                                                                      'HH:mm')
                                                                  .format(DateTime.parse(chatlistmodal
                                                                          ?.venue
                                                                          ?.lastChatMessageInfo
                                                                          ?.createdAt ??
                                                                      "")),
                                                          style: TextStyle(
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily: 'soi',
                                                              color:
                                                                  Colors.black),
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
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily: 'soi',
                                                          color:
                                                              Colors.black54),
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
                                    : Container(),
                                sel1 == 1 ? SizedBox(height: 1.h) : Container(),
                                sel1 == 1
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        child: Divider(color: Colors.black87),
                                      )
                                    : Container(),
                                sel1 == 1
                                    ? Container()
                                    : threadlist?.data?.topicDetails?.length ==
                                            0
                                        ? Container()
                                        : Column(
                                            children: [
                                              for (int index = 0;
                                                  index <
                                                      (threadlist
                                                              ?.data
                                                              ?.topicDetails
                                                              ?.length ??
                                                          0);
                                                  index++) ...[
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 3.w,
                                                      vertical: 1.h),
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 1.h),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.white,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    1.w),
                                                        height: 7.h,
                                                        width: 15.w,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(90),
                                                          child:
                                                              CachedNetworkImage(
                                                            fit: BoxFit.cover,
                                                            imageUrl: threadlist
                                                                    ?.data
                                                                    ?.topicDetails?[
                                                                        index]
                                                                    .memberProfile
                                                                    ?.profile ??
                                                                "",
                                                            progressIndicatorBuilder:
                                                                (context, url,
                                                                        progress) =>
                                                                    CircularProgressIndicator(),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    Image.asset(
                                                              'assets/user.png',
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 60.w,
                                                                child: Text(
                                                                  threadlist
                                                                          ?.data
                                                                          ?.topicDetails?[
                                                                              index]
                                                                          .topicTitle ??
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
                                                              ),
                                                              SizedBox(
                                                                height: 1.h,
                                                              ),
                                                              SizedBox(
                                                                width: 60.w,
                                                                child: Text(
                                                                  threadlist
                                                                          ?.data
                                                                          ?.topicDetails?[
                                                                              index]
                                                                          .memberProfile
                                                                          ?.name ??
                                                                      "",
                                                                  maxLines: 2,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.sp,
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
                                                          InkWell(
                                                            onTap: () {
                                                              Get.to(ThreadPage(
                                                                id: threadlist
                                                                    ?.data
                                                                    ?.topicDetails?[
                                                                        index]
                                                                    .id,
                                                                name: threadlist
                                                                    ?.data
                                                                    ?.topicDetails?[
                                                                        index]
                                                                    .topicTitle,
                                                                img: threadlist
                                                                    ?.data
                                                                    ?.topicDetails?[
                                                                        index]
                                                                    .memberProfile
                                                                    ?.profile,
                                                              ));
                                                            },
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          5.sp),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  color: Colors
                                                                      .blue),
                                                              child:
                                                                  Image.asset(
                                                                "assets/bottom/5.png",
                                                                height: 2.5.h,
                                                                width: 5.w,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ]
                                            ],
                                          ),
                                SizedBox(height: 1.h),
                              ],
                            ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
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

  threadlistap() {
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().threadlistapi().then((response) async {
          threadlist = ThreadListModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && threadlist?.status == "1") {
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

  adtopicap() {
    final Map<String, String> data = {};
    data['id'] = userData?.user?.id ?? '';
    data['topic'] = _topic.text.toString();
    data['user_type'] =  'venue';
    data['member'] = (venuedetail?.venueDetails?.id).toString()
       ;
    print(data);

    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().Addtopicap(data).then((response) async {
          addtopic = AddTopicModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && addtopic?.status == "1") {
            setState(() {
              Fluttertoast.showToast(
                msg: 'Thread Started Successfully',
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 11.sp,
              );
              Get.to(ThreadPage(
                name: _topic.text,
                id: (addtopic?.data?.topicId).toString(),
                img: (addtopic?.data?.profile).toString(),
              ));
            });
          } else {}
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
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

  Supplierap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().SupDrop().then((response) async {
          dropsups = SupplierDropdownModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && dropsups?.status == "1") {
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
