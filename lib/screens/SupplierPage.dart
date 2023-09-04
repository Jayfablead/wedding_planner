import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/other%20Pages/add%20Quote%20Page.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class SupplierfourScreen extends StatefulWidget {
  const SupplierfourScreen({super.key});

  @override
  State<SupplierfourScreen> createState() => _SupplierfourScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _SupplierfourScreenState extends State<SupplierfourScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer1(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded)),
                  Text(
                    "Supplier",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'sofi',
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Icon(Icons.menu_rounded))
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 33.h,
                        width: 25.w,
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://cdn.pixabay.com/photo/2015/10/06/17/18/bride-and-groom-974845_640.jpg",
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
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 15.h,
                        width: 30.w,
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://cdn.pixabay.com/photo/2015/10/06/17/18/bride-and-groom-974845_640.jpg",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
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
                      Container(
                        height: 15.h,
                        width: 30.w,
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://cdn.pixabay.com/photo/2015/10/06/17/18/bride-and-groom-974845_640.jpg",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.sp),
                                  bottomRight: Radius.circular(10.sp),
                                  bottomLeft: Radius.circular(10.sp)),
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
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 15.h,
                        width: 30.w,
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://cdn.pixabay.com/photo/2015/10/06/17/18/bride-and-groom-974845_640.jpg",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
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
                      Container(
                        height: 15.h,
                        width: 30.w,
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://cdn.pixabay.com/photo/2015/10/06/17/18/bride-and-groom-974845_640.jpg",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
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
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Flower Decoration",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: Colors.black),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "There are many variations",
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.pink,
                        size: 25.sp,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        "4.3 Ratings",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.message_rounded,
                        color: Colors.pink,
                        size: 25.sp,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        "960 Reviews",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Details",
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 20.h,
                width: 90.w,
                child: Text(
                  "When it comes to decoration ideas for weddings, flowers are one of the top things that pop into our minds.And with the latest wedding trends,there are numerous ways of using flower decoration to amp up your wedding décor.",
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Container(
                      height: 5.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      child: Center(
                        child: Text(
                          "Add to Budget",
                          style: TextStyle(color: Colors.white, fontSize: 14.sp),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(AddQuote());
                    },
                    child: Container(
                      height: 5.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      child: Center(
                        child: Text(
                          "Get a quote Now",
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
