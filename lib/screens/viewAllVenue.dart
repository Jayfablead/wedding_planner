import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class ViewAllVenue extends StatefulWidget {
  const ViewAllVenue({super.key});

  @override
  State<ViewAllVenue> createState() => _ViewAllVenueState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class cate {
  String? image;
  String? name;
  String? desc;

  cate(
    this.image,
    this.name,
    this.desc,
  );
}

List<cate> venue = [
  cate(
      'https://media.weddingz.in/images/98203e459408c4f2f9c9014d9a6f669f/luxury-wedding-venues-in-surat-that-you-must-check-out-prior-to-finalizing-your-wedding-destination.jpg',
      'Dining',
      'A Big Hall with sitting'),
  cate(
      'https://www.happywedding.app/blog/wp-content/uploads/2022/02/Wedding-Venues-in-Washington-State.jpg',
      'Garden Sitting',
      'Sitting Arrangement in Garden'),
  cate(
      'https://imgmedia.lbb.in/media/2019/04/5ca1cedf8722f4176f30d878_1554108127903.jpg',
      'Simple Walkaway',
      'A Simple Red Carpet Walking Arena'),
  cate(
      'https://image.wedmegood.com/resized/540X/uploads/member/739856/1662626980_IMG_0378.jpg?crop=7,99,1139,641',
      'Engagement',
      'An Arrangements for Engagement'),
  cate(
      'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
      'Royal Decor',
      'A Royal Decoration venue'),
  cate(
      'https://images.squarespace-cdn.com/content/v1/5fc1488e2e34347c7046adff/1608299164655-MKBFB2JIWNX23JIUWZEG/large-conservatory-wedding-venue.jpg',
      'OutSide WallHouse',
      'A Big Hall with sitting'),
  cate(
      'https://www.happywedding.app/blog/wp-content/uploads/2022/02/Wedding-Venues-in-Washington-State.jpg',
      'Garden Sitting',
      'Sitting Arrangement in Garden'),
  cate(
      'https://imgmedia.lbb.in/media/2019/04/5ca1cedf8722f4176f30d878_1554108127903.jpg',
      'Simple Walkaway',
      'A Simple Red Carpet Walking Arena'),
  cate(
      'https://image.wedmegood.com/resized/540X/uploads/member/739856/1662626980_IMG_0378.jpg?crop=7,99,1139,641',
      'Engagement',
      'An Arrangements for Engagement'),
  cate(
      'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
      'Royal Decor',
      'A Royal Decoration venue'),
  cate(
      'https://images.squarespace-cdn.com/content/v1/5fc1488e2e34347c7046adff/1608299164655-MKBFB2JIWNX23JIUWZEG/large-conservatory-wedding-venue.jpg',
      'OutSide WallHouse',
      'A Big Hall with sitting'),
];

class _ViewAllVenueState extends State<ViewAllVenue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(),
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded)),
                  Text(
                    "Venue",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'sofi',
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Icon(Icons.menu_rounded))
                ],
              ),
              SizedBox(height: 1.h),
              SizedBox(
                height: 86.h,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 0.5.h,
                      mainAxisSpacing: 1.h,
                      childAspectRatio: 0.88 / 1,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Container(
                        padding: EdgeInsets.all(1.w),
                        margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 1.w),
                              height: 17.h,
                              width: 52.w,
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
                                    'assets/icons/deprf.png',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 1.h),
                            Container(
                              padding: EdgeInsets.only(left: 1.w),
                              child: Text(
                                venue[index].name.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.5.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(height: 0.5.h),
                            Container(
                              padding: EdgeInsets.only(left: 1.w),
                              child: Text(
                                venue[index].desc.toString(),
                                overflow: TextOverflow.ellipsis,
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
            ]),
      ),
    );
  }
}
