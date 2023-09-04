import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
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
                    SizedBox(height: 5.h),
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
                          '',
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
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://scontent.fstv3-1.fna.fbcdn.net/v/t39.30808-6/305220149_495231479273840_8870209323185881114_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=a2f6c7&_nc_ohc=JitQYcURCT8AX8hWsHr&_nc_ht=scontent.fstv3-1.fna&oh=00_AfBGo4wcKtVfF1N56WRWhyUCKheYrbykEKdgcwkcCMf8jQ&oe=64F88C45',
                          height: 9.h,
                          width: 20.w,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
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
                        width: 60.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 0.5.h),
                            Text(
                              'Marriott King',
                              style: TextStyle(
                                  fontSize: 19.sp,
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              'TVC Company',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                ],
              )),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 1.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        searchBox(),
                        Container(
                            padding: EdgeInsets.all(2.8.w),
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(11)),
                            child: Icon(
                              CupertinoIcons.sort_up_circle,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    SizedBox(height: 1.h),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.h),
                    Padding(
                      padding: EdgeInsets.only(left: 2.w),
                      child: Text(
                        'Hotel Near You',
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontFamily: 'sofi',
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 30.5.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              'https://media.cnn.com/api/v1/images/stellar/prod/140127103345-peninsula-shanghai-deluxe-mock-up.jpg?q=w_2226,h_1449,x_0,y_0,c_fill',
                                          height: 20.h,
                                          width: 80.w,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(12),
                                                  topLeft: Radius.circular(12)),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                      Container(
                                        width: 80.w,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.12),
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(8),
                                              bottomLeft: Radius.circular(8)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 55.w,
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 1.h),
                                                    Text(
                                                      'Hotel Marriott Luxeriya',
                                                      style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontFamily: 'sofi',
                                                          letterSpacing: 1,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(height: 1.h),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                            CupertinoIcons
                                                                .location_solid,
                                                            color: Colors.pink,
                                                            size: 14.sp),
                                                        SizedBox(width: 0.5.w),
                                                        Padding(
                                                          padding:  EdgeInsets.only(top: 0.8.w),
                                                          child: Text(
                                                            'Surat, Gujarat',
                                                            style: TextStyle(
                                                                fontSize: 12.sp,
                                                                fontFamily:
                                                                    'sofi',
                                                                letterSpacing: 1,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 1.h),
                                                  ]),
                                            ),
                                            SizedBox(
                                              child: Text(
                                                '\$ 165',
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontFamily: 'sofi',
                                                    letterSpacing: 1,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Positioned(
                                      left: 56.5.w,top: 1.6.h,
                                      child: Container(
                                        padding: EdgeInsets.all(2.w),
                                        decoration: BoxDecoration(
                                            color: Colors.pink,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              CupertinoIcons.add,
                                              color: Colors.white,
                                              size: 15.sp,
                                            ),
                                            Text(
                                              'Budget',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white,
                                                  fontFamily: 'sofi',
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: 5,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.h),
                    Padding(
                      padding: EdgeInsets.only(left: 2.w),
                      child: Text(
                        'Nearby You',
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontFamily: 'sofi',
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 33.5.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Stack(
                                children: [
                                  Container(
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'https://images.oyoroomscdn.com/uploads/hotel_image/160938/ca5832dea91e02f6.jpg',
                                      height: 30.h,
                                      width: 50.w,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(
                                                  Colors.black12,
                                                  BlendMode.multiply)),
                                        ),
                                      ),
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                  Positioned(
                                      top: 23.h,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                        ),
                                        // Clip it cleanly.
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 12, sigmaY: 12),
                                          child: Container(
                                              width: 50.w,
                                              height: 7.h,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.w),
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                              ),
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Katargaam',
                                                        style: TextStyle(
                                                            fontSize: 13.sp,
                                                            fontFamily: 'sofi',
                                                            letterSpacing: 1,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(height: 1.h),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Icon(
                                                              CupertinoIcons
                                                                  .location_solid,
                                                              color:
                                                                  Colors.pink,
                                                              size: 10.sp),
                                                          SizedBox(
                                                              width: 0.5.w),
                                                          Text(
                                                            'Surat',
                                                            style: TextStyle(
                                                                fontSize: 10.sp,
                                                                fontFamily:
                                                                    'sofi',
                                                                letterSpacing:
                                                                    1,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    '\$ 15',
                                                    style: TextStyle(
                                                        fontSize: 13.sp,
                                                        fontFamily: 'sofi',
                                                        letterSpacing: 1,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      )),
                                  Positioned(
                                      left: 26.5.w,
                                      child: Container(
                                        padding: EdgeInsets.all(2.w),
                                        decoration: BoxDecoration(
                                            color: Colors.pink,
                                            borderRadius:
                                            BorderRadius.circular(10)),
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              CupertinoIcons.add,
                                              color: Colors.white,
                                              size: 15.sp,
                                            ),
                                            Text(
                                              'Budget',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white,
                                                  fontFamily: 'sofi',
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: 5,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      width: 80.w,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        // controller: _search,
        onChanged: (value) {},
        style: TextStyle(color: Colors.black, fontFamily: 'Meta1'),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.black, fontFamily: 'Meta1'),
        ),
      ),
    );
  }
}
