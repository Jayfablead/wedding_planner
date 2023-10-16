import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class SupplierfourScreen extends StatefulWidget {
  const SupplierfourScreen({super.key});

  @override
  State<SupplierfourScreen> createState() => _SupplierfourScreenState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _SupplierfourScreenState extends State<SupplierfourScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                        scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Icon(Icons.menu_rounded))
                ],
              ),
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
                        "VinSmoke Sanji",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "Flower Decoration",
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
                            'https://static.wikia.nocookie.net/fictionalfighters/images/4/48/Sanji.png/revision/latest?cb=20150406032640',
                        progressIndicatorBuilder: (context, url, progress) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/icons/user.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
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
                              "https://junebugweddings.com/wedding-blog/wp-content/uploads/2018/10/the-mediterranean-vibes-in-this-valencia-wedding-at-la-mozaira-are-what-dreams-are-made-of-sophie-brendle-photography-36.jpg",
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
                              "https://junebugweddings.com/wedding-blog/wp-content/uploads/2018/10/the-mediterranean-vibes-in-this-valencia-wedding-at-la-mozaira-are-what-dreams-are-made-of-sophie-brendle-photography-36.jpg",
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
                              "https://junebugweddings.com/wedding-blog/wp-content/uploads/2018/10/the-mediterranean-vibes-in-this-valencia-wedding-at-la-mozaira-are-what-dreams-are-made-of-sophie-brendle-photography-36.jpg",
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
                              "https://junebugweddings.com/wedding-blog/wp-content/uploads/2018/10/the-mediterranean-vibes-in-this-valencia-wedding-at-la-mozaira-are-what-dreams-are-made-of-sophie-brendle-photography-36.jpg",
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
                              "https://junebugweddings.com/wedding-blog/wp-content/uploads/2018/10/the-mediterranean-vibes-in-this-valencia-wedding-at-la-mozaira-are-what-dreams-are-made-of-sophie-brendle-photography-36.jpg",
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
                "Details",
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 1.h,
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
                              "Chat",
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
            ],
          ),
        ),
      ),
    );
  }
}
