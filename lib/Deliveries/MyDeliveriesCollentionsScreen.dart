import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/AllCatagoriesModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

import '../Modal/AllDelivaryModal.dart';
import '../widgets/load.dart';
import 'ViewDeliveriesScreen.dart';

class MyDeliveriesCollentions extends StatefulWidget {
  const MyDeliveriesCollentions({super.key});

  @override
  State<MyDeliveriesCollentions> createState() =>
      _MyDeliveriesCollentionsState();
}

final GlobalKey<ScaffoldState> scaffoldKey24 = GlobalKey<ScaffoldState>();

class cate {
  String? image;
  String? name;

  cate(
      this.image,
      this.name,
      );
}

List<cate> Categories = [
  cate(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGp7IVsRxR39ZFRv_s6_ukPoUgx4U3dCFdBA&usqp=CAU',
      'Wedding '),
  cate(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGp7IVsRxR39ZFRv_s6_ukPoUgx4U3dCFdBA&usqp=CAU',
      'Engagement '),
  cate(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGp7IVsRxR39ZFRv_s6_ukPoUgx4U3dCFdBA&usqp=CAU',
      'Anniversary '),
  cate(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGp7IVsRxR39ZFRv_s6_ukPoUgx4U3dCFdBA&usqp=CAU',
      'Birthday '),
  cate(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGp7IVsRxR39ZFRv_s6_ukPoUgx4U3dCFdBA&usqp=CAU',
      'Wedding '),
  cate(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGp7IVsRxR39ZFRv_s6_ukPoUgx4U3dCFdBA&usqp=CAU',
      'Engagement '),
  cate(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGp7IVsRxR39ZFRv_s6_ukPoUgx4U3dCFdBA&usqp=CAU',
      'Anniversary '),
  cate(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGp7IVsRxR39ZFRv_s6_ukPoUgx4U3dCFdBA&usqp=CAU',
      'Birthday '),
  cate(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGp7IVsRxR39ZFRv_s6_ukPoUgx4U3dCFdBA&usqp=CAU',
      'Wedding '),
  cate(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGp7IVsRxR39ZFRv_s6_ukPoUgx4U3dCFdBA&usqp=CAU',
      'Engagement '),
  cate(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGp7IVsRxR39ZFRv_s6_ukPoUgx4U3dCFdBA&usqp=CAU',
      'Anniversary '),
  cate(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGp7IVsRxR39ZFRv_s6_ukPoUgx4U3dCFdBA&usqp=CAU',
      'Birthday '),
];

class _MyDeliveriesCollentionsState extends State<MyDeliveriesCollentions> {
  int setit = 0;

  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoad = true;
    });
    deliveryapi();

  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoad,
      scaffold:Scaffold(
        backgroundColor: Colors.grey.shade100,
        key: scaffoldKey24,
        drawer: drawer1(),
        body: isLoad?Container():SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5.h),
              header(
                  text: "Deliveries/Collections ",
                  callback1: () {
                    scaffoldKey24.currentState?.openDrawer();
                  }),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 86.h,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: alldelivarymodal?.data?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                            height: 18.h,
                            padding: EdgeInsets.all(1.w),
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 0.5.w),
                                  height: 16.h,
                                  width: 30.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                      "",
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
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 54.w,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 1.w),
                                            child: Text(
                                              alldelivarymodal?.data?[index].eventName ?? "",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 0.5.h),
                                    Container(
                                      padding: EdgeInsets.only(left: 1.w),
                                      width: 55.w,
                                      child: Text(
                                        alldelivarymodal?.data?[index].comments ?? "",
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(0.7),
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    SizedBox(
                                      width: 55.w,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.to(
                                                  MyDeliveriesCollentionsViewScreen(id: alldelivarymodal?.data?[index].id ?? "",));
                                              // Get.to(MySuppliers(
                                              //   sele: -3,
                                              //   id: allcat
                                              //       ?.services?[
                                              //   index]
                                              //       .categoryId ??
                                              //       '',
                                              // ));
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3.w,
                                                  vertical: 1.3.h),
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                  BorderRadius.circular(90)),
                                              child: Text(
                                                'View Deliveries',
                                                style: TextStyle(
                                                    fontSize: 11.sp,
                                                    color: Colors.white,
                                                    fontFamily: 'sofi',
                                                    letterSpacing: 1,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  deliveryapi() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().alldelivaryshowapi().then((response) async {
          alldelivarymodal = AllDelivaryModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && alldelivarymodal?.status == "Success") {
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

  bool isLoad = true;
}
