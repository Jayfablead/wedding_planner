import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';

import '../widgets/drawer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class icon {
  String? name;
  String? desc;
  String? time;

  icon(
    this.name,
    this.desc,
    this.time,
  );
}

List<icon> noti = [
  icon(
      'Caterers',
      'Check this quotation you requested asfcnasasnckasc asjbdasjkdbas',
      '10:20 pm'),
  icon('Photographer', 'Check this quotation you requested', '10:20 pm'),
  icon('mr.Ling', 'Hey ! How Are You?', '10:20 pm'),
  icon('Decorators', 'Check this quotation you requested', '10:20 pm'),
  icon('Designers', 'Check this quotation you requested', '10:20 pm'),
  icon('Salon', 'Check this quotation you requested', '10:20 pm'),
];

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: bottomnavbar(selit: -3),
      drawer: drawer1(),
      key: scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: SingleChildScrollView(
          child: Column(
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
                    "",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'sofi',
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Icon(Icons.menu_rounded))
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Notifications",
                      style: TextStyle(
                        fontSize: 27.sp,
                        fontFamily: 'sofi',
                        color: Colors.blue,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 0.5.w),
                      height: 8.h,
                      padding: EdgeInsets.all(0.7.w),
                      width: 17.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          border: Border.all(color: Colors.blue, width: 3)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              'https://1.bp.blogspot.com/-K2OTtt4vUHA/YDIDbFBT6TI/AAAAAAAAh-0/2J6DGn-OZ-gOz8yWhui2cIdas99opxzzgCLcBGAsYHQ/w1600/Cute%2Band%2BBeautiful%2BBridal%2BMakeup%2Band%2BDress%2BDP%2BIdeas%2Bfor%2BGirls%2B2021.jpg',
                          progressIndicatorBuilder: (context, url, progress) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/deprf.png',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Column(
                children: [
                  for (int index = 0; index < noti.length; index++) ...[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 1.5.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: Icon(Icons.notifications_none_rounded,
                                color: Colors.black, size: 24.sp),
                          ),
                          SizedBox(width: 3.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 60.w,
                                    child: Text(
                                      noti[index].name ?? '',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'sofi',
                                        color: Colors.black,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    noti[index].time ?? '',
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontFamily: 'sofi',
                                      color: Colors.black.withOpacity(0.65),
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 0.8.h),
                              SizedBox(
                                width: 75.w,
                                child: Text(
                                  noti[index].desc ?? '',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: 'sofi',
                                    height: 0.15.h,
                                    color: Colors.black.withOpacity(0.65),
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // child: ListTile(
                      //   leading: Container(
                      //     padding: EdgeInsets.all(2.w),
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(90),
                      //         border:
                      //             Border.all(color: Colors.black, width: 2)),
                      //     child: Icon(Icons.notifications_none_rounded,
                      //         color: Colors.black, size: 24.sp),
                      //   ),
                      //   title: Text(
                      //     noti[index].name ?? '',
                      //     style: TextStyle(
                      //       fontSize: 14.sp,
                      //       fontFamily: 'sofi',
                      //       color: Colors.black,
                      //       letterSpacing: 1,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      //   subtitle: Text(
                      //     noti[index].desc ?? '',
                      //     style: TextStyle(
                      //       fontSize: 12.sp,
                      //       fontFamily: 'sofi',
                      //       color: Colors.black.withOpacity(0.65),
                      //       letterSpacing: 1,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      //   trailing: Text(
                      //     noti[index].time ?? '',
                      //     style: TextStyle(
                      //       fontSize: 11.sp,
                      //       fontFamily: 'sofi',
                      //       color: Colors.black.withOpacity(0.65),
                      //       letterSpacing: 1,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                    ),
                  ]
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
// Container(
// margin: EdgeInsets.symmetric(vertical: 1.5.h),
// child: ListTile(
// leading: Container(
// padding: EdgeInsets.all(2.w),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(90),
// border: Border.all(color: Colors.black, width: 2)),
// child: Icon(Icons.notifications_none_rounded,
// color: Colors.black, size: 22.sp),
// ),
// ),
// );
