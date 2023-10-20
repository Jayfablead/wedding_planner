import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wedding_planner/new%20pages/itineryPage.dart';
import 'package:wedding_planner/screens/other%20Pages/ChatListPage.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class quotedetailpage extends StatefulWidget {
  const quotedetailpage({super.key});

  @override
  State<quotedetailpage> createState() => _quotedetailpageState();
}

class _quotedetailpageState extends State<quotedetailpage> {
  int ind = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List HotelIm = [
    'https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg',
    'https://balloonpro.in/wp-content/uploads/2023/06/20210306_090946.jpg',
    'https://content.jdmagicbox.com/comp/ahmedabad/a8/079pxx79.xx79.190719110521.s4a8/catalogue/lilly-s-flower-decoration-and-gift-shop-ghatlodiya-ahmedabad-decorators-ypttjhzlti.jpg?clr=',
  ];

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
      backgroundColor: Colors.grey.shade100,
      drawer: drawer1(),
      key: scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 6.h,
                ),
                Stack(
                  children: [
                    CarouselSlider.builder(
                      itemCount: HotelIm.length,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(0),
                                ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 1.h,
                      ),
                      child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 5.h,
                              width: 10.w,
                              // padding: EdgeInsets.all(2.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue),
                              child: Icon(
                                CupertinoIcons.back,
                                color: Colors.white,
                                size: 23.sp,
                              ))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(80)),
                  padding:
                      EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 3.w),
                  child: AnimatedSmoothIndicator(
                    activeIndex: ind,
                    count: HotelIm.length,
                    effect: ScrollingDotsEffect(
                      activeDotColor: Colors.blue,
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
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2.h),
                      Text(
                        'Flower Decoration',
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.blue,
                            fontFamily: 'sofi',
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Vinsmoke Sanji',
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 14.sp,
                            color: Colors.grey,
                            fontFamily: 'sofi',
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.call,
                                  color: Colors.blue,
                                  size: 22.sp,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    // width: 75.w,
                                    child: Text(
                                      '7041648493',
                                      style: TextStyle(
                                          height: 1.5,
                                          fontSize: 14.sp,
                                          color: Colors.grey,
                                          fontFamily: 'sofi',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                              child: RatingBar(
                            itemSize: 18,
                            glowColor: Colors.blue,
                            unratedColor: Colors.blue,
                            initialRating: 3,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            ratingWidget: RatingWidget(
                              full: Icon(
                                Icons.star,
                                color: Colors.blue,
                              ),
                              half: Icon(Icons.star_half_sharp,
                                  color: Colors.blue),
                              empty: Icon(Icons.star, color: Colors.grey),
                            ),
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          )),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(ItinerPage());
                            },
                            child: Container(
                              height: 5.5.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(25.sp),
                              ),
                              child: Center(
                                  child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.check_circle, color: Colors.blue),
                                  SizedBox(width: 2.w),
                                  Text(
                                    "Accept",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'get'),
                                  ),
                                ],
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              ChatlistPage(
                                sele: 3,
                              );
                            },
                            child: Container(
                              height: 5.5.h,
                              width: 42.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(25.sp),
                              ),
                              child: Center(
                                  child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.message, color: Colors.blue),
                                  SizedBox(width: 2.w),
                                  Text(
                                    "Chat now",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'get'),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.5.h),
                      Text(
                        'Quotation',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.blue,
                            // color: Colors.blue,
                            fontFamily: 'sofi',
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2.h),
                      Container(
                        padding: EdgeInsets.all(10),
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
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  // padding: EdgeInsets.all(3.w),
                                  // decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(7),
                                  //     color: Colors.blue),
                                  child: Text(
                                    'Amount to be paid',
                                    style: TextStyle(
                                        fontSize: 14.5.sp,
                                        color: Colors.black,
                                        // color: Colors.blue,
                                        fontFamily: 'sofi',
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   'Cost : ',
                                    //   style: TextStyle(
                                    //       fontSize: 14.5.sp,
                                    //       color: Colors.blue,
                                    //       // color: Colors.blue,
                                    //       fontFamily: 'sofi',
                                    //       letterSpacing: 1,
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                    Text(
                                      '\$ 1500',
                                      style: TextStyle(
                                          height: 1.5,
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                          fontFamily: 'sofi',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  // padding: EdgeInsets.all(3.w),
                                  // decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(7),
                                  //     color: Colors.blue),
                                  child: Text(
                                    'Advance deposit',
                                    style: TextStyle(
                                        fontSize: 14.5.sp,
                                        color: Colors.grey,
                                        // color: Colors.blue,
                                        fontFamily: 'sofi',
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   'Cost : ',
                                    //   style: TextStyle(
                                    //       fontSize: 14.5.sp,
                                    //       color: Colors.blue,
                                    //       // color: Colors.blue,
                                    //       fontFamily: 'sofi',
                                    //       letterSpacing: 1,
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                    Text(
                                      '\$ 500',
                                      style: TextStyle(
                                          height: 1.5,
                                          fontSize: 15.sp,
                                          color: Colors.grey,
                                          fontFamily: 'sofi',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  // padding: EdgeInsets.all(3.w),
                                  // decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(7),
                                  //     color: Colors.blue),
                                  child: Text(
                                    'Booking Amount',
                                    style: TextStyle(
                                        fontSize: 14.5.sp,
                                        color: Colors.grey,
                                        // color: Colors.blue,
                                        fontFamily: 'sofi',
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   'Cost : ',
                                    //   style: TextStyle(
                                    //       fontSize: 14.5.sp,
                                    //       color: Colors.blue,
                                    //       // color: Colors.blue,
                                    //       fontFamily: 'sofi',
                                    //       letterSpacing: 1,
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                    Text(
                                      '\$ 1000',
                                      style: TextStyle(
                                          height: 1.5,
                                          fontSize: 15.sp,
                                          color: Colors.grey,
                                          fontFamily: 'sofi',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 3.5.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.blue,
                                    fontFamily: 'sofi',
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 1.h),
                              SizedBox(
                                width: 88.w,
                                child: ReadMoreText(
                                  'A flower,sometimes known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae). Flowers produce gametophytes, which in flowering plants consist of a few haploid cells which produce gametes.',
                                  trimLines: 4,
                                  trimLength: 130,
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 13.sp,
                                      color: Colors.grey.shade700,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                  colorClickableText: Colors.blue,
                                  trimMode: TrimMode.Length,
                                  trimCollapsedText: 'Read More',
                                  trimExpandedText: ' Read Less',
                                  moreStyle: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                  lessStyle: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Text(
                        'Photos',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.blue,
                            fontFamily: 'sofi',
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Container(
                        height: 25.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 40.w,
                                margin: EdgeInsets.only(right: 3.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: HotelIm[index],
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder:
                                        (context, url, progress) => Center(
                                            child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      'assets/deprf.png',
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
