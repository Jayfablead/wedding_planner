import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/VenueDetalisModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

class FloorDetalisScreen extends StatefulWidget {
  String? id;

  FloorDetalisScreen({required this.id, super.key});

  @override
  State<FloorDetalisScreen> createState() => _FloorDetalisScreenState();
}

final GlobalKey<ScaffoldState> scaffoldKey26 = GlobalKey<ScaffoldState>();

class _FloorDetalisScreenState extends State<FloorDetalisScreen> {
  bool isLoading = true;
  TextEditingController _title = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    venuedetalisvenue();
  }

  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
        key: scaffoldKey26,
        drawer: drawer1(),
        body: isLoading
            ? Container()
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),
                      header(
                          text: "FloorDetalis",
                          callback1: () {
                            scaffoldKey26.currentState?.openDrawer();
                          }),
                      SizedBox(
                        height: 1.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Stack(
                                    children: [
                                      Center(
                                        child: Container(
                                          height: 40.h,
                                          width: 100.w,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(4.w),
                                          margin: EdgeInsets.only(top: 1.h),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: CachedNetworkImage(
                                              imageUrl: (venuedetalismodal
                                                      ?.data?.floorPlan)
                                                  .toString(),
                                              width: 100.w,
                                              // height: 90.h,
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                  ),
                                                ),
                                              ),
                                              placeholder: (context, url) => Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 83.5.w,
                                        top: 3.h,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(90),
                                                  color: Colors.blue,
                                                  border: Border.all(
                                                      color: Colors.blue)),
                                              padding: EdgeInsets.all(2.w),
                                              child: Icon(
                                                Icons.close_rounded,
                                                size: 22.sp,
                                                color: Colors.white,
                                              )),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              height: 33.h,
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      venuedetalismodal?.data?.floorPlan ?? "",
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Image.asset('assets/defimg.jpg'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(3.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.blue),
                                child: Icon(
                                  Icons.business,
                                  color: Colors.white,
                                  size: 18.sp,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Floor Name :",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.blue,
                                        fontFamily: 'sofi',
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    (venuedetalismodal?.data?.floorName) ==
                                                "" ||
                                            (venuedetalismodal
                                                    ?.data?.floorName) ==
                                                null
                                        ? "N/A"
                                        : (venuedetalismodal?.data?.floorName)
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.black.withOpacity(0.65),
                                        fontFamily: 'sofi',
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(3.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.blue),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 18.sp,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Venue Name :",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.blue,
                                        fontFamily: 'sofi',
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    venuedetalismodal?.data?.venue?.vName ==
                                                "" ||
                                            venuedetalismodal
                                                    ?.data?.venue?.vName ==
                                                null
                                        ? "N/A"
                                        : venuedetalismodal
                                                ?.data?.venue?.vName ??
                                            "",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.black.withOpacity(0.65),
                                        fontFamily: 'sofi',
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(3.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.blue),
                                child: Icon(
                                  Icons.business_sharp,
                                  color: Colors.white,
                                  size: 18.sp,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Floor Capacity :",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.blue,
                                        fontFamily: 'sofi',
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    venuedetalismodal?.data?.floorCapacity ==
                                                "" ||
                                            venuedetalismodal
                                                    ?.data?.floorCapacity ==
                                                null
                                        ? "N/A"
                                        : venuedetalismodal
                                                ?.data?.floorCapacity ??
                                            "",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.black.withOpacity(0.65),
                                        fontFamily: 'sofi',
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(3.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.blue),
                                child: Icon(
                                  Icons.description,
                                  color: Colors.white,
                                  size: 18.sp,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "Details :",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.blue,
                                    fontFamily: 'sofi',
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            // height: 20.h,
                            width: 90.w,
                            child: ReadMoreText(
                              venuedetalismodal?.data?.floorDesc == "" ||
                                      venuedetalismodal?.data?.floorDesc == null
                                  ? ""
                                  : venuedetalismodal?.data?.floorDesc ?? "",
                              trimLines: 2,
                              colorClickableText: Colors.pink,
                              trimMode: TrimMode.Line,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'sofi',
                                  color: Colors.black.withOpacity(0.65),
                                  fontSize: 16.sp),
                              trimCollapsedText: 'Read more',
                              trimExpandedText: '  Read less',
                              lessStyle: TextStyle(
                                  height: 0.15.h,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'sofi',
                                  color: Colors.blue,
                                  fontSize: 14.sp),
                              moreStyle: TextStyle(
                                  height: 0.15.h,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'sofi',
                                  color: Colors.blue,
                                  fontSize: 14.sp),
                            ),
                            // Text(
                            //   supplierdetailmodal?.supplierInfo?.description ==
                            //           supplierdetailmodal
                            //                   ?.supplierInfo?.description ==
                            //               null
                            //       ? 'N/A'
                            //       : supplierdetailmodal
                            //               ?.supplierInfo?.description ??
                            //           "",
                            //   textAlign: TextAlign.justify,
                            //   style: TextStyle(
                            //       fontSize: 16.sp,
                            //       fontFamily: 'sofi',
                            //       color: Colors.black.withOpacity(0.65),
                            //       fontWeight: FontWeight.w600,
                            //       height: 0.15.h,
                            //       letterSpacing: 1),
                            // ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  venuedetalisvenue() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().venuedetaliapi(widget.id ?? '').then((response) async {
          venuedetalismodal =
              VenueDetalisModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && venuedetalismodal?.status == "1") {
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
