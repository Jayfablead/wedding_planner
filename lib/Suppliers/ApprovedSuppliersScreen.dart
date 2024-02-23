import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/HomeModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/Suppliers/SupplierDetailsPage.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

import '../Modal/CategoryWiseSuppliersModal.dart';
import '../widgets/load.dart';

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

class _AppRovedSuppliersScreenState extends State<AppRovedSuppliersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // homeap();
    setState(() {
      isLoading = true;
      more = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey.shade100,
      drawer: drawer1(),
      key: scaffoldKey23,
      body: SingleChildScrollView(
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
              // headerwid(text: "All Suppliers"),
              SizedBox(height: 1.h),
              mesgs?.length == 0 || mesgs?.length == null
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
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: more
                            ? (mesgs?.length ?? 0) <= 4
                                ? mesgs?.length
                                : 4
                            : mesgs?.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.w,
                            mainAxisSpacing: 1.5.h,
                            childAspectRatio: 0.78 / 1),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            margin: EdgeInsets.symmetric(vertical: 0.5.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    // Color of the shadow
                                    offset: Offset(0, 1.5),
                                    // Offset of the shadow (x, y)
                                    blurRadius: 8, // Spread of the shadow
                                    // How much the shadow extends
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 1.w),
                                  height: 8.h,
                                  width: 16.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(90),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          (mesgs?[index].image).toString(),
                                      progressIndicatorBuilder:
                                          (context, url, progress) =>
                                              CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        'assets/user.png',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  mesgs?[index].name ?? "",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      fontFamily: 'sofi',
                                      color: Colors.black),
                                ),
                                Text(
                                  mesgs?[index].details ?? "",
                                  maxLines: 2,
                                  style: TextStyle(
                                    height: 1.3,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'sofi',
                                    color: Colors.black.withOpacity(0.75),
                                  ),
                                ),
                                Center(
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(SupplierfourScreen(
                                        catid: "",
                                        suppid: "",
                                        service: "",
                                      ));
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 4.5.h,
                                      width: 38.w,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(90)),
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
              mesgs?.length == 0 || mesgs?.length == null
                  ? Container()
                  : (mesgs?.length ?? 0) <= 4
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
                                  borderRadius: BorderRadius.circular(90)),
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
    );
  }
}
