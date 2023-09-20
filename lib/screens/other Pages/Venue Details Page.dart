import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class VenueView extends StatefulWidget {
  const VenueView({super.key});

  @override
  State<VenueView> createState() => _VenueViewState();
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

class _VenueViewState extends State<VenueView> {
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 1.w, vertical: 0.5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                  padding: EdgeInsets.all(2.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Icon(CupertinoIcons.back))),
                          InkWell(
                            child: Container(
                                padding: EdgeInsets.all(2.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Icon(CupertinoIcons.heart)),
                          ),
                        ],
                      ),
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
                            activeDotColor: Colors.pink,
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
                    SizedBox(height: 2.h),
                    Text(
                      'Royal Decor',
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.pink,
                          fontFamily: 'sofi',
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: Colors.black.withOpacity(0.8), size: 17.sp),
                        Container(
                          padding: EdgeInsets.only(top: 0.5.h),
                          width: 85.w,
                          child: Text(
                            'Katargaam,Surat',
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.black.withOpacity(0.8),
                                fontFamily: 'sofi',
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.5.h),
                    Text(
                      'Details',
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.pink,
                          fontFamily: 'sofi',
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 1.h),
                    SizedBox(
                      width: 90.w,
                      child: ReadMoreText(
                        'A hotel is an establishment that provides paid lodging on a short-term basis. Facilities provided inside a hotel room may range from a modest-quality mattress in a small room to large suites with bigger, higher-quality beds.',
                        trimLines: 4,
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 13.5.sp,
                            color: Colors.black.withOpacity(0.8),
                            fontFamily: 'sofi',
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: ' Read More',
                        trimExpandedText: ' Read Less',
                        moreStyle: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.pink,
                            fontWeight: FontWeight.bold),
                        lessStyle: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.pink,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Text(
                      'Rates',
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.pink,
                          fontFamily: 'sofi',
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$ 770',
                          style: TextStyle(
                              fontSize: 17.sp,
                              color: Colors.black,
                              fontFamily: 'sofi',
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' / floor',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: 'sofi',
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),


                    SizedBox(height: 4.5.h),
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
                    ), SizedBox(height: 3.5.h),
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
