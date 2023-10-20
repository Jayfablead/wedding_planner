import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Acco_view extends StatefulWidget {
  const Acco_view({super.key});

  @override
  State<Acco_view> createState() => _Acco_viewState();
}

final controller = PageController(viewportFraction: 0.8, keepPage: true);
List HotelIm = [
  'https://static01.nyt.com/images/2019/03/24/travel/24trending-shophotels1/24trending-shophotels1-jumbo.jpg?quality=75&auto=webp',
  'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg',
  'https://img.freepik.com/premium-photo/luxury-interior-design-bedroom-pool-villa_41487-28.jpg?w=826',
  'https://img.freepik.com/free-photo/modern-studio-apartment-design-with-bedroom-living-space_1262-12375.jpg?w=826&t=st=1693901111~exp=1693901711~hmac=5789ceb2f26a983c2ea4886be9f710d1df4974ee16d9e962dfb80c69724499f7',
  'https://img.freepik.com/free-photo/luxury-bedroom-suite-resort-high-rise-hotel-with-working-table_105762-1783.jpg?size=626&ext=jpg&ga=GA1.1.1162323827.1691047344&semt=ais',
  'https://assets-global.website-files.com/5c6d6c45eaa55f57c6367749/628d35d6b9575f5b35b4231a_Twin%20Hotel%20Room%20(1)%20(1).jpg',
];
int ind = 0;

class _Acco_viewState extends State<Acco_view> {
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
                                      color: Colors.blue),
                                  child: Icon(CupertinoIcons.back,color: Colors.white,))),
                          InkWell(
                            child: Container(
                                padding: EdgeInsets.all(2.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue),
                                child: Icon(Icons.favorite,color: Colors.white)),
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
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.h),
                    Text(
                      'Hotel Marriott Luxeriya',
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.blue,
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
                            'Sitanagar Chokdi,Punagaam,Surat',
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
                          color: Colors.blue,
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
                        colorClickableText: Colors.blue,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: ' Read More',
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
                    SizedBox(height: 2.5.h),
                    Text(
                      'Rates',
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.blue,
                          fontFamily: 'sofi',
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$ 150',
                          style: TextStyle(
                              fontSize: 17.sp,
                              color: Colors.black,
                              fontFamily: 'sofi',
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' / night',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: 'sofi',
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.5.h),
                    Text(
                      'Amenities',
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.blue,
                          fontFamily: 'sofi',
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2.h),
                    SizedBox(
                      height: 12.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6.w, vertical: 3.5.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.lightGreenAccent
                                          .withOpacity(0.3)),
                                  child: Icon(CupertinoIcons.wifi,
                                      size: 20.sp,
                                      color: Colors.green.shade900),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  'WI-FI',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.black87,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6.w, vertical: 3.5.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.lightBlueAccent
                                          .withOpacity(0.3)),
                                  child: Icon(CupertinoIcons.wind,
                                      size: 20.sp,
                                      color: Colors.lightBlue.shade900),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  'AC',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.black87,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6.w, vertical: 3.5.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          Colors.orangeAccent.withOpacity(0.3)),
                                  child: Icon(Icons.fastfood_outlined,
                                      size: 20.sp,
                                      color: Colors.orange.shade900),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  'Restaurant',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.black87,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6.w, vertical: 3.5.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.deepPurpleAccent
                                          .withOpacity(0.3)),
                                  child: Icon(CupertinoIcons.car_detailed,
                                      size: 20.sp,
                                      color: Colors.deepPurple.shade900),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  'Parking',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.black87,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Container(
                            height: 5.5.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                              color: Colors.blue,
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
                          onTap: () {},
                          child: Container(
                            height: 5.5.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                              color: Colors.blue,
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
