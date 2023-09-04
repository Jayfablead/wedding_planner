import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class QuatationsDetails extends StatefulWidget {
  String? type;
  String? name;
  String? date;

  QuatationsDetails({super.key, this.type, this.name, this.date});

  @override
  State<QuatationsDetails> createState() => _QuatationsDetailsState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _QuatationsDetailsState extends State<QuatationsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer1(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded)),
                  Text(
                    "Quotations Details",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'sofi',
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.type.toString(),
                      style: TextStyle(
                          fontFamily: 'sofi',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          letterSpacing: 1),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using .',
                      style: TextStyle(
                          fontFamily: 'sofi',
                          height: 0.13.h,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          letterSpacing: 2),
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.info, size: 19.sp),
                    SizedBox(width: 2.w),
                    Text(
                      "Quotation Info :",
                      style: TextStyle(
                          fontFamily: 'sofi',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          letterSpacing: 1),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.pink.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.deepPurple),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Type of Supplier :',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  widget.type.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1),
                                ),
                                SizedBox(height: 0.5.h),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Supplier Name :',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  widget.name.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1),
                                ),
                                SizedBox(height: 0.5.h),
                              ],
                            ),
                          ]),
                      SizedBox(height: 1.h),
                      SizedBox(height: 1.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Address :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontFamily: 'sofi',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            '147, VitthalNagar, Bapasitaram Chowk, Katargaam, Surat - 395004',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontFamily: 'sofi',
                                height: 0.2.h,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h),
                      SizedBox(height: 1.h),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Date :',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  '27-01-2024',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1),
                                ),
                                SizedBox(height: 0.5.h),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price :',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  '\$ 2400',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1),
                                ),
                                SizedBox(height: 0.5.h),
                              ],
                            ),
                          ]),
                    ],
                  ),
                ),

                // Container(
                //     height: 49.h,
                //     width: 90.w,
                //     padding: EdgeInsets.symmetric(horizontal: 3.w),
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(20),
                //         color: Colors.pink.shade400),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         SizedBox(height: 2.h),
                //         Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             Text(
                //               'Type of Supplier :',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 15.sp,
                //                   fontWeight: FontWeight.w500,
                //                   letterSpacing: 1),
                //             ),
                //             SizedBox(height: 1.h),
                //             Text(
                //               widget.type.toString(),
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 15.sp,
                //                   fontWeight: FontWeight.w500,
                //                   letterSpacing: 1),
                //             ),
                //             SizedBox(height: 0.5.h),
                //             Divider(
                //               color: Colors.white,
                //               thickness: 2,
                //             ),
                //             SizedBox(height: 0.5.h),
                //             Text(
                //               'Supplier Name :',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 15.sp,
                //                   fontWeight: FontWeight.w500,
                //                   letterSpacing: 1),
                //             ),
                //             SizedBox(height: 1.h),
                //             Text(
                //               widget.name.toString(),
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 15.sp,
                //                   fontWeight: FontWeight.w500,
                //                   letterSpacing: 1),
                //             ),
                //             SizedBox(height: 0.5.h),
                //             Divider(
                //               color: Colors.white,
                //               thickness: 2,
                //             ),
                //             SizedBox(height: 0.5.h),
                //             Text(
                //               'Address :',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 15.sp,
                //                   fontWeight: FontWeight.w500,
                //                   letterSpacing: 1),
                //             ),
                //             SizedBox(height: 1.h),
                //             Text(
                //               'Going Merry, Grand line',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 15.sp,
                //                   fontWeight: FontWeight.w500,
                //                   letterSpacing: 1),
                //             ),
                //             SizedBox(height: 0.5.h),
                //             Divider(
                //               color: Colors.white,
                //               thickness: 2,
                //             ),
                //             SizedBox(height: 0.5.h),
                //             Text(
                //               'Date :',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 15.sp,
                //                   fontWeight: FontWeight.w500,
                //                   letterSpacing: 1),
                //             ),
                //             SizedBox(height: 1.h),
                //             Text(
                //               widget.date.toString(),
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 15.sp,
                //                   fontWeight: FontWeight.w500,
                //                   letterSpacing: 1),
                //             ),
                //             SizedBox(height: 0.5.h),
                //             Divider(
                //               color: Colors.white,
                //               thickness: 2,
                //             ),
                //             SizedBox(height: 0.5.h),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Column(
                //                   children: [
                //                     Text(
                //                       'Price :',
                //                       style: TextStyle(
                //                           color: Colors.white,
                //                           fontSize: 14.sp,
                //                           fontWeight: FontWeight.w500,
                //                           letterSpacing: 1),
                //                     ),
                //                     SizedBox(height: 1.h),
                //                     Text(
                //                       '\$ 2000',
                //                       style: TextStyle(
                //                           color: Colors.white,
                //                           fontSize: 14.sp,
                //                           fontWeight: FontWeight.w500,
                //                           letterSpacing: 1),
                //                     ),
                //                   ],
                //                 ),
                //               ],
                //             ),
                //           ],
                //         )
                //       ],
                //     )),
              ),
              SizedBox(height: 2.h),
              Text(
                'Attachment',
                style: TextStyle(
                    fontFamily: 'sofi',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    letterSpacing: 1),
              ),
              SizedBox(height: 1.h),
              SizedBox(
                height: 15.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 1.w),
                      height: 15.h,
                      width: 30.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              'https://www.meltingflowers.com/blogs/wp-content/uploads/2020/01/dd.jpg',
                          progressIndicatorBuilder: (context, url, progress) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/icons/user.png',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),SizedBox(height: 1.5.h),Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      height: 5.5.h,
                      width: 85.w,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(60.sp),
                      ),
                      child: Center(
                        child: Text(
                          "Add to Budget",
                          style: TextStyle(color: Colors.white, fontSize: 14.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
