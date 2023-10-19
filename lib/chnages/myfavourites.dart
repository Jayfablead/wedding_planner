import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/main.dart';
import 'package:wedding_planner/screens/other%20Pages/ChatListPage.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

class myfavourite extends StatefulWidget {
  myfavourite({super.key});

  @override
  State<myfavourite> createState() => _myfavouriteState();
}

class cate {
  String? image;
  String? name;
  String? vv;
  double? Rating;
  String? desc;

  cate(
    this.image,
    this.name,
      this.vv,
    this.desc,
    this.Rating,
  );
}

class _myfavouriteState extends State<myfavourite> {
  List<cate> HotelIm = [
    cate(
        'https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg',
        'Green velly',
        "Good Service",
        'A Big Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sitting',
        3),
    cate(
        'https://balloonpro.in/wp-content/uploads/2023/06/20210306_090946.jpg',
        'Garden green',
        "Good Service",
        'Sitting Arrangement in Garden with chairs and sitting arrangement with mandap and shadi ki chize',
        4),
    cate(
        'https://content.jdmagicbox.com/comp/ahmedabad/a8/079pxx79.xx79.190719110521.s4a8/catalogue/lilly-s-flower-decoration-and-gift-shop-ghatlodiya-ahmedabad-decorators-ypttjhzlti.jpg?clr=',
        'New Style',
        "Good Service",
        'A Simple Red Carpet Walking Arena',
        3),
    cate(
        'https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg',
        'Green velly',
        "Good Service",
        'A Big Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sitting',
        3),
    cate(
        'https://balloonpro.in/wp-content/uploads/2023/06/20210306_090946.jpg',
        'Garden green',
        "Good Service",
        'Sitting Arrangement in Garden with chairs and sitting arrangement with mandap and shadi ki chize',
        4),
    cate(
        'https://content.jdmagicbox.com/comp/ahmedabad/a8/079pxx79.xx79.190719110521.s4a8/catalogue/lilly-s-flower-decoration-and-gift-shop-ghatlodiya-ahmedabad-decorators-ypttjhzlti.jpg?clr=',
        'New Style',
        "Good Service",
        'A Simple Red Carpet Walking Arena',
        3),
    cate(
        'https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg',
        'Green velly',
        "Good Service",
        'A Big Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sitting',
        3),
    cate(
        'https://balloonpro.in/wp-content/uploads/2023/06/20210306_090946.jpg',
        'Garden green',
        "Good Service",
        'Sitting Arrangement in Garden with chairs and sitting arrangement with mandap and shadi ki chize',
        4),
    cate(
        'https://content.jdmagicbox.com/comp/ahmedabad/a8/079pxx79.xx79.190719110521.s4a8/catalogue/lilly-s-flower-decoration-and-gift-shop-ghatlodiya-ahmedabad-decorators-ypttjhzlti.jpg?clr=',
        'New Style',
        "Good Service",
        'A Simple Red Carpet Walking Arena',
        3),
    cate(
        'https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg',
        'Green velly',
        "Good Service",
        'A Big Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sitting',
        3),
    cate(
        'https://balloonpro.in/wp-content/uploads/2023/06/20210306_090946.jpg',
        'Garden green',
        "Good Service",
        'Sitting Arrangement in Garden with chairs and sitting arrangement with mandap and shadi ki chize',
        4),
    cate(
        'https://content.jdmagicbox.com/comp/ahmedabad/a8/079pxx79.xx79.190719110521.s4a8/catalogue/lilly-s-flower-decoration-and-gift-shop-ghatlodiya-ahmedabad-decorators-ypttjhzlti.jpg?clr=',
        'New Style',
        "Good Service",
        'A Simple Red Carpet Walking Arena',
        3),

  ];

