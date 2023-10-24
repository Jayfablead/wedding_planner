import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/screens/SupplierPage.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

import '../Modal/mySupplierModal.dart';
import '../widgets/load.dart';

class MySups extends StatefulWidget {
  int? sele;

  MySups({super.key, required this.sele});

  @override
  State<MySups> createState() => _MySupsState();
}

TextEditingController _search = TextEditingController();

class chat {
  String? image;
  String? name;
  String? type;
  String? date;
  String? details;

  chat(
    this.image,
    this.name,
    this.type,
    this.date,
    this.details,
  );
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
bool more = true;
bool isLoading = true;

class _MySupsState extends State<MySups> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeap();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        extendBody: true,
        bottomNavigationBar: bottomnavbar(selit: widget.sele),
        backgroundColor: Colors.grey.shade100,
        drawer: drawer1(),
        key: scaffoldKey,
        body: isLoading
            ? Container()
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      header(
                          text: "My Suppliers",
                          callback1: () {
                            scaffoldKey.currentState?.openDrawer();
                          }),
                      // headerwid(text: "All Suppliers"),
                      SizedBox(height: 1.h),
                      mysupps?.suppliersDetails?.length == 0 ||
                              mysupps?.suppliersDetails?.length == null
                          ? Container(
                              height: 80.h,
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
                              height: more ? 53.5.h : 71.h,
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: GridView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: more
                                    ? (mysupps?.suppliersDetails?.length ??
                                                0) <=
                                            4
                                        ? mysupps?.suppliersDetails?.length
                                        : 4
                                    : mysupps?.suppliersDetails?.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 5.w,
                                        mainAxisSpacing: 1.5.h,
                                        childAspectRatio: 0.78 / 1),
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin:
                                        EdgeInsets.symmetric(vertical: 0.5.h),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            // Color of the shadow
                                            offset: Offset(0, 1.5),
                                            // Offset of the shadow (x, y)
                                            blurRadius:
                                                8, // Spread of the shadow
                                            // How much the shadow extends
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 1.w),
                                          height: 8.h,
                                          width: 16.w,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(90),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl: mysupps
                                                      ?.suppliersDetails?[index]
                                                      .profile ??
                                                  "",
                                              progressIndicatorBuilder: (context,
                                                      url, progress) =>
                                                  CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Image.asset(
                                                'assets/user.png',
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          mysupps
                                                  ?.suppliersDetails?[index]
                                                  .services
                                                  ?.category
                                                  ?.categoryName ??
                                              "",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                              fontFamily: 'sofi',
                                              color: Colors.black),
                                        ),
                                        Text(
                                          mysupps?.suppliersDetails?[index]
                                                  .name ??
                                              "",
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'sofi',
                                            color:
                                                Colors.black.withOpacity(0.75),
                                          ),
                                        ),
                                        Center(
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(SupplierfourScreen(
                                                suppid: mysupps
                                                    ?.suppliersDetails?[index]
                                                    .id,
                                                catid: mysupps
                                                    ?.suppliersDetails?[index]
                                                    .services
                                                    ?.category
                                                    ?.categoryId,
                                                service: mysupps
                                                    ?.suppliersDetails?[index]
                                                    .services
                                                    ?.category
                                                    ?.categoryName,
                                              ));
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 4.5.h,
                                              width: 38.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          90)),
                                              child: Text(
                                                'View Details',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13.sp,
                                                  fontFamily: 'sofi',
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                      SizedBox(height: 1.2.h),
                      mysupps?.suppliersDetails?.length == 0 ||
                              mysupps?.suppliersDetails?.length == null
                          ? Container()
                          : (mysupps?.suppliersDetails?.length ?? 0) <= 4
                              ? Container()
                              : Center(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        more = !more;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 5.h,
                                      width: 38.w,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(90)),
                                      child: Text(
                                        more ? 'View More' : 'View Less',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.sp,
                                          fontFamily: 'sofi',
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                      SizedBox(height: 3.h),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  homeap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().Mysups().then((response) async {
          mysupps = MySuppliersModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && mysupps?.status == "1") {
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
