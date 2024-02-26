import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/Suppliers/SupplierDetailsPage.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

import '../Modal/AllSupsTypeModal.dart';
import '../Modal/ApprovedSuppliersModal.dart';
import '../Modal/GetSuppliersServiceModal.dart';
import '../widgets/load.dart';
import 'AddNewSupplier.dart';

class AppRovedSuppliersScreen extends StatefulWidget {
  String? id;

  AppRovedSuppliersScreen({super.key, this.id});

  @override
  State<AppRovedSuppliersScreen> createState() =>
      _AppRovedSuppliersScreenState();
}

final GlobalKey<ScaffoldState> scaffoldKey23 = GlobalKey<ScaffoldState>();
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

List<chat> mesgs = [
  chat(
      'https://e1.pxfuel.com/desktop-wallpaper/238/852/desktop-wallpaper-masque-luffy-smiling-luffy-smile-thumbnail.jpg',
      'Luffy',
      'Flower Decor',
      '22-08-2023',
      'A decorations full of Flowers with dif dif flowers'),
  chat(
      'https://static.wikia.nocookie.net/fictionalfighters/images/4/48/Sanji.png/revision/latest?cb=20150406032640',
      'Sanji',
      'Cake Decor',
      '20-03-2024',
      'A decorations for Cake as You want.'),
  chat(
      'https://w0.peakpx.com/wallpaper/311/533/HD-wallpaper-one-piece-nico-robin-one-piece-two-years-later.jpg',
      'Robin',
      'Chair Decor',
      '17-05-2023',
      'A decorations of chair like arrangements , sitting types etc'),
  chat(
      'https://i.pinimg.com/736x/59/e3/d2/59e3d2fb93af21511690470abc014831.jpg',
      'Nami',
      'Room Decor',
      '15-09-2024',
      'A decorations for your room special as like you'),
  chat(
      'https://i.pinimg.com/236x/23/62/50/236250f1055a352c4a0cd5e0a21aaf33.jpg',
      'Chopper',
      'Garden Decor',
      '12-10-2024',
      'A decorations of your garden'),
  chat(
      'https://w0.peakpx.com/wallpaper/311/533/HD-wallpaper-one-piece-nico-robin-one-piece-two-years-later.jpg',
      'Robin',
      'Chair Decor',
      '17-05-2023',
      'A decorations of chair like arrangements , sitting types etc'),
  chat(
      'https://i.pinimg.com/736x/59/e3/d2/59e3d2fb93af21511690470abc014831.jpg',
      'Nami',
      'Room Decor',
      '15-09-2024',
      'A decorations for your room special as like you'),
  chat(
      'https://i.pinimg.com/236x/23/62/50/236250f1055a352c4a0cd5e0a21aaf33.jpg',
      'Chopper',
      'Garden Decor',
      '12-10-2024',
      'A decorations of your garden'),
  chat(
      'https://i.pinimg.com/236x/23/62/50/236250f1055a352c4a0cd5e0a21aaf33.jpg',
      'Chopper',
      'Garden Decor',
      '12-10-2024',
      'A decorations of your garden'),
  chat(
      'https://w0.peakpx.com/wallpaper/311/533/HD-wallpaper-one-piece-nico-robin-one-piece-two-years-later.jpg',
      'Robin',
      'Chair Decor',
      '17-05-2023',
      'A decorations of chair like arrangements , sitting types etc'),
  chat(
      'https://i.pinimg.com/736x/59/e3/d2/59e3d2fb93af21511690470abc014831.jpg',
      'Nami',
      'Room Decor',
      '15-09-2024',
      'A decorations for your room special as like you'),
  chat(
      'https://i.pinimg.com/236x/23/62/50/236250f1055a352c4a0cd5e0a21aaf33.jpg',
      'Chopper',
      'Garden Decor',
      '12-10-2024',
      'A decorations of your garden'),
];

bool more = true;
bool isLoading = true;
bool getsuppliers =true;

