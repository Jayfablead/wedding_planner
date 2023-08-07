import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/SupplierPage.dart';

import 'BannerPage.dart';

class DecorationPage extends StatefulWidget {
  const DecorationPage({super.key});

  @override
  State<DecorationPage> createState() => _DecorationPageState();
}
bool readmore = false;
class _DecorationPageState extends State<DecorationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Supplier",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded))
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 87.h,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Decor Suppliers',
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
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 1.w),
                                      height: 70.h,
                                      width: 40.w,
                                      child: Image.asset('assets/copl.png')),
                                  SizedBox(width: 1.w),
                                  SizedBox(
                                    width: 44.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                          child: Container(
                                            width: 28.w,
                                            height: 5.h,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25.sp),
                                            ),
                                            child: Center(
                                                child: Text(
                                              "Book Now",
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: Colors.pink,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'sofi'),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 2.h,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Flower Decoration',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'sofi',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    color: Colors.black),
                              ),
                              Text(
                                'There are many variations..',
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontFamily: 'sofi',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                    SliverGrid.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 2.w,
                          childAspectRatio: 0.65 / 1,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 1.h),
                          child: Column(
                            children: [
                              Container(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://cdn0.hitched.co.uk/article/1348/3_2/960/jpg/128431-brinsop-court-manor-house-and-and-barn-top-wedding-venues-2022.jpeg",
                                  fit: BoxFit.cover,
                                  height: 20.h,
                                  width: 40.w,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(25.0),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                'Supplier ${index+1}',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'sofi',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 1.h),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                                InkWell(
                                  onTap: () {Get.to(SupplierfourScreen());},
                                  child: Container(
                                    height: 5.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3.w),
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius:
                                          BorderRadius.circular(25.sp),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "View Details",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                          fontFamily: 'get'),
                                    )),
                                  ),
                                ),InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 5.h,
                                 width: 10.w,
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius:
                                          BorderRadius.circular(25.sp),
                                    ),
                                    child: Icon(Icons.add,color: Colors.white,)
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        );
                      },
                      itemCount: readmore?8:4,
                    ),
                    SliverToBoxAdapter(child:   InkWell(
                      onTap: () {
                      setState(() {
                        readmore = !readmore;
                      });
                      },
                      child: Container(
                        width: 70.w,
                        height: 7.h,margin: EdgeInsets.symmetric(horizontal: 25.w,vertical: 1.h),
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(25.sp),
                        ),
                        child: Center(
                            child: Text(
                              readmore?"Read Less":"Read More",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontFamily: 'get'),
                            )),
                      ),
                    ),),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
