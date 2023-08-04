import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/BannerPage.dart';
import 'package:wedding_planner/screens/SupplierPage.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TextEditingController _search = TextEditingController();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(),key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(children: [
            SizedBox(
              height: 7.h,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 92.w,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hi, Zoro',
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontFamily: 'get',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                color: Colors.pink),
                          ),
                          IconButton(onPressed: () {
_scaffoldKey?.currentState?.openDrawer();
                          }, icon: Icon(Icons.menu_rounded,color: Colors.pink,size: 23.sp,))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Choose a Venue For Your Wedding',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'sofi',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                searchBox(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 1.w),
                  height: 6.5.h,
                  width: 14.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          'https://i.pinimg.com/280x280_RS/fc/71/56/fc7156e9ddbd524ab1541d3942725efd.jpg',
                      progressIndicatorBuilder: (context, url, progress) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/icons/deprf.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'sofi',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: Colors.black),
                ),
                SizedBox(height: 1.h),
                Container(
                  height: 18.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.pink.withOpacity(0.2),
                          ),
                          padding: EdgeInsets.all(2.w),
                          margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 1.w),
                                height: 9.h,
                                width: 25.w,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl:
                                      'https://www.clipartmax.com/png/full/391-3918431_transparent-decoration-wedding-indian-flower-transparent-decoration-wedding-indian-flower.png',
                                  progressIndicatorBuilder:
                                      (context, url, progress) =>
                                          Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    'assets/icons/deprf.png',
                                  ),
                                ),
                              ),
                              SizedBox(height: 1.h),
                              SizedBox(
                                  width: 25.w,
                                  child: Text(
                                    'Ceremony',
                                    style: TextStyle(
                                        color: Colors.pink,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ],
                          ));
                    },
                    itemCount: 10,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wedding Suppliers',
                  style: TextStyle(
                      fontSize: 14.sp,
                  fontFamily: 'sofi',
                            fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: Colors.black),
                ),
                SizedBox(height: 1.h),
                Container(
                    height: 22.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.pink,
                    ),
                    padding: EdgeInsets.all(2.w),
                    margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            height: 70.h,
                            width: 40.w,
                            child: Image.asset('assets/pic.png')),
                        SizedBox(width: 1.w),
                        SizedBox(
                          width: 44.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Special for you',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                    fontFamily: 'sofi'),
                              ),
                              Text(
                                'A Offer for You. You can get 30 % off on all selected venue',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                    fontFamily: 'sofi'),
                              ),
                              InkWell(
                                onTap: () {Get.to(MoodBordsScreen());},
                                child: Container(
                                  width: 28.w,
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25.sp),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "Book Now",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.pink,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'sofi'),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wedding Venue',
                  style: TextStyle(
                      fontSize: 14.sp,
                  fontFamily: 'sofi',
                            fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: Colors.black),
                ),
                SizedBox(height: 1.h),
                SizedBox(height: 27.h,
                  child: ListView.builder(scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(onTap: (){

                        },
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Container(
                              height: 27.h,
                              width: 45.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 17.h,
                                    width: 45.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.fill,
                                        imageUrl:
                                            'https://t4.ftcdn.net/jpg/05/89/07/29/360_F_589072985_iturA1VUTCERL6JQd7QxDDey1JzUcdzo.jpg',
                                        progressIndicatorBuilder:
                                            (context, url, progress) =>
                                                Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          'assets/icons/deprf.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.w, vertical: 1.5.h),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'A & D',
                                          style: TextStyle(
                                              fontFamily: 'get',
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          '04-04-2023',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: 'sofi',
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: 5),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            )
          ]),
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      alignment: Alignment.center,
      width: 75.w,
      height: 6.h,
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(90),
      ),
      child: TextField(
        controller: _search,
        onChanged: (value) {},
        style:
            TextStyle(color: Colors.black, fontSize: 12.sp, fontFamily: 'get'),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 25,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 35,
            minWidth: 40,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.black, fontFamily: 'get'),
        ),
      ),
    );
  }
}
