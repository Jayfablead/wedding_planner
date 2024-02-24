import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/drawer.dart';

import '../Modal/ViewDeliversModal.dart';
import '../Provider/taskprovider.dart';
import '../widgets/buildErrorDialog.dart';
import '../widgets/const.dart';
import '../widgets/headerwidget.dart';
import '../widgets/load.dart';

class MyDeliveriesCollentionsViewScreen extends StatefulWidget {
  String? id;
  MyDeliveriesCollentionsViewScreen({super.key,this.id});

  @override
  State<MyDeliveriesCollentionsViewScreen> createState() =>
      _MyDeliveriesCollentionsViewScreenState();
}

final GlobalKey<ScaffoldState> scaffoldKey27 = GlobalKey<ScaffoldState>();
final controller = PageController(viewportFraction: 0.8, keepPage: true);
List HotelIm = [
  'https://i0.wp.com/decorsutrablog.com/wp-content/uploads/2020/06/DecorSutra_Wedding-Decor-9_Royal-Decor.jpg?fit=780%2C425&ssl=1',
  'https://i.pinimg.com/originals/2f/10/f6/2f10f6363ce6fd2461cec2bd46dbc916.jpg',
  'https://fancdesigns.com/wp-content/uploads/2016/08/royal-decorations-40-royal-wedding-decorations-2246-x-1162-1.jpg',
  'https://i0.wp.com/eventertainments.com/blog/wp-content/uploads/2021/03/Best-Wedding-Stage-Decoration-with-Flowers.jpg?fit=1200%2C900&ssl=1',
  'https://cdn0.weddingwire.in/vendor/8241/3_2/960/jpg/img-20180903-wa0013_15_158241.jpeg',
  'https://www.dreamzkraft.com/admin/blog-images/big/decoration-for-wedding/wedding-decoration%E2%80%93royal-2.jpg',
];
int ind = 0;
bool isLoad = true;
class _MyDeliveriesCollentionsViewScreenState
    extends State<MyDeliveriesCollentionsViewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      ind = 0;
    });
    viewdilevery();

  }

  // bool isLoading = true;
  CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoad,
      scaffold:Scaffold(
        backgroundColor: Colors.grey.shade100,
        key: scaffoldKey27,
        drawer: drawer1(),
        body: isLoad?Container():Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Center(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 6.h,
                      ),
                      header(
                          text: "Deliveries Details",
                          callback1: () {
                            scaffoldKey27.currentState?.openDrawer();
                          }),
                      SizedBox(height: 1.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 1.5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 90.w,
                                      height: 10.h,
                                      padding: EdgeInsets.only(left: 2.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(3.w),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(7),
                                                color: Colors.blue),
                                            child: Icon(
                                              CupertinoIcons.person,
                                              color: Colors.white,
                                              size: 18.sp,
                                            ),
                                          ),
                                          SizedBox(width: 5.w),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Delivery Company Name : ',
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: Colors.blue,
                                                    fontFamily: 'sofi',
                                                    letterSpacing: 1,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(height: 0.5.h),
                                              SizedBox(
                                                width: 45.w,
                                                child: Text(
                                                  viewdeliversmodal?.data?.company ==""||viewdeliversmodal?.data?.company==null?"N/A" :viewdeliversmodal?.data?.company ?? "" ,
                                                  style: TextStyle(
                                                      fontSize: 15.sp,
                                                      color: Colors.black
                                                          .withOpacity(0.8),
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1.5.h),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 90.w,
                                          height: 10.h,
                                          padding: EdgeInsets.only(left: 2.w),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(15),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(3.w),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(7),
                                                    color: Colors.blue),
                                                child: Icon(
                                                  CupertinoIcons.info,
                                                  color: Colors.white,
                                                  size: 18.sp,
                                                ),
                                              ),
                                              SizedBox(width: 5.w),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Event Name : ',
                                                    style: TextStyle(
                                                        fontSize: 17.sp,
                                                        color: Colors.blue,
                                                        fontFamily: 'sofi',
                                                        letterSpacing: 1,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                  SizedBox(height: 0.5.h),
                                                  SizedBox(
                                                    width: 52.w,
                                                    child: Text(
                                                      viewdeliversmodal?.data?.eventName=="" ||viewdeliversmodal?.data?.eventName==null?"N/A":viewdeliversmodal?.data?.eventName ?? "",
                                                      style: TextStyle(
                                                          fontSize: 15.sp,
                                                          color: Colors.black
                                                              .withOpacity(0.8),
                                                          fontFamily: 'sofi',
                                                          letterSpacing: 1,
                                                          fontWeight:
                                                          FontWeight.bold),
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
                              ],
                            ),
                            SizedBox(height: 1.5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 90.w,
                                  height: 10.h,
                                  padding: EdgeInsets.only(left: 2.15.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(3.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(7),
                                            color: Colors.blue),
                                        child: Icon(
                                          CupertinoIcons.phone,
                                          color: Colors.white,
                                          size: 18.sp,
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Contact : ',
                                            style: TextStyle(
                                                fontSize: 17.sp,
                                                color: Colors.blue,
                                                fontFamily: 'sofi',
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 0.5.h),
                                          Text(
                                            viewdeliversmodal?.data?.contactDetails==""||viewdeliversmodal?.data?.contactDetails==null?"N/A":viewdeliversmodal?.data?.contactDetails ?? "",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color:
                                                Colors.black.withOpacity(0.8),
                                                fontFamily: 'sofi',
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 90.w,
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(3.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(7),
                                            color: Colors.blue),
                                        child: Icon(
                                          CupertinoIcons.person_2,
                                          color: Colors.white,
                                          size: 18.sp,
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Items: ',
                                            style: TextStyle(
                                                fontSize: 17.sp,
                                                color: Colors.blue,
                                                fontFamily: 'sofi',
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 0.5.h),
                                          SizedBox(
                                            width: 67.w,
                                            child: Text(
                                              viewdeliversmodal?.data?.items==""||viewdeliversmodal?.data?.items==null?"N/A":viewdeliversmodal?.data?.items ?? "",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  fontFamily: 'sofi',
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 90.w,
                                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(3.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(7),
                                            color: Colors.blue),
                                        child: Icon(
                                          Icons.message_rounded,
                                          color: Colors.white,
                                          size: 18.sp,
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Comments: ',
                                            style: TextStyle(
                                                fontSize: 17.sp,
                                                color: Colors.blue,
                                                fontFamily: 'sofi',
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 0.5.h),
                                          SizedBox(
                                            width: 67.w,
                                            child: Text(
                                              viewdeliversmodal?.data?.comments==""||viewdeliversmodal?.data?.comments==null?"N/A":viewdeliversmodal?.data?.comments ?? "",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  fontFamily: 'sofi',
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 90.w,
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(3.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(7),
                                            color: Colors.blue),
                                        child: Icon(
                                          Icons.date_range,
                                          color: Colors.white,
                                          size: 18.sp,
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Scheduled Date: ',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color: Colors.blue,
                                                fontFamily: 'sofi',
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 0.5.h),
                                          SizedBox(
                                            width: 67.w,
                                            child: Text(
                                              viewdeliversmodal?.data?.scheduledDate==""||viewdeliversmodal?.data?.scheduledDate==null?"N/A":viewdeliversmodal?.data?.scheduledDate ?? "",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  fontFamily: 'sofi',
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.5.h),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Container(
                            //       width: 90.w,
                            //       height: 10.h,
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(15),
                            //         color: Colors.white,
                            //       ),
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         crossAxisAlignment: CrossAxisAlignment.center,
                            //         children: [
                            //           Container(
                            //             padding: EdgeInsets.all(3.w),
                            //             decoration: BoxDecoration(
                            //                 borderRadius:
                            //                     BorderRadius.circular(7),
                            //                 color: Colors.blue),
                            //             child: Icon(
                            //               Icons.person_search_outlined,
                            //               color: Colors.white,
                            //               size: 18.sp,
                            //             ),
                            //           ),
                            //           SizedBox(width: 5.w),
                            //           Column(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.center,
                            //             children: [
                            //               Text(
                            //                 'Delivery or Collection : ',
                            //                 style: TextStyle(
                            //                     fontSize: 16.sp,
                            //                     color: Colors.blue,
                            //                     fontFamily: 'sofi',
                            //                     letterSpacing: 1,
                            //                     fontWeight: FontWeight.bold),
                            //               ),
                            //               SizedBox(height: 0.5.h),
                            //               SizedBox(
                            //                 width: 67.w,
                            //                 child: Text(
                            //                   viewdeliversmodal?.data?.de ?? "",
                            //                   style: TextStyle(
                            //                       fontSize: 15.sp,
                            //                       color: Colors.black
                            //                           .withOpacity(0.8),
                            //                       fontFamily: 'sofi',
                            //                       letterSpacing: 1,
                            //                       fontWeight: FontWeight.bold),
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // SizedBox(height: 1.5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 90.w,
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(3.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(7),
                                            color: Colors.blue),
                                        child: Icon(
                                          Icons.access_time,
                                          color: Colors.white,
                                          size: 18.sp,
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Time : ',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color: Colors.blue,
                                                fontFamily: 'sofi',
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 0.5.h),
                                          SizedBox(
                                            width: 67.w,
                                            child: Text(
                                              viewdeliversmodal?.data?.updatedAt==""||viewdeliversmodal?.data?.updatedAt==null?"N/A":viewdeliversmodal?.data?.updatedAt ?? "",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  fontFamily: 'sofi',
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 90.w,
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(3.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(7),
                                            color: Colors.blue),
                                        child: Icon(
                                          Icons.delivery_dining,
                                          color: Colors.white,
                                          size: 18.sp,
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Delivery Status: ',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color: Colors.blue,
                                                fontFamily: 'sofi',
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 0.5.h),
                                          SizedBox(
                                            width: 67.w,
                                            child: Text(
                                              viewdeliversmodal?.data?.isCompleted==""||viewdeliversmodal?.data?.isCompleted==null?"N/A":viewdeliversmodal?.data?.isCompleted=="1"?"Completed":"Pending",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  fontFamily: 'sofi',
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.5.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 3.h),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  viewdilevery() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().viewdeliveryapi(widget.id ?? "").then((response) async {
          viewdeliversmodal = ViewDeliversModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && viewdeliversmodal?.status == "Success") {
            print('done ');
            setState(() {
              isLoad = false;
            });
          } else {
            setState(() {
              isLoad = false;
            });
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
        setState(() {
          isLoad = false;
        });
      }
    });
  }


}
