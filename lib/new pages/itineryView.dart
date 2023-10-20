import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

import '../widgets/drawer.dart';

class ItineryView extends StatefulWidget {
  const ItineryView({super.key});

  @override
  State<ItineryView> createState() => _ItineryViewState();
}

int sel = 0;
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
List cate = [
  'Wedding Hall',
  'Decor',
  'Cake',
  'Accommodation',
  'Transportation',
  'Food Menu'
];
List VenueIm = [
  'https://i0.wp.com/decorsutrablog.com/wp-content/uploads/2020/06/DecorSutra_Wedding-Decor-9_Royal-Decor.jpg?fit=780%2C425&ssl=1',
  'https://i.pinimg.com/originals/2f/10/f6/2f10f6363ce6fd2461cec2bd46dbc916.jpg',
  'https://fancdesigns.com/wp-content/uploads/2016/08/royal-decorations-40-royal-wedding-decorations-2246-x-1162-1.jpg',
  'https://i0.wp.com/eventertainments.com/blog/wp-content/uploads/2021/03/Best-Wedding-Stage-Decoration-with-Flowers.jpg?fit=1200%2C900&ssl=1',
  'https://cdn0.weddingwire.in/vendor/8241/3_2/960/jpg/img-20180903-wa0013_15_158241.jpeg',
  'https://www.dreamzkraft.com/admin/blog-images/big/decoration-for-wedding/wedding-decoration%E2%80%93royal-2.jpg',
];
int ind1 = 0;
List HotelIm = [
  'https://static01.nyt.com/images/2019/03/24/travel/24trending-shophotels1/24trending-shophotels1-jumbo.jpg?quality=75&auto=webp',
  'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg',
  'https://img.freepik.com/premium-photo/luxury-interior-design-bedroom-pool-villa_41487-28.jpg?w=826',
  'https://img.freepik.com/free-photo/modern-studio-apartment-design-with-bedroom-living-space_1262-12375.jpg?w=826&t=st=1693901111~exp=1693901711~hmac=5789ceb2f26a983c2ea4886be9f710d1df4974ee16d9e962dfb80c69724499f7',
  'https://img.freepik.com/free-photo/luxury-bedroom-suite-resort-high-rise-hotel-with-working-table_105762-1783.jpg?size=626&ext=jpg&ga=GA1.1.1162323827.1691047344&semt=ais',
  'https://assets-global.website-files.com/5c6d6c45eaa55f57c6367749/628d35d6b9575f5b35b4231a_Twin%20Hotel%20Room%20(1)%20(1).jpg',
];
int ind = 0;

