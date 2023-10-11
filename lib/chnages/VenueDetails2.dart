import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';

class VenueDetails2 extends StatefulWidget {
  const VenueDetails2({super.key});

  @override
  State<VenueDetails2> createState() => _VenueDetails2State();
}

class _VenueDetails2State extends State<VenueDetails2> {
  List HotelIm = [
    'https://i0.wp.com/decorsutrablog.com/wp-content/uploads/2020/06/DecorSutra_Wedding-Decor-9_Royal-Decor.jpg?fit=780%2C425&ssl=1',
    'https://i.pinimg.com/originals/2f/10/f6/2f10f6363ce6fd2461cec2bd46dbc916.jpg',
    'https://fancdesigns.com/wp-content/uploads/2016/08/royal-decorations-40-royal-wedding-decorations-2246-x-1162-1.jpg',
    'https://i0.wp.com/eventertainments.com/blog/wp-content/uploads/2021/03/Best-Wedding-Stage-Decoration-with-Flowers.jpg?fit=1200%2C900&ssl=1',
    'https://cdn0.weddingwire.in/vendor/8241/3_2/960/jpg/img-20180903-wa0013_15_158241.jpeg',
    'https://www.dreamzkraft.com/admin/blog-images/big/decoration-for-wedding/wedding-decoration%E2%80%93royal-2.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: bottomnavbar(selit: -3),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 35.h,
                width: MediaQuery.of(context).size.width,
                child: CachedNetworkImage(
                  imageUrl:"https://i0.wp.com/decorsutrablog.com/wp-content/uploads/2020/06/DecorSutra_Wedding-Decor-9_Royal-Decor.jpg?fit=780%2C425&ssl=1",
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
              Positioned(
                  left: 5.w,
                  top: 5.h,
                  child: Icon(Icons.arrow_back_ios,color: Colors.white,))
            ],
          ),
          SizedBox(height: 2.h,),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 56.h,
              padding:  EdgeInsets.symmetric(horizontal: 3.w),
              child: ListView(
                padding: EdgeInsets.zero,
                // crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    'Blessing Sunset Terrace',
                    style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.black,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 0.5.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_outlined,color:Colors.grey.shade600,size: 15.sp,),
                      Text(
                        'Sherkhi, Baroda',
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.grey.shade600,
                            fontFamily: 'sofi',
                            letterSpacing: 1,
                            fontWeight: FontWeight.normal),
                      ),
                      // SizedBox(width: 1.w,),
                      // Icon(Icons.star,color:Colors.amber.shade600,size: 14.sp,),
                      // SizedBox(width: 1.w,),
                      // Text(
                      //   '4.5',
                      //   style: TextStyle(
                      //       fontSize: 11.sp,
                      //       color: Colors.grey.shade600,
                      //       fontFamily: 'sofi',
                      //       letterSpacing: 1,
                      //       fontWeight: FontWeight.normal),
                      // ),
                    ],
                  ),
                  SizedBox(height: 0.5.h,),
                  Text(
                    '500 persons,with include wedding organizer',
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey.shade600,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 0.5.h,),
                  Divider(
                    color: Colors.grey.shade600,
                  ),
                  SizedBox(height: 0.5.h,),
                  Text(
                    'Detail',
                    style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.black,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 0.5.h,),
                  Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: Colors.grey)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Package Price',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.grey.shade600,
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height:1.h,),
                            Text(
                              '\$ 15000',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.pink,
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Capacity',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.grey.shade600,
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height:1.h,),
                            Text(
                              '500 Person',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.pink,
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 0.5.h,),
                  Divider(
                    color: Colors.grey.shade600,
                  ),
                  SizedBox(height: 0.5.h,),
                  Text(
                    'About',
                    style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.black,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 1.5.h,),
                  SizedBox(
                    width: 90.w,
                    child: ReadMoreText(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat '
                          'nulla pariatur.',
                      trimLines: 6,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          height: 1,
                          fontSize: 15.sp,
                          color: Colors.grey.shade600,
                          fontFamily: 'sofi',
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' Read More',
                      trimExpandedText: ' Read Less',
                      moreStyle: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold),
                      lessStyle: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 1.5.h,),
                  Divider(
                    color: Colors.grey.shade600,
                  ),
                  SizedBox(height: 0.5.h,),
                  Text(
                    'Location',
                    style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.black,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 1.5.h,),
                  Image.asset("assets/map.png",width: MediaQuery.of(context).size.width,height: 25.h,)

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
