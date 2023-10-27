import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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

  SupplierfourScreen(
      {super.key,
      required this.suppid,
      required this.catid,
      required this.service});

  @override
  State<SupplierfourScreen> createState() => _SupplierfourScreenState();
}

final GlobalKey<ScaffoldState> scaffoldKey26 = GlobalKey<ScaffoldState>();

class _SupplierfourScreenState extends State<SupplierfourScreen> {
  bool isLoading = true;
  TextEditingController _title = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                          text: "Supplier",
                          callback1: () {
                            scaffoldKey26.currentState?.openDrawer();
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
                                    color: Colors.blue),
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
                                imageUrl: supplierdetailmodal?.supplierInfo
                                                ?.images?.length ==
                                            0 ||
                                        supplierdetailmodal?.supplierInfo
                                                ?.images?.length ==
                                            null
                                    ? ''
                                    : supplierdetailmodal
                                            ?.supplierInfo?.images?[0] ??
                                        '',
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedNetworkImage(
                                imageUrl: "",
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
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Details :",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.blue,
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
                                  fontSize: 16.sp,
                                  fontFamily: 'sofi',
                                  color: Colors.black.withOpacity(0.65),
                                  fontWeight: FontWeight.w600,
                                  height: 0.15.h,
                                  letterSpacing: 1),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                        ],
                      ),
                      Text(
                        "Photos :",
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
                      Container(
                        height: 22.h,
                        child: supplierdetailmodal
                            ?.supplierInfo?.images?.length == 0 || supplierdetailmodal
                            ?.supplierInfo?.images?.length == null ?Center(
                            child: Text("No Images available",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontFamily: 'sofi',
                                    color: Colors.black))): ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: supplierdetailmodal
                                ?.supplierInfo?.images?.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 40.w,
                                margin: EdgeInsets.only(right: 3.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: supplierdetailmodal
                                            ?.supplierInfo?.images?[index] ??
                                        '',
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder:
                                        (context, url, progress) => Center(
                                            child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      'assets/defimg.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      supplierdetailmodal?.supplierInfo?.isBooked == '0'
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                supplierdetailmodal?.supplierInfo?.inBudget ==
                                        '0'
                                    ? InkWell(
                                        onTap: () {
                                          addtobudgetap();
                                        },
                                        child: Container(
                                          height: 5.h,
                                          width: 42.w,
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
                                                SizedBox(width: 1.w),
                                                Text(
                                                  "Add to Budget",
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
                                            border:
                                                Border.all(color: Colors.white),
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
                                supplierdetailmodal
                                            ?.supplierInfo?.isRequested ==
                                        '0'
                                    ? InkWell(
                                        onTap: () {
                                          Quote();
                                        },
                                        child: Container(
                                          height: 5.h,
                                          width: 48.w,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
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
                                            border:
                                                Border.all(color: Colors.white),
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
                            )
                          : Container(),
                      SizedBox(
                        height: 2.h,
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
                                    border: Border.all(color: Colors.white),
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
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['uid'] = (userData?.user?.id).toString();
      data['c_id'] = widget.catid.toString();
      data['s_id'] = widget.suppid.toString();
      data['q_comment'] = _title.text.toString();
      checkInternet().then((internet) async {
        if (internet) {
          taskprovider().quoteapi(data).then((response) async {
            sendquationmodal =
                SendQuationModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && sendquationmodal?.status == "1") {
              // Fluttertoast.showToast(
              //     msg: "Quote Requested Successfully",
              //     toastLength: Toast.LENGTH_SHORT,
              //     timeInSecForIosWeb: 1,
              //     backgroundColor: Colors.blue,
              //     textColor: Colors.white,
              //     fontSize: 11.sp);
              supplierdetailap();
              Get.back();
            } else {}
          });
        } else {
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    }
  }

  Quote() {
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
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 2.h),
                              // header(
                              //     text: "Add Your CheckList",
                              //     callback1: () {
                              //       scaffoldKey.currentState?.openDrawer();
                              //     }),
                              Center(
                                child: Text(
                                  'Add Comment',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'sofi',
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      height: 0.17.h,
                                      letterSpacing: 1),
                                ),
                              ),
                              SizedBox(height: 2.h),

                              TextFormField(
                                maxLines: 4,
                                controller: _title,
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter comment';
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
                                  hintText: 'Comment',
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.67),
                                      fontFamily: 'Meta1'),
                                ),
                              ),

                              SizedBox(height: 3.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      quotedetalis();
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
                                            'Send Quote Request',
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
