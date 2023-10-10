import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/new%20pages/itineryView.dart';

import '../widgets/drawer.dart';

class ItinerPage extends StatefulWidget {
  const ItinerPage({super.key});

  @override
  State<ItinerPage> createState() => _ItinerPageState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _ItinerPageState extends State<ItinerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8e8e8),
      drawer: drawer1(),
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                      )),
                  Text(
                    "Itinerary List",
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
                      icon: Icon(
                        Icons.menu_rounded,
                      ))
                ],
              ),
              SizedBox(height: 1.h),
              searchBox(),
              SizedBox(height: 1.h),
              SizedBox(
                height: 80.h,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                          height: 22.5.h,
                          padding: EdgeInsets.all(1.w),
                          margin: EdgeInsets.symmetric(horizontal: 1.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 0.5.w),
                                height: 19.h,
                                width: 30.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        'https://www.oyorooms.com/blog/wp-content/uploads/2018/02/fe.jpg',
                                    progressIndicatorBuilder:
                                        (context, url, progress) => Center(
                                            child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      'assets/deprf.png',
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(height: 0.5.h),
                                  SizedBox(
                                    width: 54.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 0.8.w),
                                          child: Text(
                                            'Vinsmoke Sanji',
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
                                  SizedBox(
                                    width: 54.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 1.w),
                                          child: Text(
                                            'Royal View',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 1.h),
                                  Container(
                                    padding: EdgeInsets.only(left: 1.w),
                                    width: 55.w,
                                    child: Text(
                                      'A Royal Decoration venue A Royal Decoration venue A Royal Decoration venue A Royal Decoration venue ',
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(height: 1.h),
                                  Row(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            size: 15.sp,
                                            color:
                                                Colors.black.withOpacity(0.8),
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Text(
                                            'Surat',
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 5.w),
                                        child: Text(
                                          '\$ 25000',
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 0.5.h),
                                  InkWell(
                                    onTap: () {
                                      Get.to(
                                        ItineryView(),
                                      );
                                    },
                                    child: Container(
                                      height: 5.h,
                                      width: 42.w,
                                      decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius:
                                            BorderRadius.circular(25.sp),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "View Details",
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            letterSpacing: 1.5,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                            fontFamily: 'sofi'),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
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

  Widget searchBox() {
    return Container(
      width: 95.w,
      height: 6.5.h,
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        right: 3.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            // Color of the shadow
            offset: Offset(0, 2.5),
            // Offset of the shadow (x, y)
            blurRadius: 4, // Spread of the shadow
            // How much the shadow extends
          ),
        ],
      ),
      child: TextField(
        cursorColor: Colors.black,
        // controller: _search,
        onChanged: (value) {},
        style: TextStyle(
          fontSize: 15.sp,
          letterSpacing: 1,
          fontFamily: 'Sofi',
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: Colors.black,
          ),
          focusedBorder: InputBorder.none,
          // Remove border when focused
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: 'Search',
          contentPadding: EdgeInsets.only(top: 1.7.h),
          hintStyle: TextStyle(
            fontSize: 15.sp,
            letterSpacing: 1,
            fontFamily: 'Sofi',
            fontWeight: FontWeight.w700,
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}
