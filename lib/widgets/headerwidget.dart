import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Others/NotificationScreen.dart';
import 'package:wedding_planner/widgets/const.dart';

Widget header({
  required String text,
  required VoidCallback callback1,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded,
              color: Colors.blue, size: 23.sp)),
      Text(
        text,
        style: TextStyle(
          fontSize: 15.sp,
          fontFamily: 'sofi',
          letterSpacing: 1,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PopupMenuButton<String>(
            splashRadius: 20.0,
            icon: Icon(
              Icons.notifications_none_rounded,
              color: Colors.blue,
              size: 21.sp,
            ),
            onOpened: () {

            },
            // onSelected: (value) {
            //   // Handle the selected menu item
            //   if (value == 'Option 1') {
            //     // Perform action for Option 1
            //   } else if (value == 'Option 2') {
            //     // Perform action for Option 2
            //   }
            // },

            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                ...(notificationmodal?.notiDetails ?? []).take(4).map((item) {
                  return PopupMenuItem<String>(
                    value: item.id,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.w, vertical: 1.h),
                          margin:
                              EdgeInsets.only(left: 1.w, right: 3.w, top: 1.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(1.w),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(90),
                                        border: Border.all(
                                            color: Colors.blue, width: 1)),
                                    child: Icon(
                                      Icons.notifications_none_rounded,
                                      color: Colors.blue,
                                      size: 10.sp,
                                    ),
                                  ),
                                  SizedBox(width: 3.w),
                                  Expanded(
                                    // width: 50.w,
                                    child: Text(
                                      item.notiTitle ?? "",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'sofi',
                                        color: Colors.black,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.blue,
                        )
                      ],
                    ),
                  );
                }).toList(),
                notificationmodal?.notiDetails == 0 ||
                        notificationmodal?.notiDetails == null
                    ? PopupMenuItem(
                        child: Container(),
                      )
                    : PopupMenuItem(
                        child: Container(
                          child: Center(
                            child: Text(
                              'No Recent Notifications',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: 'sofi',
                                  fontSize: 13.sp,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                PopupMenuItem<String>(
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.to(NotificationScreen());
                  },
                  value: 'Option 1',
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      Get.to(NotificationScreen());
                    },
                    child: Row(
                      children: [
                        Center(
                            child: Text(
                          "View All",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.blue,
                              fontFamily: 'get'),
                        )),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                ),
              ];

              //   <PopupMenuEntry<String>>[
              //   const PopupMenuItem<String>(
              //     value: 'Option 1',
              //     child: Text('Option 1'),
              //   ),
              //   const PopupMenuItem<String>(
              //     value: 'Option 2',
              //     child: Text('Option 2'),
              //   ),
              // ];
            },
          ),
          // IconButton(
          //     onPressed:callback2,
          //     icon: Icon(
          //       Icons.notifications_none_rounded,
          //       color: Colors.blue,
          //       size: 21.sp,
          //     )),
          IconButton(
              onPressed: callback1,
              icon: Icon(
                Icons.menu_rounded,
                color: Colors.blue,
                size: 23.sp,
              )),
        ],
      ),
    ],
  );
}
