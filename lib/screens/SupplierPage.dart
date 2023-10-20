import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../Modal/SupplierdetailModal.dart';

class SupplierfourScreen extends StatefulWidget {
  String? suppid;
  String? catid;
  SupplierfourScreen({super.key,this.suppid,this.catid});

  @override
  State<SupplierfourScreen> createState() => _SupplierfourScreenState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _SupplierfourScreenState extends State<SupplierfourScreen> {
  bool isLoading =true;
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
        key: scaffoldKey,
        drawer: drawer1(),
        body:isLoading?Container(): SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     IconButton(
                //         onPressed: () {
                //           Get.back();
                //         },
                //         icon: Icon(Icons.arrow_back_ios_new_rounded)),
                //     Text(
                //       "Supplier",
                //       style: TextStyle(
                //         fontSize: 15.sp,
                //         fontFamily: 'sofi',
                //         letterSpacing: 1,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     IconButton(
                //         onPressed: () {
                //           scaffoldKey.currentState?.openDrawer();
                //         },
                //         icon: Icon(Icons.menu_rounded))
                //   ],
                // ),
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
                          supplierdetailmodal?.supplierInfo?.name ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: Colors.black),
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
                          (supplierdetailmodal?.supplierInfo?.profile).toString(),
                          progressIndicatorBuilder: (context, url, progress) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/icons/user.png',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                 Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      supplierdetailmodal?.supplierInfo?.name ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),

                    Container(
                      height: 33.h,
                      width: MediaQuery.of(context).size.width,
                      child: CachedNetworkImage(
                        imageUrl:
                        supplierdetailmodal?.supplierInfo?.profile ?? "",
                        imageBuilder: (context, imageProvider) => Container(
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
                            Icon(Icons.error),
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
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            print('right');

                          },
                          child: Container(
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(7),
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
                        supplierdetailmodal?.supplierInfo?.description ?? "",
                        textAlign: TextAlign.justify,
                        style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
                      ),
                    ),

                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: 2.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Starting Price : ",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: 'sofi',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1)),
                          Text("\$200",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: 'sofi',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  letterSpacing: 1))
                        ],
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
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 5.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15.sp),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.message_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                "Add Budget",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 5.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue.shade200),
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15.sp),
                        ),
                        child: Center(
                          child: Text(
                            "Quote Requested",
                            style: TextStyle(
                                color: Colors.blue.shade300, fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ),
                  ],
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
  supplierdetailap(){
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().supplierdetailapi(widget.suppid,widget.catid).then((response) async {
          supplierdetailmodal = SupplierdetailModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && supplierdetailmodal?.status == "1") {

            setState(() {
              isLoading =false;
            });
          }
          else {
            setState(() {
              isLoading =false;
            });
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });

  }
}
