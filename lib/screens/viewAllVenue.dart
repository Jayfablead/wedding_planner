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

  cate(
      this.image,
      this.name,
      );
}

List<cate> venue = [
  cate(
      'https://media.weddingz.in/images/98203e459408c4f2f9c9014d9a6f669f/luxury-wedding-venues-in-surat-that-you-must-check-out-prior-to-finalizing-your-wedding-destination.jpg',
      'Dining Arrangement'),
  cate(
      'https://www.happywedding.app/blog/wp-content/uploads/2022/02/Wedding-Venues-in-Washington-State.jpg',
      'Garden Sitting Arrangement'),
  cate(
      'https://imgmedia.lbb.in/media/2019/04/5ca1cedf8722f4176f30d878_1554108127903.jpg',
      'Simple Walk-away Arrangement'),
  cate(
      'https://image.wedmegood.com/resized/540X/uploads/member/739856/1662626980_IMG_0378.jpg?crop=7,99,1139,641',
      'Engagement Arrangement'),
  cate(
      'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
      'Royal Decor Arrangement'),
  cate(
      'https://images.squarespace-cdn.com/content/v1/5fc1488e2e34347c7046adff/1608299164655-MKBFB2JIWNX23JIUWZEG/large-conservatory-wedding-venue.jpg',
      'OutSide Wall House Arrangement'),
  cate(
      'https://res.cloudinary.com/simplotel/image/upload/w_5000,h_3333/x_288,y_0,w_4445,h_3333,r_0,c_crop,q_80,fl_progressive/w_500,f_auto,c_fit/narayani-heights/weddings_in_Ahmedabad',
      'Lighting Arrangement'),
  cate(
      'https://image.wedmegood.com/resized/450X/uploads/member/41807/1455816607_Pic_4.jpg',
      'Marriage Arrangement'),
  cate(
      'https://cdn0.weddingwire.in/vendor/8131/3_2/960/jpg/4_15_268131-157259365855992.jpeg',
      'Engage Arrangement'),
  cate(
      'https://image.wedmegood.com/resized/540X/uploads/member/2741886/1642838908_262555629_2094450290730459_3595191562949852360_n.jpg',
      'Royal Engagement Arrangement'),
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
              SizedBox(height: 2.h),
              SizedBox(
                height: 87.h,
                child: GridView.builder(padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 1.h,mainAxisSpacing: 2.h,childAspectRatio: 0.75/1,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          height: 27.h,
                          width: 45.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 17.h,
                                width: 45.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    imageUrl: venue[index].image ?? '',
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
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 1.5.h),
                                child: Text(
                                  venue[index].name ?? '',
                                  style: TextStyle(
                                      fontFamily: 'get',
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                  },
                  itemCount: venue.length,
                ),
              )
            ]),
      ),
    );
  }
}
