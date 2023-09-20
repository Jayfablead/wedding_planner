import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/BannerPage.dart';
import 'package:wedding_planner/screens/pages2/venue%202.dart';
import 'package:wedding_planner/screens/viewAllVenue.dart';
import 'package:wedding_planner/screens/view_all%20Categ.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
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
  cate('https://cdn-icons-png.flaticon.com/512/3436/3436370.png', 'Engagement '),
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
      'https://www.happywedding.app/blog/wp-content/uploads/2022/02/Wedding-Venues-in-Washington-State.jpg',
      'Garden Sitting',
      'Sitting Arrangement in Garden'),
  cate1(
      'https://imgmedia.lbb.in/media/2019/04/5ca1cedf8722f4176f30d878_1554108127903.jpg',
      'Simple Walkaway',
      'A Simple Red Carpet Walking Arena'),
  cate1(
      'https://image.wedmegood.com/resized/540X/uploads/member/739856/1662626980_IMG_0378.jpg?crop=7,99,1139,641',
      'Engagement',
      'An Arrangements for Engagement'),
  cate1(
      'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
      'Royal Decor',
      'A Royal Decoration venue'),

];
TextEditingController _search = TextEditingController();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(),
      key: _scaffoldKey,
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
            // SizedBox(
            //   height: 2.h,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     searchBox(),
            //     Container(
            //       margin: EdgeInsets.symmetric(horizontal: 1.w),
            //       height: 6.5.h,
            //       width: 14.w,
            //       child: ClipRRect(
            //         borderRadius: BorderRadius.circular(90),
            //         child: CachedNetworkImage(
            //           fit: BoxFit.cover,
            //           imageUrl:
            //               'https://i.pinimg.com/280x280_RS/fc/71/56/fc7156e9ddbd524ab1541d3942725efd.jpg',
            //           progressIndicatorBuilder: (context, url, progress) =>
            //               CircularProgressIndicator(),
            //           errorWidget: (context, url, error) => Image.asset(
            //             'assets/deprf.png',
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 1.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    TextButton(
                        onPressed: () {
                          Get.to(ViewAllCategory());
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: 'sofi',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Colors.pink),
                        )),
                  ],
                ),
                SizedBox(height: 1.h),
                Container(
                  height: 15.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.pink.withOpacity(0.2),
                          ),
                          width: 45.w,
                          margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 1.w),
                                height: 8.h,
                                width: 17.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        Categories[index].image.toString(),
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
                              SizedBox(height: 1.h),
                              Text(
                                Categories[index].name.toString(),
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ));
                    },
                    itemCount: Categories.length,
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
                            child: Image.asset('assets/copl.png')),
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
                                onTap: () {
                                  Get.to(MoodBordsScreen());
                                },
                                child: Container(alignment: Alignment.center,
                                  width: 28.w,
                                  height: 5.2.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(25.sp),
                                  ),
                                  child: Text(
                                    "Book Now",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.pink,
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
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    TextButton(
                        onPressed: () {
                          Get.to(Venue2());
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: 'sofi',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Colors.pink),
                        )),
                  ],
                ),
                SizedBox(height: 1.h),
                Text(
                  'Choose a Venue For Your Wedding',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'sofi',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: Colors.black),
                ), SizedBox(height: 2.h),
                Container(
                  height: 26.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return
                        Container(
                            alignment: Alignment.center,
width: 45.w,
                            padding: EdgeInsets.all(1.w),
margin: EdgeInsets.symmetric(horizontal: 1.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 0.5.w),
                                  padding:EdgeInsets.only(top: 1.5.w) ,
                                  height: 17.h,
                                  width: 40.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                      venue[index].image.toString(),
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
                                SizedBox(height: 1.h),
                                Padding(
                                  padding: EdgeInsets.only(left: 1.w),
                                  child: Text(
                                    venue[index].name.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13.5.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),SizedBox(height: 1.h),
                                Container(width: 40.w,
                                  padding: EdgeInsets.only(left: 1.w),
                                  child: Text(
                                    venue[index].desc.toString(),overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ));
                    },
                    itemCount: venue.length,
                  ),
                )
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
        color: Colors.pink.withOpacity(0.08),
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
