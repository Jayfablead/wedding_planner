import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/main.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class YellowHomeScreen extends StatefulWidget {
  int? sele;

  YellowHomeScreen({super.key, required this.sele});

  @override
  State<YellowHomeScreen> createState() => _YellowHomeScreenState();
}

class cate {
  String? image;
  String? name;

  cate(
    this.image,
    this.name,
  );
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

List<cate> Categories = [
  cate('https://cdn-icons-png.flaticon.com/512/6491/6491166.png', 'Wedding '),
  cate(
      'https://cdn-icons-png.flaticon.com/512/3436/3436370.png', 'Engagement '),
  cate('https://cdn-icons-png.flaticon.com/512/6117/6117300.png',
      'Anniversary '),
  cate('https://cdn-icons-png.flaticon.com/512/2454/2454313.png', 'Birthday '),
  cate('https://cdn-icons-png.flaticon.com/512/6491/6491166.png', 'Wedding '),
];
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
      'https://media.weddingz.in/images/98203e459408c4f2f9c9014d9a6f669f/luxury-wedding-venues-in-surat-that-you-must-check-out-prior-to-finalizing-your-wedding-destination.jpg',
      'Dining',
      'A Big Hall with sitting'),
  cate1(
      'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
      'Royal Decor',
      'A Royal Decoration venue'),
  cate1(
      'https://media.weddingz.in/images/98203e459408c4f2f9c9014d9a6f669f/luxury-wedding-venues-in-surat-that-you-must-check-out-prior-to-finalizing-your-wedding-destination.jpg',
      'Dining',
      'A Big Hall with sitting'),
  cate1(
      'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
      'Royal Decor',
      'A Royal Decoration venue'),
];
TextEditingController _search = TextEditingController();
int sel = 1;

class _YellowHomeScreenState extends State<YellowHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      sel = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBody: true,

      drawer: drawer1(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 4.5.h,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 92.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Hi, Nami & Zoro',
                                  style: TextStyle(
                                      fontSize: 23.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: Colors.amber),
                                ),
                                IconButton(
                                  onPressed: () {
                                    openDrawer();
                                  },
                                  icon: Icon(
                                    Icons.menu_rounded,
                                    color: Colors.amber,
                                    size: 23.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.date_range_outlined,
                                    color: Colors.black.withOpacity(0.75)),
                                SizedBox(width: 2.w),
                                Padding(
                                  padding: EdgeInsets.only(top: 0.4.h),
                                  child: Text(
                                    '20-03-2024',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontFamily: 'sofi',
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                        color: Colors.black.withOpacity(0.75)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 1.w),
                      height: 6.5.h,
                      width: 13.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              'https://i.pinimg.com/280x280_RS/fc/71/56/fc7156e9ddbd524ab1541d3942725efd.jpg',
                          progressIndicatorBuilder: (context, url, progress) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/deprf.png',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'sofi',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 14.5.h,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            sel = 1;
                          });
                        },
                        child: Container(
                          child: Card(
                              color: sel == 1 ? Colors.amber : Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(2.5.w),
                                      child: Image.asset('assets/1.png',
                                          color: sel == 1
                                              ? Colors.white
                                              : Colors.amber,
                                          height: 6.h,
                                          width: 13.w),
                                    ),
                                    SizedBox(
                                      width: 21.w,
                                      child: Text(
                                        'Wedding Hall',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: 'sofi',
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                            color: sel == 1
                                                ? Colors.white
                                                : Colors.amber),
                                      ),
                                    ),
                                  ],
                                ),
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
                              color: sel == 2 ? Colors.amber : Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(2.5.w),
                                      child: Image.asset('assets/9.png',
                                          color: sel == 2
                                              ? Colors.white
                                              : Colors.amber,
                                          height: 6.h,
                                          width: 13.w),
                                    ),
                                    SizedBox(
                                      width: 21.w,
                                      child: Text(
                                        'Rings',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: 'sofi',
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                            color: sel == 2
                                                ? Colors.white
                                                : Colors.amber),
                                      ),
                                    ),
                                  ],
                                ),
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
                              color: sel == 3 ? Colors.amber : Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(2.5.w),
                                      child: Image.asset('assets/8.png',
                                          color: sel == 3
                                              ? Colors.white
                                              : Colors.amber,
                                          height: 6.h,
                                          width: 13.w),
                                    ),
                                    SizedBox(
                                      width: 21.w,
                                      child: Text(
                                        'Decorations',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: 'sofi',
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                            color: sel == 3
                                                ? Colors.white
                                                : Colors.amber),
                                      ),
                                    ),
                                  ],
                                ),
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
                              color: sel == 4 ? Colors.amber : Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(2.5.w),
                                      child: Image.asset('assets/7.png',
                                          color: sel == 4
                                              ? Colors.white
                                              : Colors.amber,
                                          height: 6.h,
                                          width: 13.w),
                                    ),
                                    SizedBox(
                                      width: 21.w,
                                      child: Text(
                                        'Photography',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: 'sofi',
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                            color: sel == 4
                                                ? Colors.white
                                                : Colors.amber),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            sel = 5;
                          });
                        },
                        child: Container(
                          child: Card(
                              color: sel == 5 ? Colors.amber : Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(2.5.w),
                                      child: Image.asset('assets/5.png',
                                          color: sel == 5
                                              ? Colors.white
                                              : Colors.amber,
                                          height: 6.h,
                                          width: 13.w),
                                    ),
                                    SizedBox(
                                      width: 21.w,
                                      child: Text(
                                        'Makeup',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: 'sofi',
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                            color: sel == 5
                                                ? Colors.white
                                                : Colors.amber),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Recommended for you',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'sofi',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                  height: 22.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.amber.withOpacity(0.05),
                  ),
                  padding: EdgeInsets.all(2.w),
                  margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 1.w),
                          height: 80.h,
                          width: 40.w,
                          child: Image.asset('assets/wed1.png')),
                      SizedBox(width: 1.w),
                      SizedBox(
                        width: 44.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Special for you',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontFamily: 'sofi'),
                            ),
                            Text(
                              'A Offer for You. You can get 30 % off on all selected venue',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.65),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontFamily: 'sofi'),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                width: 28.w,
                                height: 5.2.h,
                                decoration: BoxDecoration(
                                  color: Colors.amber.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(25.sp),
                                ),
                                child: Text(
                                  "Book Now",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'sofi'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: 1.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Wedding Suppliers',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'sofi',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 14.5.sp,
                              fontFamily: 'sofi',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Colors.amber),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 27.5.h,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: venue.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 0.5.h, horizontal: 1.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 0.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                height: 21.h,
                                width: 42.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: venue[index].image.toString(),
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
                              Padding(
                                padding: EdgeInsets.only(left: 1.w),
                                child: Text(
                                  venue[index].name.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 9.7.h),
                ],
              ),
            ],
          ),
        ),
      ), bottomNavigationBar: bottomnavbar(selit: widget.sele),
    );
  }

  Widget searchBox() {
    return Container(
      alignment: Alignment.center,
      width: 77.w,
      height: 6.5.h,
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.02),
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(90),
      ),
      child: TextField(
        controller: _search,
        onChanged: (value) {},
        style:
            TextStyle(color: Colors.black, fontSize: 13.sp, fontFamily: 'get'),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black.withOpacity(0.65),
            size: 25,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 35,
            minWidth: 40,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.65), fontFamily: 'get'),
        ),
      ),
    );
  }
}
