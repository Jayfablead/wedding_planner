import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/main.dart';
import 'package:wedding_planner/screens/other%20Pages/ChatListPage.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';

class myfavourite extends StatefulWidget {
  myfavourite({super.key});

  @override
  State<myfavourite> createState() => _myfavouriteState();
}

class cate {
  String? image;
  String? name;
  double? Rating;
  String? desc;

  cate(
    this.image,
    this.name,
    this.desc,
    this.Rating,
  );
}

class _myfavouriteState extends State<myfavourite> {
  List<cate> HotelIm = [
    cate(
        'https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg',
        'Green velly',
        'A Big Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sitting',
        3),
    cate(
        'https://balloonpro.in/wp-content/uploads/2023/06/20210306_090946.jpg',
        'Garden green',
        'Sitting Arrangement in Garden with chairs and sitting arrangement with mandap and shadi ki chize',
        4),
    cate(
        'https://content.jdmagicbox.com/comp/ahmedabad/a8/079pxx79.xx79.190719110521.s4a8/catalogue/lilly-s-flower-decoration-and-gift-shop-ghatlodiya-ahmedabad-decorators-ypttjhzlti.jpg?clr=',
        'New Style',
        'A Simple Red Carpet Walking Arena',
        3),
  ];

  List<cate> venue = [
    cate(
        'https://media.weddingz.in/images/98203e459408c4f2f9c9014d9a6f669f/luxury-wedding-venues-in-surat-that-you-must-check-out-prior-to-finalizing-your-wedding-destination.jpg',
        'Dining',
        'A Big Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sitting',
        3),
    cate(
        'https://www.happywedding.app/blog/wp-content/uploads/2022/02/Wedding-Venues-in-Washington-State.jpg',
        'Garden Sitting',
        'Sitting Arrangement in Garden with chairs and sitting arrangement with mandap and shadi ki chize',
        4),
    cate(
        'https://imgmedia.lbb.in/media/2019/04/5ca1cedf8722f4176f30d878_1554108127903.jpg',
        'Simple Walkaway',
        'A Simple Red Carpet Walking Arena',
        3),
    cate(
        'https://image.wedmegood.com/resized/540X/uploads/member/739856/1662626980_IMG_0378.jpg?crop=7,99,1139,641',
        'Engagement',
        'An Arrangements for Engagement An Arrangements for Engagement An Arrangements for Engagement ',
        5),
    cate(
        'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
        'Royal Decor',
        'A Royal Decoration venue A Royal Decoration venue A Royal Decoration venue A Royal Decoration venue ',
        3),
    cate(
        'https://images.squarespace-cdn.com/content/v1/5fc1488e2e34347c7046adff/1608299164655-MKBFB2JIWNX23JIUWZEG/large-conservatory-wedding-venue.jpg',
        'OutSide WallHouse',
        'A Big Hall with sitting A Big Hall with sitting A Big Hall with sitting A Big Hall with sitting ',
        5),
    cate(
        'https://www.happywedding.app/blog/wp-content/uploads/2022/02/Wedding-Venues-in-Washington-State.jpg',
        'Garden Sitting',
        'Sitting Arrangement in Arrangement in GardenSitting Arrangement in Sitting Arrangement in ',
        4),
    cate(
        'https://imgmedia.lbb.in/media/2019/04/5ca1cedf8722f4176f30d878_1554108127903.jpg',
        'Simple Walkaway',
        'A Simple Red Carpet Walking ArenaA Simple Red Carpet Walking ArenaA Simple Red Carpet Walking ArenaA Simple Red Carpet Walking Arena ',
        4),
    cate(
        'https://image.wedmegood.com/resized/540X/uploads/member/739856/1662626980_IMG_0378.jpg?crop=7,99,1139,641',
        'Engagement',
        'An Arrangements for EngagementAn Arrangements for EngagementAn Arrangements for EngagementAn Arrangements for Engagement ',
        3),
    cate(
        'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
        'Royal Decor',
        'A Royal Decoration venue',
        2),
    cate(
        'https://images.squarespace-cdn.com/content/v1/5fc1488e2e34347c7046adff/1608299164655-MKBFB2JIWNX23JIUWZEG/large-conservatory-wedding-venue.jpg',
        'OutSide WallHouse',
        'A Big Hall with sitting',
        5)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(null)),
                  Text(
                    "My Favourites",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'sofi',
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        // _drawerKey.currentState!.open();
                        openDrawer();
                      },
                      icon: Icon(Icons.menu_rounded))
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  "All Your Favourite suppliers will be here , in one place.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1,
                      fontFamily: 'sofi',
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),

              Container(
                  // height: 40.h,
                  // width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int index = 0; index < HotelIm.length; index++) ...[
                      Stack(
                        children: [
                          Container(
                            width: 85.w,
                            margin: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // margin: EdgeInsets.symmetric(horizontal: 1.w),
                                  height: 25.h,
                                  width: 85.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: HotelIm[index].image.toString(),
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
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        HotelIm[index].name.toString(),
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                            fontFamily: 'sofi',
                                            color: Colors.black),
                                      ),
                                      IconButton(
                                        onPressed: () {
Get.to(ChatlistPage(sele: 3));
                                        },
                                        icon: Icon(Icons.message,color: Colors.blue),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                                  child: Text(
                                    HotelIm[index].desc.toString(),
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        letterSpacing: 1,
                                        fontFamily: 'sofi',
                                        color: Colors.grey),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                                  child: Divider(color: Colors.black87,),
                                )
                              ],
                            ),
                          ), Positioned(
                              left:75.5.w,
                              top: 1.4.h,
                              child: Container(
                                height: 10.w,
                                width: 10.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: IconButton(
                                    onPressed:(){
                                      setState((){

                                      });


                                    } ,icon: Icon(Icons.favorite,color: Colors.red,size: 20.sp,)),
                              ))
                        ],
                      )
                    ]
                  ],
                ),
              )),
              SizedBox(
                height: 12.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
