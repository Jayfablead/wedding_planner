import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wedding_planner/new%20pages/itineryPage.dart';
import 'package:wedding_planner/screens/other%20Pages/ChatListPage.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class QuatationDetails2 extends StatefulWidget {
  const QuatationDetails2({super.key});

  @override
  State<QuatationDetails2> createState() => _QuatationDetails2State();
}

int ind = 0;
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
List HotelIm = [
  'https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg',
  'https://balloonpro.in/wp-content/uploads/2023/06/20210306_090946.jpg',
  'https://content.jdmagicbox.com/comp/ahmedabad/a8/079pxx79.xx79.190719110521.s4a8/catalogue/lilly-s-flower-decoration-and-gift-shop-ghatlodiya-ahmedabad-decorators-ypttjhzlti.jpg?clr=',
];

class _QuatationDetails2State extends State<QuatationDetails2> {
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
      drawer: drawer1(),
      key: _scaffoldKey,
      body: SingleChildScrollView(
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
                          width: 95.w,
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
                              errorWidget: (context, url, error) => Image.asset(
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
                      vertical: 0.3.h,
                    ),
                    child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Icon(CupertinoIcons.back))),
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
                          color: Colors.pink,
                          fontFamily: 'sofi',
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2.5.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.pink),
                          child: Icon(
                            Icons.person_outline_rounded,
                            color: Colors.white,
                            size: 22.sp,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Supplier : ',
                              style: TextStyle(
                                  fontSize: 14.5.sp,
                                  fontFamily: 'sofi',
                                  color: Colors.pink,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 75.w,
                              child: Text(
                                'Vinsmoke Sanji',
                                style: TextStyle(
                                    height: 1.5,
                                    fontSize: 14.sp,
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
                    SizedBox(height: 3.5.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.pink),
                          child: Icon(
                            CupertinoIcons.phone,
                            color: Colors.white,
                            size: 22.sp,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone : ',
                              style: TextStyle(
                                  fontSize: 14.5.sp,
                                  fontFamily: 'sofi',
                                  color: Colors.pink,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 75.w,
                              child: Text(
                                '7041648493',
                                style: TextStyle(
                                    height: 1.5,
                                    fontSize: 14.sp,
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
                    SizedBox(height: 3.5.h),
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.pink),
                              child: Icon(
                                Icons.access_time_rounded,
                                color: Colors.white,
                                size: 22.sp,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Date : ',
                                  style: TextStyle(
                                      fontSize: 14.5.sp,
                                      color: Colors.pink,
                                      // color: Colors.pink,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '12-01-29',
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 14.sp,
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
                                  color: Colors.pink),
                              child: Icon(
                                Icons.attach_money_outlined,
                                color: Colors.white,
                                size: 22.sp,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cost : ',
                                  style: TextStyle(
                                      fontSize: 14.5.sp,
                                      color: Colors.pink,
                                      // color: Colors.pink,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\$ 1500',
                                  style: TextStyle(
                                      height: 1.5,
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
                      ],
                    ),
                    SizedBox(height: 3.5.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.pink),
                          child: Icon(
                            Icons.person_outline_rounded,
                            color: Colors.white,
                            size: 22.sp,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Details :',
                              style: TextStyle(
                                  fontSize: 14.5.sp,
                                  color: Colors.pink,
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 1.h),
                            SizedBox(
                              width: 75.w,
                              child: ReadMoreText(
                                'A flower, sometimes known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae). Flowers produce gametophytes, which in flowering plants consist of a few haploid cells which produce gametes.',
                                trimLines: 4,
                                trimLength: 130,
                                style: TextStyle(
                                    height: 1.5,
                                    fontSize: 14.sp,
                                    color: Colors.black.withOpacity(0.8),
                                    fontFamily: 'sofi',
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                                colorClickableText: Colors.pink,
                                trimMode: TrimMode.Length,
                                trimCollapsedText: 'Read More',
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
                          ],
                        ),
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
                            width: 42.w,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(25.sp),
                            ),
                            child: Center(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(CupertinoIcons.check_mark_circled,
                                    color: Colors.white),
                                SizedBox(width: 2.w),
                                Text(
                                  "Accept",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.white,
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
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(25.sp),
                            ),
                            child: Center(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(CupertinoIcons.chat_bubble_text,
                                    color: Colors.white),
                                SizedBox(width: 2.w),
                                Text(
                                  "Chat now",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.white,
                                      fontFamily: 'get'),
                                ),
                              ],
                            )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.5.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
