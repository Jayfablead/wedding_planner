import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wedding_planner/widgets/drawer.dart';

import '../../main.dart';

class YellowVenueView extends StatefulWidget {
  const YellowVenueView({super.key});

  @override
  State<YellowVenueView> createState() => _YellowVenueViewState();
}

final controller = PageController(viewportFraction: 0.8, keepPage: true);
List HotelIm = [
  'https://i0.wp.com/decorsutrablog.com/wp-content/uploads/2020/06/DecorSutra_Wedding-Decor-9_Royal-Decor.jpg?fit=780%2C425&ssl=1',
  'https://i.pinimg.com/originals/2f/10/f6/2f10f6363ce6fd2461cec2bd46dbc916.jpg',
  'https://fancdesigns.com/wp-content/uploads/2016/08/royal-decorations-40-royal-wedding-decorations-2246-x-1162-1.jpg',
  'https://i0.wp.com/eventertainments.com/blog/wp-content/uploads/2021/03/Best-Wedding-Stage-Decoration-with-Flowers.jpg?fit=1200%2C900&ssl=1',
  'https://cdn0.weddingwire.in/vendor/8241/3_2/960/jpg/img-20180903-wa0013_15_158241.jpeg',
  'https://www.dreamzkraft.com/admin/blog-images/big/decoration-for-wedding/wedding-decoration%E2%80%93royal-2.jpg',
];
int ind = 0;

class _YellowVenueViewState extends State<YellowVenueView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      ind = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: drawer1(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 6.h,
                ),
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
                      'My Venue',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: 'sofi',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    IconButton(
                        onPressed: () {
                          scaffoldKey.currentState?.openDrawer();
                        },
                        icon: Icon(Icons.menu_rounded)),
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Vinsmoke Sanji',
                          style: TextStyle(
                              fontSize: 17.sp,
                              color: Colors.amber,
                              fontFamily: 'sofi',
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          'sanji@gmail.com',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black.withOpacity(0.7),
                              fontFamily: 'sofi',
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 1.w),
                      height: 7.h,
                      width: 15.w,
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
                SizedBox(height: 1.h),
                Stack(
                  children: [
                    CarouselSlider.builder(
                      itemCount: HotelIm.length,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: HotelIm[index],
                                fit: BoxFit.cover,
                                progressIndicatorBuilder: (context, url,
                                    progress) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                      'assets/deprf.png',
                                    ),
                              ),
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              ind = index;
                              print(ind);
                            });
                          },
                          viewportFraction: 1,
                          enableInfiniteScroll: false,
                          pageSnapping: true,
                          height: 32.h,
                          padEnds: true,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.2),
                    ),
                    Positioned(
                      bottom: 0.5.h,
                      left: 35.w,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black26.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(80)),
                        padding: EdgeInsets.symmetric(
                            vertical: 0.5.h, horizontal: 3.w),
                        child: AnimatedSmoothIndicator(
                          activeIndex: ind,
                          count: HotelIm.length,
                          effect: ScrollingDotsEffect(
                            activeDotColor: Colors.amber,
                            activeStrokeWidth: 2.6,
                            activeDotScale: 1.2,
                            strokeWidth: 9,
                            maxVisibleDots: 5,
                            radius: 8,
                            spacing: 9,
                            dotHeight: 10,
                            dotWidth: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 1.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.amber),
                              child: Icon(
                                CupertinoIcons.globe,
                                color: Colors.white,
                                size: 18.sp,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Venue Name : ',
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Colors.amber,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 0.5.h),
                                SizedBox(
                                  width: 67.w,
                                  child: Text(
                                    'Royale Decor',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.black.withOpacity(0.8),
                                        fontFamily: 'sofi',
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            CupertinoIcons.heart,
                            size: 22.sp,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 1.5.h),
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.amber),
                              child: Icon(
                                CupertinoIcons.phone,
                                color: Colors.white,
                                size: 18.sp,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Contact : ',
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Colors.amber,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 0.5.h),
                                Text(
                                  '7041648493',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black.withOpacity(0.8),
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 7.w),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.amber),
                              child: Icon(
                                CupertinoIcons.money_dollar,
                                color: Colors.white,
                                size: 18.sp,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Cost : ',
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Colors.amber,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 0.5.h),
                                Text(
                                  '\$ 750',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black.withOpacity(0.8),
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 2.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.amber),
                          child: Icon(
                            Icons.chair_outlined,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Seating Capacity : ',
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.amber,
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 0.5.h),
                            Text(
                              '100 Seats',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black.withOpacity(0.8),
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 2.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.amber),
                          child: Icon(
                            Icons.table_restaurant_outlined,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Available Tables : ',
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.amber,
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 0.5.h),
                            Text(
                              '15 Tables',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black.withOpacity(0.8),
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 2.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.amber),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Address : ',
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.amber,
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 0.5.h),
                            SizedBox(
                              width: 77.w,
                              child: Text(
                                'Katargaam, Dabholi rd, Surat 395004',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.black.withOpacity(0.8),
                                    fontFamily: 'sofi',
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 2.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.amber),
                          child: Icon(
                            CupertinoIcons.info_circle,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'About : ',
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.amber,
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 0.5.h),
                            SizedBox(
                              width: 76.w,
                              child: ReadMoreText(
                                'A hotel is an establishment that provides paid lodging on a short-term basis. Facilities provided inside a hotel room may range from a modest-quality mattress in a small room to large suites with bigger, higher-quality beds.',
                                trimLines: 4,
                                style: TextStyle(
                                    height: 1.4,
                                    fontSize: 15.sp,
                                    color: Colors.black.withOpacity(0.8),
                                    fontFamily: 'sofi',
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                                colorClickableText: Colors.amber,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: ' Read More',
                                trimExpandedText: ' Read Less',
                                moreStyle: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold),
                                lessStyle: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 2.5.h),

                    // SizedBox(height: 4.5.h),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     InkWell(
                    //       child: Container(
                    //         height: 5.5.h,
                    //         width: 45.w,
                    //         decoration: BoxDecoration(
                    //           color: Colors.amber,
                    //           borderRadius: BorderRadius.circular(25.sp),
                    //         ),
                    //         child: Center(
                    //             child: Text(
                    //           "Add to Budget",
                    //           style: TextStyle(
                    //               fontSize: 13.sp,
                    //               color: Colors.white,
                    //               fontFamily: 'get'),
                    //         )),
                    //       ),
                    //     ),
                    //     InkWell(
                    //       onTap: () {},
                    //       child: Container(
                    //         height: 5.5.h,
                    //         width: 45.w,
                    //         decoration: BoxDecoration(
                    //           color: Colors.amber,
                    //           borderRadius: BorderRadius.circular(25.sp),
                    //         ),
                    //         child: Center(
                    //             child: Text(
                    //           "Book Now",
                    //           style: TextStyle(
                    //               fontSize: 13.sp,
                    //               color: Colors.white,
                    //               fontFamily: 'get'),
                    //         )),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 3.5.h),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
