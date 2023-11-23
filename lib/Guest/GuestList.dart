import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wedding_planner/Guest/addguestlist.dart';
import 'package:wedding_planner/Modal/AddguestModal.dart';
import 'package:wedding_planner/Modal/MyvenuetableModal.dart';
import 'package:wedding_planner/Modal/RemoveguestModal.dart';
import 'package:wedding_planner/Modal/ViewguestModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../Modal/FloorDetalisModal.dart';

class GuestList extends StatefulWidget {
  const GuestList({super.key});

  @override
  State<GuestList> createState() => _GuestListState();
}

int sel1 = 1;

class test {
  String title;
  String id;

  test(this.title, this.id);
}

final GlobalKey<ScaffoldState> scaffoldKey12 = GlobalKey<ScaffoldState>();

class _GuestListState extends State<GuestList> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _relation = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isKeyboardOpen = false;
  String? selectedItem;
  MyvenuetableModal? myvenuetablemodal1;

  // final Uri _url = Uri.parse('https://www.google.com/');

  Future<void> _launchUrl(context, String Url) async {
    if (await launchUrl(
      Uri.parse(Url),
      mode: LaunchMode.externalApplication,
    )) {
    } else {
      throw buildErrorDialog(context, 'Error', "Please Use Valid Url");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      sel1 = 1;
    });
    viewguestap();
    Floorapi();
  }

  List<test> items = [];
  int? select = 0;
  int? select1 = 0;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
        key: scaffoldKey12,
        drawer: drawer1(),
        body: isLoading
            ? Container()
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      SizedBox(height: 5.h),
                      header(
                          text: "Guest List",
                          callback1: () {
                            scaffoldKey12.currentState?.openDrawer();
                          }),
                      // headerwid(text: "Guest List"),

                      SizedBox(height: 1.5.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                sel1 = 1;
                              });
                              viewguestap();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.3.h, horizontal: 10.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: sel1 == 1 ? Colors.blue : Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Text('Bride',
                                  style: TextStyle(
                                      fontSize: 14.5.sp,
                                      fontFamily: 'sofi',
                                      color: sel1 == 1
                                          ? Colors.white
                                          : Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1)),
                            ),
                          ),
                          SizedBox(width: 0.w),
                          InkWell(
                            onTap: () {
                              setState(() {
                                sel1 = 2;
                              });
                              viewguestap();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.3.h, horizontal: 10.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: sel1 == 2 ? Colors.blue : Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Text('Groom',
                                  style: TextStyle(
                                      fontSize: 14.5.sp,
                                      fontFamily: 'sofi',
                                      color: sel1 == 2
                                          ? Colors.white
                                          : Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      sel1 == 2
                          ? Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Groom\'s Guests (' +
                                          (viewguestmodal?.guestlist
                                                  ?.groomGuestList?.length)
                                              .toString() +
                                          ')',
                                      style: TextStyle(
                                          fontSize: 17.sp,
                                          fontFamily: 'sofi',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                    Text(
                                      'Remove',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: 'sofi',
                                          color:
                                              Colors.black87.withOpacity(0.7),
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                  ],
                                ),
                                viewguestmodal?.guestlist?.groomGuestList
                                            ?.length ==
                                        0
                                    ? Container(
                                        height: 70.h,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "No groom guest available",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontFamily: 'sofi',
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1),
                                        ),
                                      )
                                    : SizedBox(
                                        height: 70.h,
                                        child: Column(
                                          children: [
                                            SizedBox(height: 0.5.h),
                                            Container(
                                              height: 69.h,
                                              child: ListView.builder(
                                                itemCount: viewguestmodal
                                                    ?.guestlist
                                                    ?.groomGuestList
                                                    ?.length,
                                                padding: EdgeInsets.zero,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 3.w,
                                                            vertical: 1.h),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 1.h),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.white,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .person,
                                                                        color: Colors
                                                                            .blue,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            3.w,
                                                                      ),
                                                                      Text(
                                                                        viewguestmodal?.guestlist?.groomGuestList?[index].guestName == "" || viewguestmodal?.guestlist?.groomGuestList?[index].guestName == null
                                                                            ? "N/A"
                                                                            : viewguestmodal?.guestlist?.groomGuestList?[index].guestName ??
                                                                                "",
                                                                        style: TextStyle(
                                                                            fontSize: 15
                                                                                .sp,
                                                                            fontFamily:
                                                                                'sofi',
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight: FontWeight.bold,
                                                                            letterSpacing: 1),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top: 0.7
                                                                            .h),
                                                                    child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .phone,
                                                                          color:
                                                                              Colors.blue,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              3.w,
                                                                        ),
                                                                        Text(
                                                                          viewguestmodal?.guestlist?.groomGuestList?[index].guestContact == "" || viewguestmodal?.guestlist?.groomGuestList?[index].guestContact == null
                                                                              ? "N/A"
                                                                              : viewguestmodal?.guestlist?.groomGuestList?[index].guestContact ?? "",
                                                                          style: TextStyle(
                                                                              fontSize: 13.sp,
                                                                              fontFamily: 'sofi',
                                                                              color: Colors.black.withOpacity(0.67),
                                                                              fontWeight: FontWeight.bold,
                                                                              letterSpacing: 1),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top: 0.7
                                                                            .h),
                                                                    child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .email_outlined,
                                                                          color:
                                                                              Colors.blue,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              3.w,
                                                                        ),
                                                                        Text(
                                                                          viewguestmodal?.guestlist?.groomGuestList?[index].guestEmail == "" || viewguestmodal?.guestlist?.groomGuestList?[index].guestEmail == null
                                                                              ? "N/A"
                                                                              : viewguestmodal?.guestlist?.groomGuestList?[index].guestEmail ?? "",
                                                                          style: TextStyle(
                                                                              fontSize: 13.sp,
                                                                              fontFamily: 'sofi',
                                                                              color: Colors.black.withOpacity(0.67),
                                                                              fontWeight: FontWeight.bold,
                                                                              letterSpacing: 1),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                children: [
                                                                  IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        select =
                                                                            index;
                                                                      });
                                                                      showgroomdata();
                                                                    },
                                                                    icon: Icon(
                                                                      CupertinoIcons
                                                                          .info,
                                                                      color: Colors
                                                                          .blue,
                                                                    ),
                                                                  ),
                                                                  IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        select =
                                                                            index;
                                                                      });
                                                                      delet();
                                                                    },
                                                                    icon: Icon(
                                                                      CupertinoIcons
                                                                          .delete_solid,
                                                                      color: Colors
                                                                          .red,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ])
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        floordetalismodal?.data == null
                                            ? buildErrorDialog(context, "",
                                                "No Floors Available In Your Venue")
                                            : Get.to(Addguestlist(
                                                sel1: sel1,
                                              ));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 60.w,
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
                                              'Add Guests',
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
                              ],
                            )
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Bride\'s Guests (' +
                                          (viewguestmodal?.guestlist
                                                  ?.brideGuestList?.length)
                                              .toString() +
                                          ')',
                                      style: TextStyle(
                                          fontSize: 17.sp,
                                          fontFamily: 'sofi',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                    Text(
                                      'Remove',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: 'sofi',
                                          color:
                                              Colors.black87.withOpacity(0.7),
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                  ],
                                ),
                                viewguestmodal?.guestlist?.brideGuestList
                                            ?.length ==
                                        0
                                    ? Container(
                                        height: 70.h,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "No bride guest available",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontFamily: 'sofi',
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1),
                                        ),
                                      )
                                    : SizedBox(
                                        height: 70.h,
                                        child: Column(children: [
                                          SizedBox(height: 0.5.h),
                                          Container(
                                            height: 69.h,
                                            child: ListView.builder(
                                              itemCount: viewguestmodal
                                                  ?.guestlist
                                                  ?.brideGuestList
                                                  ?.length,
                                              padding: EdgeInsets.zero,
                                              itemBuilder: (context, index) {
                                                return Container(
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
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                        Icons
                                                                            .person,
                                                                        color: Colors
                                                                            .blue),
                                                                    SizedBox(
                                                                      width:
                                                                          3.w,
                                                                    ),
                                                                    Text(
                                                                      viewguestmodal?.guestlist?.brideGuestList?[index].guestName == "" ||
                                                                              viewguestmodal?.guestlist?.brideGuestList?[index].guestName ==
                                                                                  null
                                                                          ? "N/A"
                                                                          : viewguestmodal?.guestlist?.brideGuestList?[index].guestName ??
                                                                              "",
                                                                      style: TextStyle(
                                                                          fontSize: 15
                                                                              .sp,
                                                                          fontFamily:
                                                                              'sofi',
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          letterSpacing:
                                                                              1),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          top: 0.7
                                                                              .h),
                                                                  child: Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .phone,
                                                                        color: Colors
                                                                            .blue,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            3.w,
                                                                      ),
                                                                      Text(
                                                                        viewguestmodal?.guestlist?.brideGuestList?[index].guestContact == "" || viewguestmodal?.guestlist?.brideGuestList?[index].guestContact == null
                                                                            ? "N/A"
                                                                            : viewguestmodal?.guestlist?.brideGuestList?[index].guestContact ??
                                                                                "",
                                                                        style: TextStyle(
                                                                            fontSize: 13
                                                                                .sp,
                                                                            fontFamily:
                                                                                'sofi',
                                                                            color:
                                                                                Colors.black.withOpacity(0.67),
                                                                            fontWeight: FontWeight.bold,
                                                                            letterSpacing: 1),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          top: 0.7
                                                                              .h),
                                                                  child: Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .email_outlined,
                                                                        color: Colors
                                                                            .blue,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            3.w,
                                                                      ),
                                                                      Text(
                                                                        viewguestmodal?.guestlist?.brideGuestList?[index].guestEmail == "" || viewguestmodal?.guestlist?.brideGuestList?[index].guestEmail == null
                                                                            ? "N/A"
                                                                            : viewguestmodal?.guestlist?.brideGuestList?[index].guestEmail ??
                                                                                "",
                                                                        style: TextStyle(
                                                                            fontSize: 13
                                                                                .sp,
                                                                            fontFamily:
                                                                                'sofi',
                                                                            color:
                                                                                Colors.black.withOpacity(0.67),
                                                                            fontWeight: FontWeight.bold,
                                                                            letterSpacing: 1),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                // Padding(
                                                                //   padding: EdgeInsets
                                                                //       .only(
                                                                //           top: 0.7
                                                                //               .h),
                                                                //   child: Row(
                                                                //     crossAxisAlignment:
                                                                //         CrossAxisAlignment
                                                                //             .center,
                                                                //     children: [
                                                                //       Icon(
                                                                //         Icons
                                                                //             .bed_rounded,
                                                                //         size: 20
                                                                //             .sp,
                                                                //         color: Colors
                                                                //             .blue,
                                                                //       ),
                                                                //       SizedBox(
                                                                //         width:
                                                                //             3.w,
                                                                //       ),
                                                                //       InkWell(
                                                                //         onTap:
                                                                //             () {
                                                                //           String
                                                                //               brideUrl =
                                                                //               'https://www.pexels.com/search/bride/';
                                                                //           print(
                                                                //               'Bride Link Tapped');
                                                                //           _launchUrl(
                                                                //               context,
                                                                //               brideUrl);
                                                                //           print(
                                                                //               brideUrl);
                                                                //         },
                                                                //         child:
                                                                //             Text(
                                                                //           'Accommodation Link',
                                                                //           style: TextStyle(
                                                                //               fontSize: 15.sp,
                                                                //               fontFamily: 'sofi',
                                                                //               color: Colors.blue,
                                                                //               fontWeight: FontWeight.bold,
                                                                //               letterSpacing: 1),
                                                                //         ),
                                                                //       ),
                                                                //     ],
                                                                //   ),
                                                                // ),
                                                              ],
                                                            ),
                                                            Column(
                                                              children: [
                                                                IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      select =
                                                                          index;
                                                                    });
                                                                    showbridedata();
                                                                  },
                                                                  icon: Icon(
                                                                    CupertinoIcons
                                                                        .info,
                                                                    color: Colors
                                                                        .blue,
                                                                  ),
                                                                ),
                                                                IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      select =
                                                                          index;
                                                                    });
                                                                    delet();
                                                                  },
                                                                  icon: Icon(
                                                                    CupertinoIcons
                                                                        .delete_solid,
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ])
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ]),
                                      ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        floordetalismodal?.data == null
                                            ? buildErrorDialog(context, "",
                                                "No Floors Available In Your Venue")
                                            : Get.to(Addguestlist(
                                                sel1: sel1,
                                              ));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 60.w,
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
                                              'Add Guests',
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
                              ],
                            ),
                    ],
                  ),
                ),
              ),
      ),
      isLoading: isLoading,
    );
  }

  showbridedata() {
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
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        'Bride\'s Guest',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontFamily: 'sofi',
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            height: 0.17.h,
                            letterSpacing: 1),
                      ),
                    ]),
                    SizedBox(height: 2.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(CupertinoIcons.person_alt,
                            color: Colors.blue, size: 17.sp),
                        SizedBox(width: 1.w),
                        Text(
                          'Guest Name :  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                        SizedBox(
                          width: 50.w,
                          child: Text(
                            (viewguestmodal?.guestlist?.brideGuestList?[select!]
                                    .guestName)
                                .toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'sofi',
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                height: 0.17.h,
                                letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.blue, size: 17.sp),
                        SizedBox(width: 1.w),
                        Text(
                          'Guest Phone No :  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                        Text(
                          (viewguestmodal?.guestlist?.brideGuestList?[select!]
                                  .guestContact)
                              .toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'sofi',
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.mail_outline,
                            color: Colors.blue, size: 17.sp),
                        SizedBox(width: 1.w),
                        Text(
                          'Guest Email :  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                        SizedBox(
                          width: 50.w,
                          child: Text(
                            (viewguestmodal?.guestlist?.brideGuestList?[select!]
                                    .guestEmail)
                                .toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'sofi',
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                height: 0.17.h,
                                letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.room_preferences_outlined,
                            color: Colors.blue, size: 17.sp),
                        SizedBox(width: 1.w),
                        Text(
                          'Guest Floor :  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                        SizedBox(
                          width: 50.w,
                          child: Text(
                            viewguestmodal?.guestlist?.brideGuestList?[select!]
                                        .floorName ==
                                    null
                                ? 'N/A'
                                : (viewguestmodal
                                        ?.guestlist
                                        ?.brideGuestList?[select!]
                                        .floorName
                                        ?.floorName)
                                    .toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'sofi',
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                height: 0.17.h,
                                letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.table_restaurant_outlined,
                            color: Colors.blue, size: 17.sp),
                        SizedBox(width: 1.w),
                        Text(
                          'Guest Table :  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                        SizedBox(
                          width: 50.w,
                          child: Text(
                            (viewguestmodal?.guestlist?.brideGuestList?[select!]
                                    .tableName?.name)
                                .toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'sofi',
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                height: 0.17.h,
                                letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                    viewguestmodal?.guestlist?.brideGuestList?[select!]
                                .accomodationLink ==
                            null
                        ? Container()
                        : Column(
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.bed_rounded,
                                      color: Colors.blue, size: 20.sp),
                                  SizedBox(width: 1.w),
                                  Text(
                                    'Accommodation :  ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: 'sofi',
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        height: 0.17.h,
                                        letterSpacing: 1),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _launchUrl(
                                          context,
                                          (viewguestmodal
                                                  ?.guestlist
                                                  ?.brideGuestList?[select!]
                                                  .accomodationLink)
                                              .toString());
                                      print((viewguestmodal
                                              ?.guestlist
                                              ?.brideGuestList?[select!]
                                              .accomodationLink)
                                          .toString());
                                    },
                                    child: SizedBox(
                                      child: Text(
                                        'Click Here',
                                        // sel1 == 1
                                        //     ? (viewguestmodal?.guestlist?.brideGuestList?[select!].guestEmail).toString()
                                        //     : (viewguestmodal?.guestlist?.groomGuestList?[select!].guestEmail).toString() ,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            fontFamily: 'sofi',
                                            color: Colors.purple,
                                            fontWeight: FontWeight.bold,
                                            height: 0.17.h,
                                            letterSpacing: 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                    SizedBox(height: 3.h),
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

  showgroomdata() {
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
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        'Groom\'s Guest',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontFamily: 'sofi',
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            height: 0.17.h,
                            letterSpacing: 1),
                      ),
                    ]),
                    SizedBox(height: 2.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(CupertinoIcons.person_alt,
                            color: Colors.blue, size: 17.sp),
                        SizedBox(width: 1.w),
                        Text(
                          'Guest Name :  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                        SizedBox(
                          width: 50.w,
                          child: Text(
                            (viewguestmodal?.guestlist?.groomGuestList?[select!]
                                    .guestName)
                                .toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'sofi',
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                height: 0.17.h,
                                letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.blue, size: 17.sp),
                        SizedBox(width: 1.w),
                        Text(
                          'Guest Phone No :  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                        Text(
                          (viewguestmodal?.guestlist?.groomGuestList?[select!]
                                  .guestContact)
                              .toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'sofi',
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.mail_outline,
                            color: Colors.blue, size: 17.sp),
                        SizedBox(width: 1.w),
                        Text(
                          'Guest Email :  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                        SizedBox(
                          width: 50.w,
                          child: Text(
                            (viewguestmodal?.guestlist?.groomGuestList?[select!]
                                    .guestEmail)
                                .toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'sofi',
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                height: 0.17.h,
                                letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.room_preferences_outlined,
                            color: Colors.blue, size: 17.sp),
                        SizedBox(width: 1.w),
                        Text(
                          'Guest Floor :  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                        SizedBox(
                          width: 50.w,
                          child: Text(
                            viewguestmodal?.guestlist?.groomGuestList?[select!]
                                        .floorName ==
                                    null
                                ? 'N/A'
                                : (viewguestmodal
                                        ?.guestlist
                                        ?.groomGuestList?[select!]
                                        .floorName
                                        ?.floorName)
                                    .toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'sofi',
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                height: 0.17.h,
                                letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.table_restaurant_outlined,
                            color: Colors.blue, size: 17.sp),
                        SizedBox(width: 1.w),
                        Text(
                          'Guest Table :  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                        SizedBox(
                          width: 50.w,
                          child: Text(
                            (viewguestmodal?.guestlist?.groomGuestList?[select!]
                                    .tableName?.name)
                                .toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'sofi',
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                height: 0.17.h,
                                letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                    viewguestmodal?.guestlist?.groomGuestList?[select!]
                                .accomodationLink ==
                            null
                        ? Container()
                        : Column(
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.bed_rounded,
                                      color: Colors.blue, size: 20.sp),
                                  SizedBox(width: 1.w),
                                  Text(
                                    'Accommodation :  ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: 'sofi',
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        height: 0.17.h,
                                        letterSpacing: 1),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _launchUrl(
                                          context,
                                          (viewguestmodal
                                                  ?.guestlist
                                                  ?.groomGuestList?[select!]
                                                  .accomodationLink)
                                              .toString());
                                      print((viewguestmodal
                                              ?.guestlist
                                              ?.groomGuestList?[select!]
                                              .accomodationLink)
                                          .toString());
                                    },
                                    child: SizedBox(
                                      child: Text(
                                        'Click Here',
                                        // sel1 == 1
                                        //     ? (viewguestmodal?.guestlist?.brideGuestList?[select!].guestEmail).toString()
                                        //     : (viewguestmodal?.guestlist?.groomGuestList?[select!].guestEmail).toString() ,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            fontFamily: 'sofi',
                                            color: Colors.purple,
                                            fontWeight: FontWeight.bold,
                                            height: 0.17.h,
                                            letterSpacing: 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                    SizedBox(height: 3.h),
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
          hintText: 'Guest Name',
          hintStyle: TextStyle(color: Colors.black, fontFamily: 'Meta1'),
        ),
      ),
    );
  }

  addguestap() {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['guest_name'] = _name.text.toString();
      data['guest_email'] = _email.text.toString();
      data['guest_phone'] = _phone.text.toString();
      data['bride_or_groom'] = sel1 == 1 ? "bride " : "groom";
      data['guest_relation'] = _relation.text.toString();
      data['guest_table_id '] = (selectedItem).toString();
      data['guest_seat_no '] = "";
      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          taskprovider().addguestapi(data).then((response) async {
            addguestmodal = AddguestModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && addguestmodal?.status == "1") {
              print(addguestmodal?.message);
              _name.text = "";
              _phone.text = "";
              _email.text = "";
              _relation.text = "";
              viewguestap();
              Get.back();
            } else {}
          });
        } else {
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    }
  }

  viewguestap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().viewguestapi().then((response) async {
          viewguestmodal = ViewguestModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && viewguestmodal?.status == "1") {
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

  delet() {
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
                      sel1 == 1
                          ? 'Are You Sure You Want to Delete This Bride\'s Guest ?'
                          : 'Are You Sure You Want to Delete This Groom\'s Guest ?',
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
                                  deletap();
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

  deletap() {
    String? value = sel1 == 1
        ? (viewguestmodal?.guestlist?.brideGuestList?[select!].id)
        : viewguestmodal?.guestlist?.groomGuestList?[select!].id;
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().removeguestapi(value).then((response) async {
          removeguestmodal =
              RemoveguestModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && removeguestmodal?.status == "1") {
            print(removeguestmodal?.message);
            viewguestap();
            Get.back();
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

  Floorapi() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().FloorplansList().then((response) async {
          floordetalismodal =
              FloorDetalisModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && floordetalismodal?.status == "1") {
            setState(() {
              // isLoading = false;
            });
          } else {
            // setState(() {
            //   isLoading = false;
            // });
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  tableapi(String Fid) {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().myvenuetableapi(Fid).then((response) async {
          myvenuetablemodal1 =
              MyvenuetableModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && myvenuetablemodal1?.status == "1") {
            setState(() {
              print(items);
              items;
              // isLoading = false;
            });
          } else {
            // setState(() {
            //   isLoading = false;
            // });
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
