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

import '../Modal/ViewAllEventSpaceModal.dart';
import '../widgets/load.dart';
import 'EventSpace.dart';

class AllEventSpaces extends StatefulWidget {
  AllEventSpaces({
    super.key,
  });

  @override
  State<AllEventSpaces> createState() => _AllEventSpacesState();
}

final GlobalKey<ScaffoldState> scaffoldKey23 = GlobalKey<ScaffoldState>();
TextEditingController _search = TextEditingController();

bool more = true;
bool isLoading = true;

class _AllEventSpacesState extends State<AllEventSpaces> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventviewapi();
    setState(() {
      isLoading = true;
      more = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey.shade100,
        drawer: drawer1(),
        key: scaffoldKey23,
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
                          text: "All Event space",
                          callback1: () {
                            scaffoldKey23.currentState?.openDrawer();
                          }),
                      SizedBox(height: 1.h),
                      SizedBox(height: 1.h),
                      viewAlleventspacemodal?.data?.length == 0 ||
                              viewAlleventspacemodal?.data?.length == null
                          ? Container(
                              height: 80.h,
                              alignment: Alignment.center,
                              child: Text(
                                "No Event space Available",
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontFamily: 'sofi',
                                    color: Colors.black),
                              ),
                            )
                          : Container(
                              height: more ? 57.h : 72.h,
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: more
                                    ? (viewAlleventspacemodal?.data?.length ??
                                                0) <=
                                            4
                                        ? viewAlleventspacemodal?.data?.length
                                        : 4
                                    : viewAlleventspacemodal?.data?.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.w, vertical: 2.h),
                                    margin:
                                        EdgeInsets.symmetric(vertical: 0.5.h),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            // Color of the shadow
                                            offset: Offset(0.2, 0.5),

                                            blurRadius:
                                                2, // Spread of the shadow
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
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 1.w),
                                              height: 22.w,
                                              width: 22.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(90),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl:
                                                      viewAlleventspacemodal
                                                              ?.data?[index]
                                                              .eventSpaceName ??
                                                          "",
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                              progress) =>
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
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  viewAlleventspacemodal
                                                                  ?.data?[index]
                                                                  .eventSpaceName ==
                                                              "" ||
                                                          viewAlleventspacemodal
                                                                  ?.data?[index]
                                                                  .eventSpaceName ==
                                                              null
                                                      ? "N/A"
                                                      : viewAlleventspacemodal
                                                              ?.data?[index]
                                                              .eventSpaceName ??
                                                          "",
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 1,
                                                      fontFamily: 'sofi',
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                  viewAlleventspacemodal
                                                                  ?.data?[index]
                                                                  .eventSpaceTime ==
                                                              "" ||
                                                          viewAlleventspacemodal
                                                                  ?.data?[index]
                                                                  .eventSpaceTime ==
                                                              null
                                                      ? "N/A"
                                                      : viewAlleventspacemodal
                                                              ?.data?[index]
                                                              .eventSpaceTime ??
                                                          "",
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    height: 1.3,
                                                    fontSize: 14.sp,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'sofi',
                                                    color: Colors.black
                                                        .withOpacity(0.75),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.to(EventSpace(
                                                      eventspaceid:
                                                          viewAlleventspacemodal
                                                              ?.data?[index].id
                                                              .toString(),
                                                    ));
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 4.5.h,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.w),
                                                    decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90)),
                                                    child: Text(
                                                      'View Details',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13.sp,
                                                        fontFamily: 'sofi',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        letterSpacing: 2,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                      SizedBox(height: 1.2.h),
                      viewAlleventspacemodal?.data?.length == 0 ||
                              viewAlleventspacemodal?.data?.length == null
                          ? Container()
                          : (viewAlleventspacemodal?.data?.length ?? 0) <= 4
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
                      SizedBox(height: 2.h),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  eventviewapi() {
    final Map<String, String> data = {};
    data['bride_groom_id'] = (userData?.user?.id).toString();

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().viewalleventspaceapi(data).then((response) async {
          viewAlleventspacemodal =
              ViewAllEventSpaceModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              viewAlleventspacemodal?.status == true) {
            print("done api");
            setState(() {
              isLoading = false;
            });
          } else {
            buildErrorDialog(context, " Error",
                (viewAlleventspacemodal?.message ?? "").toString());
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
