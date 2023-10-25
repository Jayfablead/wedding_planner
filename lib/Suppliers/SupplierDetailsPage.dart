import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Chat/msg2.dart';
import 'package:wedding_planner/Modal/AddtobudgetModal.dart';
import 'package:wedding_planner/Modal/SendQuationModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/bookings/BookNowDetails.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../Modal/SupplierdetailModal.dart';

class SupplierfourScreen extends StatefulWidget {
  String? suppid;
  String? catid;
  String? service;

  SupplierfourScreen({super.key, this.suppid, this.catid, this.service});

  @override
  State<SupplierfourScreen> createState() => _SupplierfourScreenState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _SupplierfourScreenState extends State<SupplierfourScreen> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    supplierdetailap();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
        key: scaffoldKey,
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
                          text: "Supplier",
                          callback1: () {
                            scaffoldKey.currentState?.openDrawer();
                          }),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.service == ''
                                    ? 'N/A'
                                    : widget.service.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19.sp,
                                    fontFamily: 'sofi',
                                    letterSpacing: 1,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 0.5.h),
                              Text(
                                supplierdetailmodal?.supplierInfo?.name == ''
                                    ? 'N/A'
                                    : supplierdetailmodal?.supplierInfo?.name ??
                                        "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'sofi',
                                    letterSpacing: 1,
                                    fontSize: 17.sp,
                                    color: Colors.black.withOpacity(0.75)),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            height: 8.5.h,
                            width: 18.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl:
                                    (supplierdetailmodal?.supplierInfo?.profile)
                                        .toString(),
                                progressIndicatorBuilder: (context, url,
                                        progress) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  'assets/user.png',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            height: 33.h,
                            width: MediaQuery.of(context).size.width,
                            child: CachedNetworkImage(
                              imageUrl:
                                  supplierdetailmodal?.supplierInfo?.profile ??
                                      "",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Image.asset('assets/defimg.jpg'),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Details",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.black,
                                    fontFamily: 'sofi',
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(Msg2(
                                    id: supplierdetailmodal?.supplierInfo?.id ??
                                        "",
                                    name: supplierdetailmodal
                                            ?.supplierInfo?.name ??
                                        "",
                                    img: supplierdetailmodal
                                            ?.supplierInfo?.profile ??
                                        "",
                                  ));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(2.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.blue),
                                  child: Icon(
                                    Icons.chat,
                                    color: Colors.white,
                                    size: 18.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            // height: 20.h,
                            width: 90.w,
                            child: Text(
                              supplierdetailmodal?.supplierInfo?.description ==
                                          '' ||
                                      supplierdetailmodal
                                              ?.supplierInfo?.description ==
                                          null
                                  ? 'N/A'
                                  : supplierdetailmodal
                                          ?.supplierInfo?.description ??
                                      "",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: 'sofi',
                                  color: Colors.black.withOpacity(0.65),
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          supplierdetailmodal?.supplierInfo?.inBudget == '0'
                              ? InkWell(
                                  onTap: () {
                                    addtobudgetap();
                                  },
                                  child: Container(
                                    height: 5.h,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 3.w),
                                          Text(
                                            "Add Budget",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 5.h,
                                    width: 45.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Added To Budget",
                                        style: TextStyle(
                                            color: Colors.blue.shade300,
                                            fontSize: 14.sp),
                                      ),
                                    ),
                                  ),
                                ),
                          supplierdetailmodal?.supplierInfo?.isRequested == '0'
                              ? InkWell(
                                  onTap: () {
                                    quotedetalis();
                                  },
                                  child: Container(
                                    height: 5.h,
                                    width: 48.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      color: Colors.blue,
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Send Quote Request",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp),
                                      ),
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 5.h,
                                    width: 45.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Quote Requested",
                                        style: TextStyle(
                                            color: Colors.blue.shade300,
                                            fontSize: 14.sp),
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      supplierdetailmodal?.supplierInfo?.isBooked == '0'
                          ? Center(
                              child: InkWell(
                                onTap: () {
                                  Get.to(BookNowDetails(
                                    name:
                                        supplierdetailmodal?.supplierInfo?.name,
                                    email: supplierdetailmodal
                                        ?.supplierInfo?.email,
                                    cid: supplierdetailmodal
                                        ?.supplierInfo?.services?.categoryId,
                                    photo: supplierdetailmodal
                                        ?.supplierInfo?.profile,
                                    sername: widget.service,
                                    sid: supplierdetailmodal
                                        ?.supplierInfo?.services?.sId,
                                  ));
                                },
                                child: Container(
                                  height: 5.5.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Book Now",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14.sp),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Center(
                              child: InkWell(
                                child: Container(
                                  height: 5.5.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Booked",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 14.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  supplierdetailap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider()
            .supplierdetailapi(widget.suppid, widget.catid)
            .then((response) async {
          supplierdetailmodal =
              SupplierdetailModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              supplierdetailmodal?.status == "1") {
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

  addtobudgetap() {
    final Map<String, String> data = {};
    data['uid'] = (userData?.user?.id).toString();
    data['category_id'] = widget.catid.toString();
    data['supplier_id'] = widget.suppid.toString();
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().addtobudgetapi(data).then((response) async {
          addtobudgetmodal =
              AddtobudgetModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && addtobudgetmodal?.status == "1") {
            Fluttertoast.showToast(
                msg: "Added To Budget Successfully",
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 11.sp);
            supplierdetailap();
            print(supplierdetailmodal?.supplierInfo?.inBudget);
          } else {}
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  quotedetalis() {
    final Map<String, String> data = {};
    data['uid'] = (userData?.user?.id).toString();
    data['c_id'] = widget.catid.toString();
    data['s_id'] = widget.suppid.toString();
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().quoteapi(data).then((response) async {
          sendquationmodal =
              SendQuationModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && sendquationmodal?.status == "1") {
            Fluttertoast.showToast(
                msg: "Quote Requested Successfully",
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                fontSize: 11.sp);
            supplierdetailap();
          } else {}
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