class _ItineryViewState extends State<ItineryView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      sel = 0;
      ind1 = 0;
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
        child: Center(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     IconButton(
                    //         onPressed: () {
                    //           Get.back();
                    //         },
                    //         icon: Icon(
                    //           Icons.arrow_back_ios_new_rounded,
                    //           color: Colors.blue,
                    //           size: 23.sp,
                    //         )),
                    //     Text(
                    //       "Itinerary View",
                    //       style: TextStyle(
                    //         fontSize: 18.sp,
                    //         color: Colors.blue,
                    //         fontFamily: 'sofi',
                    //         letterSpacing: 1,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //     IconButton(
                    //         onPressed: () {
                    //           scaffoldKey.currentState?.openDrawer();
                    //         },
                    //         icon: Icon(
                    //           Icons.menu_rounded,
                    //           color: Colors.blue,
                    //           size: 23.sp,
                    //         ))
                    //   ],
                    // ),
                    header(text: "Itinerary View",callback1: (){
                      scaffoldKey.currentState?.openDrawer();
                    }),
                    // headerwid(text: "Itinerary View"),
                    SizedBox(height: 1.h),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    height: 21.h,
                    padding: EdgeInsets.all(1.w),
                    margin: EdgeInsets.symmetric(horizontal: 1.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 0.5.w),
                          height: 17.h,
                          width: 30.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:
                                  'https://www.oyorooms.com/blog/wp-content/uploads/2018/02/fe.jpg',
                              progressIndicatorBuilder: (context, url,
                                      progress) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Image.asset(
                                'assets/deprf.png',
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 15.sp,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  'Surat',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(height: 0.5.h),
                            Container(
                              padding: EdgeInsets.only(left: 1.w),
                              child: Text(
                                '\$ 25000',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 2.h),
                    SizedBox(
                      height: 5.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      sel = index;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.h, horizontal: 9.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: sel == index
                                            ? Colors.blue
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Text(cate[index],
                                        style: TextStyle(
                                            fontSize: 12.5.sp,
                                            fontFamily: 'sofi',
                                            color: sel == index
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: cate.length,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
              sel == 0
                  ? SliverToBoxAdapter(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selected Wedding Hall : ',
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontFamily: 'sofi',
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Stack(
                            children: [
                              CarouselSlider.builder(
                                itemCount: VenueIm.length,
                                itemBuilder: (context, index, realIndex) {
                                  return Container(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          imageUrl: VenueIm[index],
                                          fit: BoxFit.cover,
                                          progressIndicatorBuilder: (context,
                                                  url, progress) =>
                                              Center(
                                                  child:
                                                      CircularProgressIndicator()),
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
                                        ind1 = index;
                                        print(ind1);
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Container(
                                            padding: EdgeInsets.all(2.w),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.blue),
                                            child: Icon(CupertinoIcons.back,color: Colors.white,))),
                                    InkWell(
                                      child: Container(
                                          padding: EdgeInsets.all(2.w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.blue),
                                          child: Icon(Icons.favorite,color: Colors.white,)),
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
                                    activeIndex: ind1,
                                    count: VenueIm.length,
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
                                'Royal Decor',
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
                                      color: Colors.black.withOpacity(0.8),
                                      size: 17.sp),
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
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 13.5.sp,
                                      color: Colors.black.withOpacity(0.8),
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                  colorClickableText: Colors.blue,
                                  trimLength: 130,
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
                                    '\$ 770',
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        color: Colors.black,
                                        fontFamily: 'sofi',
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: 3.h),
                            ],
                          ),
                        ],
                      ),
                    )
                  : sel == 1
                      ? SliverToBoxAdapter(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selected Decor : ',
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              SizedBox(
                                height: 80.h,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Container(
                                          height: 18.h,
                                          padding: EdgeInsets.all(1.w),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 1.w),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 0.5.w),
                                                height: 16.h,
                                                width: 30.w,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    imageUrl:
                                                        'https://shaadiwish.com/blog/wp-content/uploads/2022/03/26.jpg',
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                progress) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Image.asset(
                                                      'assets/deprf.png',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                    width: 54.w,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 1.w),
                                                          child: Text(
                                                            'Flower Decor',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 1.h),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 1.w),
                                                    width: 55.w,
                                                    child: Text(
                                                      'The earliest known flower arranging dates back to ancient Egypt. Egyptians were decorating with flowers as early as 2,500 BCE. They regularly placed cut flowers in vases,',
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.7),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                  SizedBox(height: 1.h),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .location_on_outlined,
                                                        size: 15.sp,
                                                        color: Colors.black
                                                            .withOpacity(0.8),
                                                      ),
                                                      SizedBox(
                                                        width: 1.w,
                                                      ),
                                                      Text(
                                                        'Royal View',
                                                        style: TextStyle(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.8),
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 1.h),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 1.w),
                                                    child: Text(
                                                      '\$ 200',
                                                      style: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.8),
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
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
                        )
                      : sel == 2
                          ? SliverToBoxAdapter(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Selected Cake : ',
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SizedBox(
                                    height: 80.h,
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      itemCount: 1,
                                      itemBuilder: (context, index) {
                                        return Card(
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Container(
                                              height: 18.h,
                                              padding: EdgeInsets.all(1.w),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 1.w),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 0.5.w),
                                                    height: 16.h,
                                                    width: 30.w,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl:
                                                            'https://media.istockphoto.com/id/1316215960/photo/elegant-wedding-cake-with-golden-and-rose-details.jpg?s=612x612&w=0&k=20&c=d4XBi-pWdJDxqgtWuhg2jIdCoJpJiS4pY16IlLtviG0=',
                                                        progressIndicatorBuilder:
                                                            (context, url,
                                                                    progress) =>
                                                                Center(
                                                                    child:
                                                                        CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.asset(
                                                          'assets/deprf.png',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      SizedBox(
                                                        width: 54.w,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          1.w),
                                                              child: Text(
                                                                '3 Layer Cake',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 1.h),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 1.w),
                                                        width: 55.w,
                                                        child: Text(
                                                          'A Beautiful 3 Layer wedding Cake Made with Strawberry Flavoured vanilla Base ',
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.7),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontSize: 11.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      SizedBox(height: 1.h),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .location_on_outlined,
                                                            size: 15.sp,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.8),
                                                          ),
                                                          SizedBox(
                                                            width: 1.w,
                                                          ),
                                                          Text(
                                                            'Royal View',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.8),
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 1.h),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 1.w),
                                                        child: Text(
                                                          '\$ 100',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.8),
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
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
                            )
                          : sel == 3
                              ? SliverToBoxAdapter(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Selected Accommodation : ',
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          fontFamily: 'sofi',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Stack(
                                        children: [
                                          CarouselSlider.builder(
                                            itemCount: HotelIm.length,
                                            itemBuilder:
                                                (context, index, realIndex) {
                                              return Container(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: CachedNetworkImage(
                                                      imageUrl: HotelIm[index],
                                                      fit: BoxFit.cover,
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  progress) =>
                                                              Center(
                                                                  child:
                                                                      CircularProgressIndicator()),
                                                      errorWidget: (context,
                                                              url, error) =>
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
                                                horizontal: 1.w,
                                                vertical: 0.5.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                        padding:
                                                            EdgeInsets.all(2.w),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color:
                                                                Colors.white),
                                                        child: Icon(
                                                            CupertinoIcons
                                                                .back))),
                                                InkWell(
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.all(2.w),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors.white),
                                                      child: Icon(CupertinoIcons
                                                          .heart)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0.5.h,
                                            left: 35.w,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black26
                                                      .withOpacity(0.25),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          80)),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.5.h,
                                                  horizontal: 3.w),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.location_on_outlined,
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  size: 17.sp),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(top: 0.5.h),
                                                width: 85.w,
                                                child: Text(
                                                  'Sitanagar Chokdi,Punagaam,Surat',
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color: Colors.black
                                                          .withOpacity(0.8),
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                                  color: Colors.black
                                                      .withOpacity(0.8),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '\$ 150',
                                                style: TextStyle(
                                                    fontSize: 17.sp,
                                                    color: Colors.black,
                                                    fontFamily: 'sofi',
                                                    letterSpacing: 1,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                ' / night',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.black
                                                        .withOpacity(0.6),
                                                    fontFamily: 'sofi',
                                                    letterSpacing: 1,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 2.w),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 6.w,
                                                                vertical:
                                                                    3.5.w),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors
                                                                .lightGreenAccent
                                                                .withOpacity(
                                                                    0.3)),
                                                        child: Icon(
                                                            CupertinoIcons.wifi,
                                                            size: 20.sp,
                                                            color: Colors.green
                                                                .shade900),
                                                      ),
                                                      SizedBox(height: 1.h),
                                                      Text(
                                                        'WI-FI',
                                                        style: TextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                Colors.black87,
                                                            fontFamily: 'sofi',
                                                            letterSpacing: 1,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 2.w),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 6.w,
                                                                vertical:
                                                                    3.5.w),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors
                                                                .lightBlueAccent
                                                                .withOpacity(
                                                                    0.3)),
                                                        child: Icon(
                                                            CupertinoIcons.wind,
                                                            size: 20.sp,
                                                            color: Colors
                                                                .lightBlue
                                                                .shade900),
                                                      ),
                                                      SizedBox(height: 1.h),
                                                      Text(
                                                        'AC',
                                                        style: TextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                Colors.black87,
                                                            fontFamily: 'sofi',
                                                            letterSpacing: 1,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 2.w),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 6.w,
                                                                vertical:
                                                                    3.5.w),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors
                                                                .orangeAccent
                                                                .withOpacity(
                                                                    0.3)),
                                                        child: Icon(
                                                            Icons
                                                                .fastfood_outlined,
                                                            size: 20.sp,
                                                            color: Colors.orange
                                                                .shade900),
                                                      ),
                                                      SizedBox(height: 1.h),
                                                      Text(
                                                        'Restaurant',
                                                        style: TextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                Colors.black87,
                                                            fontFamily: 'sofi',
                                                            letterSpacing: 1,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 2.w),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 6.w,
                                                                vertical:
                                                                    3.5.w),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors
                                                                .deepPurpleAccent
                                                                .withOpacity(
                                                                    0.3)),
                                                        child: Icon(
                                                            CupertinoIcons
                                                                .car_detailed,
                                                            size: 20.sp,
                                                            color: Colors
                                                                .deepPurple
                                                                .shade900),
                                                      ),
                                                      SizedBox(height: 1.h),
                                                      Text(
                                                        'Parking',
                                                        style: TextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                Colors.black87,
                                                            fontFamily: 'sofi',
                                                            letterSpacing: 1,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 3.h),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : sel == 4
                                  ? SliverToBoxAdapter(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Selected Transportation : ',
                                            style: TextStyle(
                                              fontSize: 17.sp,
                                              fontFamily: 'sofi',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 0.5.w),
                                                height: 28.h,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        'https://www.transparentpng.com/thumb/car-png/car-free-transparent-png-8.png',
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                progress) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Image.asset(
                                                      'assets/deprf.png',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // Image.network(
                                              //   "https://www.transparentpng.com/thumb/car-png/car-free-transparent-png-8.png",
                                              //   height: 28.h,
                                              // ),
                                              Text(
                                                "BMW 6 Series i4 Top Model...",
                                                style: TextStyle(
                                                  fontSize: 17.sp,
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "sofi",
                                                ),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Container(
                                                width: 110.w,
                                                child: Card(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2.h,
                                                            horizontal: 4.w),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.date_range,
                                                          size: 20.sp,
                                                          color: Colors.blue,
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Pick-Up Date",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontFamily:
                                                                    "sofi",
                                                                fontSize: 15.sp,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 0.5.h,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "21-09-2023",
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        "sofi",
                                                                    fontSize:
                                                                        15.sp,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 110.w,
                                                child: Card(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2.h,
                                                            horizontal: 4.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .timer_outlined,
                                                              size: 20.sp,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                            SizedBox(
                                                              width: 3.w,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Pick-Up Time",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15.sp,
                                                                    fontFamily:
                                                                        "sofi",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 0.5.h,
                                                                ),
                                                                Text(
                                                                  "09:55 Am",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15.sp,
                                                                    fontFamily:
                                                                        "sofi",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .timer_outlined,
                                                              size: 20.sp,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                            SizedBox(
                                                              width: 3.w,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Drop-Off Time",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15.sp,
                                                                    fontFamily:
                                                                        "sofi",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 0.5.h,
                                                                ),
                                                                Text(
                                                                  "08:55 Pm",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15.sp,
                                                                    fontFamily:
                                                                        "sofi",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 110.w,
                                                child: Card(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2.h,
                                                            horizontal: 4.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .currency_rupee_sharp,
                                                              size: 20.sp,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                            SizedBox(
                                                              width: 3.w,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Amount",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15.sp,
                                                                    fontFamily:
                                                                        "sofi",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 0.5.h,
                                                                ),
                                                                Text(
                                                                  "\$200",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15.sp,
                                                                    fontFamily:
                                                                        "sofi",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.12),
                                                          height: 5.h,
                                                          width: 0.5.w,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .people_outline_rounded,
                                                              size: 20.sp,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                            SizedBox(
                                                              width: 3.w,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "People",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15.sp,
                                                                    fontFamily:
                                                                        "sofi",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 0.5.h,
                                                                ),
                                                                Text(
                                                                  "(1-2)",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15.sp,
                                                                    fontFamily:
                                                                        "sofi",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 110.w,
                                                child: Card(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2.h,
                                                            horizontal: 4.w),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .location_on_outlined,
                                                          size: 20.sp,
                                                          color: Colors.blue,
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Pick-Up Location",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontFamily:
                                                                    "sofi",
                                                                fontSize: 15.sp,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 0.5.h,
                                                            ),
                                                            Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 65.w,
                                                                  child: Text(
                                                                    maxLines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    "Surat,Ktargam,Gujarat,395004",
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          "sofi",
                                                                      fontSize:
                                                                          15.sp,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 110.w,
                                                child: Card(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2.h,
                                                            horizontal: 4.w),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .location_on_outlined,
                                                          size: 20.sp,
                                                          color: Colors.blue,
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Drop-Off Location",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontFamily:
                                                                    "sofi",
                                                                fontSize: 15.sp,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 0.5.h,
                                                            ),
                                                            Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 65.w,
                                                                  child: Text(
                                                                    maxLines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    "Baroda,BhaguNagar,Kamrej395002",
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          "sofi",
                                                                      fontSize:
                                                                          15.sp,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 2.h),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  : SliverToBoxAdapter(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Selected Food Menu : ',
                                            style: TextStyle(
                                              fontSize: 17.sp,
                                              fontFamily: 'sofi',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          SizedBox(
                                            height: 80.h,
                                            child: ListView.builder(
                                              padding: EdgeInsets.zero,
                                              itemCount: 1,
                                              itemBuilder: (context, index) {
                                                return Card(
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Container(
                                                      height: 18.h,
                                                      padding:
                                                          EdgeInsets.all(1.w),
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 1.w),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        0.5.w),
                                                            height: 16.h,
                                                            width: 30.w,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                imageUrl:
                                                                    'https://res.cloudinary.com/purnesh/image/upload/w_1080,f_auto/golden-fiesta-h.jpg',
                                                                progressIndicatorBuilder: (context,
                                                                        url,
                                                                        progress) =>
                                                                    Center(
                                                                        child:
                                                                            CircularProgressIndicator()),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    Image.asset(
                                                                  'assets/deprf.png',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              SizedBox(
                                                                width: 54.w,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      padding: EdgeInsets.only(
                                                                          left:
                                                                              1.w),
                                                                      child:
                                                                          Text(
                                                                        'Chinese Platter',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize: 13.sp,
                                                                            fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 1.h),
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 1
                                                                            .w),
                                                                width: 55.w,
                                                                child: Text(
                                                                  'Full Plate With Selected Meals In One Dish All Chinese Food.',
                                                                  maxLines: 2,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.7),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      fontSize:
                                                                          11.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 1.h),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .location_on_outlined,
                                                                    size: 15.sp,
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.8),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 1.w,
                                                                  ),
                                                                  Text(
                                                                    'Royal View',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(
                                                                                0.8),
                                                                        fontSize: 12
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height: 1.h),
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 1
                                                                            .w),
                                                                child: Text(
                                                                  '\$ 60',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.8),
                                                                      fontSize:
                                                                          16.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
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
            ],
          ),
        ),
      ),
    );
  }
}
