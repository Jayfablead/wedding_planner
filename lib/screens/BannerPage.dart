import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/SupplierPage.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class MoodBordsScreen extends StatefulWidget {
  const MoodBordsScreen({super.key});

  @override
  State<MoodBordsScreen> createState() => _MoodBordsScreenState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _MoodBordsScreenState extends State<MoodBordsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(),
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
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
                    "Posts",
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
              Container(
                height: 15.h,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1.w),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://cdn.pixabay.com/photo/2017/10/17/08/14/wedding-2859814_1280.jpg",
                                fit: BoxFit.cover,
                                height: 10.h,
                                width: 20.w,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
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
                              height: 1.h,
                            ),
                            Text(
                              "Post ${index + 1}",
                              style: TextStyle(
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                height: 76.h,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(SupplierfourScreen());
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(0.5.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(90),
                                        color: Colors.blue,
                                      ),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Center(
                                            child: Icon(
                                          Icons.ac_unit_sharp,
                                          color: Colors.white,
                                          size: 20.sp,
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Post " + '${index + 1}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.sp),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(90)),
                                    padding: EdgeInsets.all(3.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          size: 2.4.h,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Add",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w),
                                  child: Container(
                                    height: 30.h,
                                    width: 30.w,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://cdn.pixabay.com/photo/2017/10/05/09/03/wedding-2818739_640.jpg",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30.h,
                                  width: 55.w,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://cdn.pixabay.com/photo/2015/07/27/22/59/life-863708_640.jpg",
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
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
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w),
                                  child: Container(
                                    height: 30.h,
                                    width: 55.w,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://cdn.pixabay.com/photo/2015/07/27/22/59/life-863708_640.jpg",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30.h,
                                  width: 30.w,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://cdn.pixabay.com/photo/2017/10/05/09/03/wedding-2818739_640.jpg",
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: 1,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
