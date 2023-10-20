import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

import '../../widgets/drawer.dart';

class BookingList extends StatefulWidget {
  const BookingList({super.key});

  @override
  State<BookingList> createState() => _BookingListState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class icon {
  String? image;
  String? name;
  String? price;

  icon(
    this.image,
    this.name,
    this.price,
  );
}

List<icon> Icns = [
  icon('https://cdn-icons-png.flaticon.com/512/4474/4474469.png', 'Venue',
      '2500'),
  icon(
      'https://www.seekpng.com/png/full/41-415194_set-menu-food-black-icon.png',
      'Food',
      '2500'),
  icon('https://cdn-icons-png.flaticon.com/512/2907/2907439.png', 'Drinks',
      '500'),
  icon(
      'https://cdn-icons-png.flaticon.com/512/1683/1683807.png', 'Cake', '500'),
  icon(
      'https://i.pinimg.com/originals/61/3a/4f/613a4f9d74d7efc8fb5fc28c8a63446c.png',
      'Rings',
      '500'),
  icon('https://static.thenounproject.com/png/639559-200.png', 'Ceremony',
      '1000'),
  icon('https://cdn-icons-png.flaticon.com/512/2956/2956744.png', 'Photos',
      '1000'),
  icon('https://cdn-icons-png.flaticon.com/512/6491/6491292.png', 'Transport',
      '1000'),
  icon('https://cdn-icons-png.flaticon.com/512/2706/2706309.png', 'Planners',
      '1000'),
];

class _BookingListState extends State<BookingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      drawer: drawer1(),
      key: scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
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
                  //       "All Bookings",
                  //       style: TextStyle(
                  //         fontSize: 17.sp,
                  //         fontFamily: 'sofi',
                  //         letterSpacing: 1,
                  //         color: Colors.blue,
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
                  header(
                      text: "All Bookings",
                      callback1: () {
                        scaffoldKey.currentState?.openDrawer();
                      }),
                  // headerwid(text: "All Bookings"),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected Venue : ',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontFamily: 'sofi',
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Stack(
                    children: [
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                            height: 18.h,
                            padding: EdgeInsets.all(1.w),
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 0.5.w),
                                  height: 16.h,
                                  width: 30.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          'https://images.summitmedia-digital.com/preview/images/2019/04/26/cebu-wedding-venue-nm.jpg',
                                      progressIndicatorBuilder:
                                          (context, url, progress) => Center(
                                              child:
                                                  CircularProgressIndicator()),
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
                                    SizedBox(
                                      width: 54.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 1.w),
                                            child: Text(
                                              'Beach Shore View',
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
                                        'A Beach Shore Decoration venue Beach Shore Decoration venue A Beach Shore Decoration venue A Royal Decoration venue ',
                                        maxLines: 2,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    Row(
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
                                          'Dumas',
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 1.h),
                                    SizedBox(
                                      width: 55.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 1.w),
                                            child: Text(
                                              '\$ 10000',
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3.w,
                                                  vertical: 1.3.h),
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          90)),
                                              child: Text(
                                                'View Details',
                                                style: TextStyle(
                                                    fontSize: 11.sp,
                                                    color: Colors.white,
                                                    fontFamily: 'sofi',
                                                    letterSpacing: 1,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                      // Positioned(
                      //   left: 84.w,
                      //   bottom: 15.h,
                      //   child: IconButton(
                      //     onPressed: () {},
                      //     icon: Icon(Icons.remove_circle_rounded,color: Colors.blue),
                      //   ),
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
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
                    height: 1.h,
                  ),
                  Stack(
                    children: [
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                            height: 18.h,
                            padding: EdgeInsets.all(1.w),
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 0.5.w),
                                  height: 16.h,
                                  width: 30.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          'https://i.pinimg.com/550x/15/9d/67/159d6702782cd458d58fe1307ecb84f1.jpg',
                                      progressIndicatorBuilder:
                                          (context, url, progress) => Center(
                                              child:
                                                  CircularProgressIndicator()),
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
                                    SizedBox(
                                      width: 54.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 1.w),
                                            child: Text(
                                              'Obsidian Decor',
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
                                        'The earliest known flower arranging dates back to ancient Egypt. Egyptians were decorating with flowers as early as 2,500 BCE. They regularly placed cut flowers in vases,',
                                        maxLines: 2,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    Row(
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
                                          'Beach Shore View',
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 1.h),
                                    Container(
                                      width: 55.w,
                                      padding: EdgeInsets.only(left: 1.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$ 100',
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3.w,
                                                  vertical: 1.3.h),
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          90)),
                                              child: Text(
                                                'View Details',
                                                style: TextStyle(
                                                    fontSize: 11.sp,
                                                    color: Colors.white,
                                                    fontFamily: 'sofi',
                                                    letterSpacing: 1,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                      // Positioned(
                      //   left: 84.w,
                      //   bottom: 15.h,
                      //   child: IconButton(
                      //     onPressed: () {},
                      //     icon: Icon(Icons.remove_circle_rounded,color: Colors.blue),
                      //   ),
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Stack(
                    children: [
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                            height: 18.h,
                            padding: EdgeInsets.all(1.w),
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 0.5.w),
                                  height: 16.h,
                                  width: 30.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          'https://cdn.shopify.com/s/files/1/0257/2999/0741/files/dd4429389e8bdcc55183cf0ee8b708e8.jpg?size=500x679&lossy=0&strip=1&webp=1',
                                      progressIndicatorBuilder:
                                          (context, url, progress) => Center(
                                              child:
                                                  CircularProgressIndicator()),
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
                                    SizedBox(
                                      width: 54.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 1.w),
                                            child: Text(
                                              'Garden Decor',
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
                                        'Garden design is the art and process of designing and creating plans for layout and planting of gardens and landscapes. Garden design may be done by the garden owner themselves,',
                                        maxLines: 2,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    Row(
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
                                          'Beach Shore View',
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 1.h),
                                    Container(
                                      width: 55.w,
                                      padding: EdgeInsets.only(left: 1.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$ 10',
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3.w,
                                                  vertical: 1.3.h),
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          90)),
                                              child: Text(
                                                'View Details',
                                                style: TextStyle(
                                                    fontSize: 11.sp,
                                                    color: Colors.white,
                                                    fontFamily: 'sofi',
                                                    letterSpacing: 1,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                      // Positioned(
                      //   left: 84.w,
                      //   bottom: 15.h,
                      //   child: IconButton(
                      //     onPressed: () {},
                      //     icon: Icon(Icons.remove_circle_rounded,color: Colors.blue),
                      //   ),
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
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
                    height: 1.h,
                  ),
                  Stack(
                    children: [
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                            height: 18.h,
                            padding: EdgeInsets.all(1.w),
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 0.5.w),
                                  height: 16.h,
                                  width: 30.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          'https://media.istockphoto.com/id/1316215960/photo/elegant-wedding-cake-with-golden-and-rose-details.jpg?s=612x612&w=0&k=20&c=d4XBi-pWdJDxqgtWuhg2jIdCoJpJiS4pY16IlLtviG0=',
                                      progressIndicatorBuilder:
                                          (context, url, progress) => Center(
                                              child:
                                                  CircularProgressIndicator()),
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
                                    SizedBox(
                                      width: 54.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 1.w),
                                            child: Text(
                                              '3 Layer Cake',
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
                                        'A Beautiful 3 Layer wedding Cake Made with Strawberry Flavoured vanilla Base ',
                                        maxLines: 2,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    Row(
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
                                          'Beach Shore View',
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 1.h),
                                    Container(
                                      width: 55.w,
                                      padding: EdgeInsets.only(left: 1.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$ 100',
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3.w,
                                                  vertical: 1.3.h),
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          90)),
                                              child: Text(
                                                'View Details',
                                                style: TextStyle(
                                                    fontSize: 11.sp,
                                                    color: Colors.white,
                                                    fontFamily: 'sofi',
                                                    letterSpacing: 1,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    height: 1.h,
                  ),
                  Stack(
                    children: [
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          height: 18.h,
                          padding: EdgeInsets.all(1.w),
                          margin: EdgeInsets.symmetric(horizontal: 1.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 0.5.w),
                                height: 16.h,
                                width: 30.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        'https://static01.nyt.com/images/2019/03/24/travel/24trending-shophotels1/24trending-shophotels1-superJumbo.jpg',
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
                                  SizedBox(
                                    width: 54.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 1.w),
                                          child: Text(
                                            'Luxury Rooms',
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
                                      'Your hotel experience is typically defined by time spent away. But increasingly, hotels and vacation rentals are eager to insert themselves into your regular routine back home.',
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
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 15.sp,
                                        color: Colors.black.withOpacity(0.8),
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Text(
                                        'Hotel R Rooms',
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.h),
                                  Container(
                                    width: 55.w,
                                    padding: EdgeInsets.only(left: 1.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$ 350',
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3.w,
                                                vertical: 1.3.h),
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(90)),
                                            child: Text(
                                              'View Details',
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  color: Colors.white,
                                                  fontFamily: 'sofi',
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    height: 1.h,
                  ),
                  Stack(
                    children: [
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                            height: 18.h,
                            padding: EdgeInsets.all(1.w),
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 0.5.w),
                                  height: 16.h,
                                  width: 30.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          'https://stylesatlife.com/wp-content/uploads/2023/03/Extravagant-Floral-Wedding-Car-Decorations.jpg',
                                      progressIndicatorBuilder:
                                          (context, url, progress) => Center(
                                              child:
                                                  CircularProgressIndicator()),
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
                                    SizedBox(
                                      width: 54.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 1.w),
                                            child: Text(
                                              '6 Seater',
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
                                        'A 6 Seater Wedding Car for Your Wedding ou Transportations .',
                                        maxLines: 2,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    Row(
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
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 1.h),
                                    Container(
                                      width: 55.w,
                                      padding: EdgeInsets.only(left: 1.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$ 40',
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3.w,
                                                  vertical: 1.3.h),
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          90)),
                                              child: Text(
                                                'View Details',
                                                style: TextStyle(
                                                    fontSize: 11.sp,
                                                    color: Colors.white,
                                                    fontFamily: 'sofi',
                                                    letterSpacing: 1,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                      // Positioned(
                      //   left: 84.w,
                      //   bottom: 15.h,
                      //   child: IconButton(
                      //     onPressed: () {},
                      //     icon: Icon(Icons.remove_circle_rounded,color: Colors.blue),
                      //   ),
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    height: 1.h,
                  ),
                  Stack(
                    children: [
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                            height: 18.h,
                            padding: EdgeInsets.all(1.w),
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 0.5.w),
                                  height: 16.h,
                                  width: 30.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          'https://res.cloudinary.com/purnesh/image/upload/w_1080,f_auto/golden-fiesta-h.jpg',
                                      progressIndicatorBuilder:
                                          (context, url, progress) => Center(
                                              child:
                                                  CircularProgressIndicator()),
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
                                    SizedBox(
                                      width: 54.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 1.w),
                                            child: Text(
                                              'Chinese Platter',
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
                                        'Full Plate With Selected Meals In One Dish All Chinese Food.',
                                        maxLines: 2,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    Row(
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
                                          'Beach Shore View',
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 1.h),
                                    Container(
                                      width: 55.w,
                                      padding: EdgeInsets.only(left: 1.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$ 60',
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3.w,
                                                  vertical: 1.3.h),
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          90)),
                                              child: Text(
                                                'View Details',
                                                style: TextStyle(
                                                    fontSize: 11.sp,
                                                    color: Colors.white,
                                                    fontFamily: 'sofi',
                                                    letterSpacing: 1,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                      // Positioned(
                      //   left: 84.w,
                      //   bottom: 15.h,
                      //   child: IconButton(
                      //     onPressed: () {},
                      //     icon: Icon(Icons.remove_circle_rounded,color: Colors.blue),
                      //   ),
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Stack(
                    children: [
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                            height: 18.h,
                            padding: EdgeInsets.all(1.w),
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 0.5.w),
                                  height: 16.h,
                                  width: 30.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          'https://4.imimg.com/data4/AP/VG/ANDROID-37526939/product-500x500.jpeg',
                                      progressIndicatorBuilder:
                                          (context, url, progress) => Center(
                                              child:
                                                  CircularProgressIndicator()),
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
                                    SizedBox(
                                      width: 54.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 1.w),
                                            child: Text(
                                              'Gujarati Thali',
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
                                        'Full Gujarati Plate With Selected Meals In One Dish All Gujarati Food.',
                                        maxLines: 2,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    Row(
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
                                          'Beach Shore View',
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 1.h),
                                    Container(
                                      width: 55.w,
                                      padding: EdgeInsets.only(left: 1.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$ 50',
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3.w,
                                                  vertical: 1.3.h),
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          90)),
                                              child: Text(
                                                'View Details',
                                                style: TextStyle(
                                                    fontSize: 11.sp,
                                                    color: Colors.white,
                                                    fontFamily: 'sofi',
                                                    letterSpacing: 1,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                      // Positioned(
                      //   left: 84.w,
                      //   bottom: 15.h,
                      //   child: IconButton(
                      //     onPressed: () {},
                      //     icon: Icon(Icons.remove_circle_rounded,color: Colors.blue),
                      //   ),
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
