import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/drawer.dart';

class Accomendation_Page extends StatefulWidget {
  const Accomendation_Page({super.key});

  @override
  State<Accomendation_Page> createState() => _Accomendation_PageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _Accomendation_PageState extends State<Accomendation_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer1(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 6.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_back_ios_new_rounded)),
                        Text(
                          'Accommodation Page',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                            icon: Icon(Icons.menu_rounded)),
                      ],
                    ),
                    SizedBox(height: 1.h),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 2.w),
                        Text(
                          '14-09',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.pink,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'to',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          '15-09',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.pink,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 2.w),
                            Text(
                              'Hotels near you',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(CupertinoIcons.sort_up_circle))
                      ],
                    ),
                  ],
                ),
              ),
              SliverList.builder(
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 0.5.h, horizontal: 0.5.w),
                    margin: EdgeInsets.symmetric(vertical: 1.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Container(
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://aremorch.com/wp-content/uploads/2016/09/The-Details-That-Matter-Top-Things-Every-Luxury-Hotel-Room-Should-Have.png',
                                height: 25.h,
                                width: 100.w,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11.0),
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
                            Positioned(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    CupertinoIcons.heart_circle_fill,
                                    color: Colors.white,
                                    size: 30.sp,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          ' Hotel Max and Maxis ,Adajan ,Surat',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.black,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          ' Adajan ,Surat ,With 2BH Rooms And Free Wifi',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.black87,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          ' We Welcome All guests',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'sofi',
                              color: Colors.black87,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500),
                        ),SizedBox(height: 1.h),
                        Text(
                          ' Surat ,Gujarat',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'sofi',
                              color: Colors.black87,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