class _AppRovedSuppliersScreenState extends State<AppRovedSuppliersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    approvedsuppliers();
    Suppliertypeap();
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
                          text: "Approved Suppliers",
                          callback1: () {
                            scaffoldKey23.currentState?.openDrawer();
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(RequestSupplier());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 5.h,
                              width: 52.w,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(90)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                  Text(
                                    'Request Supplier',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          PopupMenuButton(
                            elevation: 00,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(10)),
                            icon: Icon(Icons.filter_alt_outlined,
                                color: Colors.blue, size: 22.sp),
                            itemBuilder: (context) {
                              return <PopupMenuEntry>[
                                PopupMenuItem(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return  Container(
                                            height: 60.h,
                                            child: AlertDialog(
                                                backgroundColor:
                                                Colors.grey.shade100,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        20),
                                                    side: BorderSide(
                                                        color: Colors.white)),
                                                title: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.min,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Select Supplier type',
                                                          style: TextStyle(
                                                              fontFamily: "pop",
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600,
                                                              fontSize: 15.sp,
                                                              letterSpacing: 1,
                                                              color:
                                                              Colors.blue),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                          child: Icon(
                                                              Icons.close,
                                                              color:
                                                              Colors.blue),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider()
                                                  ],
                                                ),
                                                // content: categoryandfilter
                                                //     ?.workertypeModel
                                                //     ?.length ==
                                                //     0 ||
                                                //     categoryandfilter
                                                //         ?.workertypeModel
                                                //         ?.length ==
                                                //         null ||
                                                //     categoryandfilter
                                                //         ?.workertypeModel ==
                                                //         null
                                                //     ? Container(
                                                //   height: 25.h,
                                                //   alignment:
                                                //   Alignment.center,
                                                //   child: Text(
                                                //     "No Work types Available",
                                                //     style: TextStyle(
                                                //         fontFamily:
                                                //         "pop",
                                                //         fontSize: 14.sp,
                                                //         color: Colors
                                                //             .black),
                                                //   ),
                                                // )
                                                //     :

                                                content: SizedBox(
                                                  height: 22.h,
                                                  width: 95.w,
                                                  child: GridView.builder(
                                                    padding: EdgeInsets.zero,
                                                    gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        childAspectRatio:
                                                        10 / 4.5,
                                                        crossAxisCount: 2),
                                                    itemCount: allsuupliertypes
                                                        ?.data?.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return InkWell(
                                                        onTap: () {
                                                          print(
                                                              '${allsuupliertypes?.data?[index].categoryId} : ');
                                                          print(
                                                              '${allsuupliertypes?.data?[index].categoryName}');


                                                          setState(() {
                                                            getsuppliers = true;
                                                            singalgetdatasupplier(
                                                                (allsuupliertypes
                                                                    ?.data?[
                                                                index]
                                                                    .categoryId)
                                                                    .toString());
                                                          });
                                                        },
                                                        child: Container(
                                                          alignment:
                                                          Alignment.center,
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                              vertical: 1.w,
                                                              horizontal:
                                                              1.w),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                              vertical:
                                                              0.5.h,
                                                              horizontal:
                                                              1.w),
                                                          decoration: BoxDecoration(
                                                              color:
                                                              Colors.white,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  20)),
                                                          child: Text(
                                                            allsuupliertypes
                                                                ?.data?[
                                                            index]
                                                                .categoryName ??
                                                                '',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                letterSpacing:
                                                                1,
                                                                fontFamily:
                                                                'pop'),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                )),
                                          );
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Supplier Type',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 13.sp,
                                        fontFamily: 'sofi',
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2,
                                      ),
                                    )),
                              ];
                            },
                          ),
                        ],
                      ),
                      // headerwid(text: "All Suppliers"),
                      SizedBox(height: 1.h),
                      getsuppliers
                          ? getsuppliersservicemodal?.data?.length == 0 ||
                          getsuppliersservicemodal?.data?.length == null
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
                        height: more ? 50.5.h : 71.h,
                        padding:
                        EdgeInsets.symmetric(horizontal: 2.w),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: more
                              ? (getsuppliersservicemodal
                              ?.data?.length ??
                              0) <=
                              3
                              ? getsuppliersservicemodal
                              ?.data?.length
                              : 3
                              : getsuppliersservicemodal
                              ?.data?.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 2.h),
                              margin: EdgeInsets.symmetric(
                                  vertical: 0.5.h),
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
                                          BorderRadius.circular(
                                              90),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl:
                                            getsuppliersservicemodal
                                                ?.data?[index]
                                                .profilePath ??
                                                '',
                                            progressIndicatorBuilder:
                                                (context, url,
                                                progress) =>
                                                CircularProgressIndicator(),
                                            errorWidget: (context,
                                                url, error) =>
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
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            getsuppliersservicemodal
                                                ?.data?[
                                            index]
                                                .name ==
                                                "" ||
                                                getsuppliersservicemodal
                                                    ?.data?[
                                                index]
                                                    .name ==
                                                    null
                                                ? "N/A"
                                                : getsuppliersservicemodal
                                                ?.data?[index]
                                                .name ??
                                                "",
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight:
                                                FontWeight.bold,
                                                letterSpacing: 1,
                                                fontFamily: 'sofi',
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          SizedBox(
                                            width: 55.w,
                                            child: Text(
                                              getsuppliersservicemodal
                                                  ?.data?[
                                              index]
                                                  .email ==
                                                  "" ||
                                                  getsuppliersservicemodal
                                                      ?.data?[
                                                  index]
                                                      .email ==
                                                      null
                                                  ? "N/A"
                                                  : getsuppliersservicemodal
                                                  ?.data?[
                                              index]
                                                  .email ??
                                                  '',
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontFamily: 'sofi',
                                                color: Colors.black
                                                    .withOpacity(
                                                    0.75),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Center(
                                            child: InkWell(
                                              onTap: () {
                                                Get.to(
                                                    SupplierfourScreen(
                                                      suppid: getsuppliersservicemodal
                                                          ?.data?[
                                                      index]
                                                          .id ??
                                                          '',
                                                      catid:getsuppliersservicemodal
                                                          ?.data?[
                                                      index]
                                                          .id ??
                                                          '',
                                                      service: getsuppliersservicemodal
                                                          ?.data?[
                                                      index]
                                                          .name ??
                                                          '',
                                                    ));
                                              },
                                              child: Container(
                                                alignment:
                                                Alignment.center,
                                                height: 4.5.h,
                                                width: 38.w,
                                                decoration: BoxDecoration(
                                                    color:
                                                    Colors.blue,
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        90)),
                                                child: Text(
                                                  'View Details',
                                                  style: TextStyle(
                                                    color:
                                                    Colors.white,
                                                    fontSize: 13.sp,
                                                    fontFamily:
                                                    'sofi',
                                                    fontWeight:
                                                    FontWeight
                                                        .bold,
                                                    letterSpacing: 2,
                                                  ),
                                                ),
                                              ),
                                            ),
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
                      )
                          : SizedBox(height: 1.2.h),

                      getsuppliers?Container(): mysupps?.suppliersDetails?.length == 0 ||
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
                          :approvedsuppliersmodal?.suppliers?.length == 0 ||
                              approvedsuppliersmodal?.suppliers?.length == null
                          ? Container(
                              height: 80.h,
                              alignment: Alignment.center,
                              child: Text(
                                "No Approved Suppliers Available",
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
                                    ? (approvedsuppliersmodal
                                                    ?.suppliers?.length ??
                                                0) <=
                                            4
                                        ? approvedsuppliersmodal
                                            ?.suppliers?.length
                                        : 4
                                    : approvedsuppliersmodal?.suppliers?.length,
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
                                          MainAxisAlignment.start,
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
                                                      approvedsuppliersmodal
                                                              ?.suppliers?[
                                                                  index]
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
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  approvedsuppliersmodal
                                                          ?.suppliers?[index]
                                                          .name ??
                                                      "",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 1,
                                                      fontFamily: 'sofi',
                                                      color: Colors.black),
                                                ),
                                                SizedBox(
                                                  width: 55.w,
                                                  child: Text(
                                                    approvedsuppliersmodal
                                                            ?.suppliers?[index]
                                                            .description ??
                                                        "",
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      height: 1.3,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'sofi',
                                                      color: Colors.black
                                                          .withOpacity(0.75),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.5.h,
                                                ),
                                                Center(
                                                  child: InkWell(
                                                    onTap: () {
                                                      Get.to(SupplierfourScreen(
                                                        catid: approvedsuppliersmodal
                                                                ?.suppliers?[
                                                                    index]
                                                                .categoryId ??
                                                            "",
                                                        suppid:
                                                            approvedsuppliersmodal
                                                                    ?.suppliers?[
                                                                        index]
                                                                    .id ??
                                                                "",
                                                        service: approvedsuppliersmodal
                                                                ?.suppliers?[
                                                                    index]
                                                                .categoryName ??
                                                            "",
                                                      ));
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 4.5.h,
                                                      width: 38.w,
                                                      decoration: BoxDecoration(
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      90)),
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
                      approvedsuppliersmodal?.suppliers?.length == 0 ||
                              approvedsuppliersmodal?.suppliers?.length == null
                          ? Container()
                          : (approvedsuppliersmodal?.suppliers?.length ?? 0) <=
                                  4
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

  approvedsuppliers() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().approvedsuppliersapi().then((response) async {
          approvedsuppliersmodal =
              ApprovedSuppliersModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              approvedsuppliersmodal?.status == "1") {
            print("done");
            setState(() {
              isLoading = false;
              getsuppliers=false;
            });
          } else {
            setState(() {
              isLoading = false;
              getsuppliers=false;
            });
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
  Suppliertypeap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().subtype().then((response) async {
          allsuupliertypes =
              All_Supplier_Type_Modal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && allsuupliertypes?.status == "1") {
            setState(() {
              isLoading = false;
              getsuppliers=false;
            });
          } else {
            setState(() {
              isLoading = false;
              getsuppliers=false;
            });
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  singalgetdatasupplier(String value) {
    final Map<String, String> data = {};
    data['supplier_category_id'] = value.toString();

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().getservicesupplirsapi(data).then((response) async {
          getsuppliersservicemodal =
              GetSuppliersServiceModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              getsuppliersservicemodal?.status == "1") {
            print("getsuppliersDone");
            Get.back();
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