  List<cate> venue = [
    cate(
        'https://media.weddingz.in/images/98203e459408c4f2f9c9014d9a6f669f/luxury-wedding-venues-in-surat-that-you-must-check-out-prior-to-finalizing-your-wedding-destination.jpg',
        'Dining',
        "Good Service",
        'A Big Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sitting',
        3),
    cate(
        'https://www.happywedding.app/blog/wp-content/uploads/2022/02/Wedding-Venues-in-Washington-State.jpg',
        'Garden Sitting',
        "Good Service",
        'Sitting Arrangement in Garden with chairs and sitting arrangement with mandap and shadi ki chize',
        4),
    cate(
        'https://imgmedia.lbb.in/media/2019/04/5ca1cedf8722f4176f30d878_1554108127903.jpg',
        'Simple Walkaway',
        "Good Service",
        'A Simple Red Carpet Walking Arena',
        3),
    cate(
        'https://image.wedmegood.com/resized/540X/uploads/member/739856/1662626980_IMG_0378.jpg?crop=7,99,1139,641',
        'Engagement',
        "Good Service",
        'An Arrangements for Engagement An Arrangements for Engagement An Arrangements for Engagement ',
        5),
    cate(
        'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
        'Royal Decor',
        "Good Service",
        'A Royal Decoration venue A Royal Decoration venue A Royal Decoration venue A Royal Decoration venue ',
        3),
    cate(
        'https://images.squarespace-cdn.com/content/v1/5fc1488e2e34347c7046adff/1608299164655-MKBFB2JIWNX23JIUWZEG/large-conservatory-wedding-venue.jpg',
        'OutSide WallHouse',
        "Good Service",
        'A Big Hall with sitting A Big Hall with sitting A Big Hall with sitting A Big Hall with sitting ',
        5),
    cate(
        'https://www.happywedding.app/blog/wp-content/uploads/2022/02/Wedding-Venues-in-Washington-State.jpg',
        'Garden Sitting',
        "Good Service",
        'Sitting Arrangement in Arrangement in GardenSitting Arrangement in Sitting Arrangement in ',
        4),
    cate(
        'https://imgmedia.lbb.in/media/2019/04/5ca1cedf8722f4176f30d878_1554108127903.jpg',
        'Simple Walkaway',
        "Good Service",
        'A Simple Red Carpet Walking ArenaA Simple Red Carpet Walking ArenaA Simple Red Carpet Walking ArenaA Simple Red Carpet Walking Arena ',
        4),
    cate(
        'https://image.wedmegood.com/resized/540X/uploads/member/739856/1662626980_IMG_0378.jpg?crop=7,99,1139,641',
        'Engagement',
        "Good Service",
        'An Arrangements for EngagementAn Arrangements for EngagementAn Arrangements for EngagementAn Arrangements for Engagement ',
        3),
    cate(
        'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
        'Royal Decor',
        "Good Service",
        'A Royal Decoration venue',
        2),
    cate(
        'https://images.squarespace-cdn.com/content/v1/5fc1488e2e34347c7046adff/1608299164655-MKBFB2JIWNX23JIUWZEG/large-conservatory-wedding-venue.jpg',
        'OutSide WallHouse',
        "Good Service",
        'A Big Hall with sitting',
        5)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      key: scaffoldKey,
      extendBody: true,
      bottomNavigationBar: bottomnavbar(selit: -3),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 6.h,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     IconButton(onPressed: () {}, icon: Icon(null)),
              //     Text(
              //       "My Favourites",
              //       style: TextStyle(
              //         fontSize: 15.sp,
              //         fontFamily: 'sofi',
              //         letterSpacing: 1,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     IconButton(
              //         onPressed: () {
              //           // _drawerKey.currentState!.open();
              //           openDrawer();
              //         },
              //         icon: Icon(Icons.menu_rounded))
              //   ],
              // ),
              headerwid(text: "My Favourites"),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 79.h,
                child: ListView.builder(
                  itemCount: HotelIm.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                      child: Container(
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
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 1.w),
                              height: 9.h,
                              width: 18.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: HotelIm[index].image ?? '',
                                  progressIndicatorBuilder:
                                      (context, url, progress) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                        'assets/icons/user.png',
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50.w,
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        HotelIm[index].name ?? '',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                            fontFamily: 'sofi',
                                            color: Colors.black),
                                      ),

                                    ],
                                  ),
                                ),
                                SizedBox(height: 0.8.h),
                                SizedBox(
                                  width: 66.w,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 52.w,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              HotelIm[index].vv ?? '',
                                              style: TextStyle(
                                                  fontSize: 11.sp,

                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'sofi',
                                                  color:
                                                  Colors.black.withOpacity(0.5)),
                                            ),
                                            SizedBox(height: 0.8.h),
                                            Text(
                                              HotelIm[index].desc ?? '',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'sofi',
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          print('right');

                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(2.w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(7),
                                              color: Colors.blue),
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.white,
                                            size: 18.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  padding: EdgeInsets.zero,
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
