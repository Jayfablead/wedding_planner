import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/scrns/BooKNowPage.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class BookingDetailsPage extends StatefulWidget {
  const BookingDetailsPage({super.key});

  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer1(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      icon: Icon(Icons.arrow_back_ios_new_rounded)),
                  Text(
                    "Booking Details",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'sofi',
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Icon(Icons.menu_rounded)),
                ],
              ),
              Image.network(
                "https://www.transparentpng.com/thumb/car-png/car-free-transparent-png-8.png",
                height: 35.h,
              ),
              Text(
                "Sport",
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "sofi",
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "BMW 6 Series i4 Top Model",
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.normal,
                  fontFamily: "sofi",
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 15.h,
                        width: 30.w,
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 4.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.currency_rupee_sharp,
                                  size: 20.sp,
                                  color: Colors.pink,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  "\$200",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    fontFamily: "sofi",
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  "Per Km",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "sofi",
                                      fontSize: 12.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 15.h,
                        width: 30.w,
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 4.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.people_outline_rounded,
                                  size: 22.sp,
                                  color: Colors.pink,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  "People",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    fontFamily: "sofi",
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  "( 1-2 )",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12.sp,
                                    fontFamily: "sofi",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 15.h,
                        width: 30.w,
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 4.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.shopping_bag_sharp,
                                  size: 22.sp,
                                  color: Colors.pink,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  "Bags",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "sofi",
                                      fontSize: 15.sp),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  "( 1-2 )",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "sofi",
                                      fontSize: 12.sp),
                                ),
                              ],
                            ),
                          ),
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
                "Description",
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "sofi"),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Is a German multinational manufacturer of luxury vehicles BMW is headquartered in Munich"
                "and produces motor vehicles in Germany.",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black.withOpacity(0.6),
                    fontFamily: "sofi"),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Container(
                      height: 5.5.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(25.sp),
                      ),
                      child: Center(
                          child: Text(
                        "Add to Budget",
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.white,
                            fontFamily: 'get'),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(BooKNowPage());
                    },
                    child: Container(
                      height: 5.5.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(25.sp),
                      ),
                      child: Center(
                          child: Text(
                        "Book Now",
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.white,
                            fontFamily: 'get'),
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
