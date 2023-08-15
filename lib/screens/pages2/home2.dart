import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/drawer.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class cate1 {
  String? image;
  String? name;
  String? desc;

  cate1(
    this.image,
    this.name,
    this.desc,
  );
}

class cate {
  String? image;

  cate(
    this.image,
  );
}

class dress {
  String? image;
  String? name;
  bool? islike;
  String? price;
  String? desc;

  dress(
    this.image,
    this.islike,
    this.name,
    this.price,
    this.desc,
  );
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
List<cate1> venue = [
  cate1(
      'https://media.weddingz.in/images/98203e459408c4f2f9c9014d9a6f669f/luxury-wedding-venues-in-surat-that-you-must-check-out-prior-to-finalizing-your-wedding-destination.jpg',
      'Dining',
      'A Big Hall with sitting'),
  cate1(
      'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
      'Royal Decor',
      'A Royal Decoration venue'),
  cate1(
      'https://imgmedia.lbb.in/media/2019/04/5ca1cedf8722f4176f30d878_1554108127903.jpg',
      'Simple Walkaway',
      'A Simple Red Carpet Walking Arena'),
  cate1(
      'https://image.wedmegood.com/resized/540X/uploads/member/739856/1662626980_IMG_0378.jpg?crop=7,99,1139,641',
      'Engagement',
      'An Arrangements for Engagement'),
  cate1(
      'https://www.happywedding.app/blog/wp-content/uploads/2022/02/Wedding-Venues-in-Washington-State.jpg',
      'Garden Sitting',
      'Sitting Arrangement in Garden'),
];
List<cate> icns = [
  cate(
    'https://cdn-icons-png.flaticon.com/512/6448/6448538.png',
  ),
  cate(
    'https://cdn-icons-png.flaticon.com/512/84/84395.png',
  ),
  cate(
    'https://static.thenounproject.com/png/1942517-200.png',
  ),
];
List<dress> Wdress = [
  dress(
      'https://c1.wallpaperflare.com/preview/526/605/244/bindi-asian-jewellery-beauty.jpg',
      false,
      'Indian Wedding Dress',
      '25000','An Indian Wedding Style Dress For a beauty like you.'),
  dress(
      'https://c0.wallpaperflare.com/preview/731/452/1009/beautiful-beautiful-eyes-beautiful-girl-bride.jpg',
      true,
      'Bengoli Wedding Dress',
      '35000','A Bengoli Wedding Dress For a beauty like you'),
  dress(
      'https://c1.wallpaperflare.com/preview/526/605/244/bindi-asian-jewellery-beauty.jpg',
      false,
      'Indian Wedding Dress',
      '25000','An Indian Wedding Style Dress For a beauty like you.'),
  dress(
      'https://c0.wallpaperflare.com/preview/731/452/1009/beautiful-beautiful-eyes-beautiful-girl-bride.jpg',
      true,
      'Bengoli Wedding Dress',
      '35000','A Bengoli Wedding Dress For a beauty like you'),
];
int sel = 1;

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(),
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          children: [
            SizedBox(
              height: 7.h,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 92.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState?.openDrawer();
                              },
                              icon: Icon(
                                Icons.menu_rounded,
                                color: Colors.pink,
                                size: 23.sp,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      sel = 1;
                    });
                  },
                  child: Container(
                    child: Card(
                        color: sel == 1 ? Colors.pink : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 5,
                        child: Container(
                          margin: EdgeInsets.all(2.w),
                          child: Image.asset('assets/1.png',
                              color: sel == 1 ? Colors.white : Colors.pink,
                              height: 5.h,
                              width: 11.w),
                        )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      sel = 2;
                    });
                  },
                  child: Container(
                    child: Card(
                        color: sel == 2 ? Colors.pink : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 5,
                        child: Container(
                          margin: EdgeInsets.all(2.w),
                          child: Image.asset('assets/2.png',
                              color: sel == 2 ? Colors.white : Colors.pink,
                              height: 5.h,
                              width: 11.w),
                        )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      sel = 3;
                    });
                  },
                  child: Container(
                    child: Card(
                        color: sel == 3 ? Colors.pink : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 5,
                        child: Container(
                          margin: EdgeInsets.all(2.w),
                          child: Image.asset('assets/3.png',
                              color: sel == 3 ? Colors.white : Colors.pink,
                              height: 5.h,
                              width: 11.w),
                        )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      sel = 4;
                    });
                  },
                  child: Container(
                    child: Card(
                        color: sel == 4 ? Colors.pink : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 5,
                        child: Container(
                          margin: EdgeInsets.all(2.w),
                          child: Image.asset('assets/4.png',
                              color: sel == 4 ? Colors.white : Colors.pink,
                              height: 5.h,
                              width: 11.w),
                        )),
                  ),
                ),
              ],
            ),
            sel == 2
                ? Column(children: [
                    SizedBox(height: 2.h),
                    Row(children: [
                      SizedBox(width: 2.w),
                      Text(
                        'Wedding Dress',
                        style: TextStyle(
                            fontFamily: 'sofi',
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            letterSpacing: 1),
                      ),
                    ]),
                    SizedBox(height: 1.h),
                    SizedBox(
                      height: 69.h,
                      child: ListView.builder(
                        itemCount: Wdress.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 1.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 1.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 25.h,
                                  width: 30.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: Wdress[index].image.toString(),
                                      progressIndicatorBuilder:
                                          (context, url, progress) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        'assets/icons/deprf.png',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 60.w,height: 20.h,
                                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 1.h),
                                      Text(
                                        Wdress[index].name.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17.sp,
                                            fontFamily: 'sofi',
                                            fontWeight: FontWeight.w600),
                                      ), SizedBox(height: 1.h),
                                      Text(
                                        Wdress[index].desc.toString(),
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15.sp,
                                            fontFamily: 'sofi',
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 1.h),
                                      Text(
                                        '\$ ' + Wdress[index].price.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17.sp,
                                            fontFamily: 'sofi',
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 1.h),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            Wdress[index].islike =
                                                !Wdress[index].islike!;
                                            print(Wdress[index].islike!);
                                          });
                                        },
                                        child: Container(
                                          child: Card(
                                              color: Wdress[index].islike!
                                                  ? Colors.pink
                                                  : Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              elevation: 5,
                                              child: Container(
                                                margin: EdgeInsets.all(01.w),
                                                child: Image.asset(
                                                    'assets/6.png',
                                                    color: Wdress[index].islike!
                                                        ? Colors.white
                                                        : Colors.pink,
                                                    height: 3.h,
                                                    width: 7.w),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ])
                : Column(children: [
                    SizedBox(height: 2.h),
                    Row(children: [
                      SizedBox(width: 2.w),
                      Text(
                        'Wedding Hall',
                        style: TextStyle(
                            fontFamily: 'sofi',
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            letterSpacing: 1),
                      ),
                    ]),
                    SizedBox(height: 1.h),
                    SizedBox(
                      height: 69.h,
                      child: ListView.builder(
                        itemCount: venue.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 1.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 1.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 25.h,
                                  width: 90.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: venue[index].image.toString(),
                                      progressIndicatorBuilder:
                                          (context, url, progress) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        'assets/icons/deprf.png',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  venue[index].name.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 1.h),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ]),
          ],
        ),
      ),
    );
  }
}
