import 'dart:convert';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/UnreadmsgModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';

import '../Chat/ChatListPage.dart';
import '../Others/NotificationScreen.dart';
import '../chnages/yellowHomePage.dart';

class bottomnavbar extends StatefulWidget {
  int? selit;

  bottomnavbar({super.key, this.selit});

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  // NotchBottomBarController? _controller;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
   index == 0
        ? Get.offAll(
            NotificationScreen(
              sele: 0,
            ),
          )
        :index == 1
            ? Get.offAll(
                YellowHomeScreen(
                  sele: 1,
                ),
              )
            : Get.offAll(
                ChatlistPage(sele: 2),
              );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    unreadmsgap();
  }

  @override
  Widget build(BuildContext context) {
    // _controller = NotchBottomBarController(index: widget.selit!);
    return ConvexAppBar(
      backgroundColor: Colors.white,
      elevation: 0.09,
      initialActiveIndex: widget.selit,
      activeColor: Colors.blue,
      color: Colors.blue,
      items: [
        TabItem(
          fontFamily: 'sofi',
          icon: Icon(
            CupertinoIcons.bell_fill,
            size: 20.sp, color: Colors.blue, // Customize icon size
          ),
          activeIcon: Icon(
            CupertinoIcons.bell_fill,
            size: 20.sp, color: Colors.white, // Customize icon size
          ),
          title: 'Notifications',
        ),
        TabItem(
            fontFamily: 'sofi',
            icon: Icon(
              CupertinoIcons.house_fill,
              size: 20.sp, color: Colors.blue, // Customize icon size
            ),
            activeIcon: Icon(
              CupertinoIcons.house_fill,
              size: 20.sp, color: Colors.white, // Customize icon size
            ),
            title: 'Home'),
        TabItem(
            fontFamily: 'sofi',
            icon: Icon(
              CupertinoIcons.chat_bubble_text_fill,
              size: 21.sp, color: Colors.blue, // Customize icon size
            ),
            activeIcon: Icon(
              CupertinoIcons.chat_bubble_text_fill,
              size: 21.sp, color: Colors.white, // Customize icon size
            ),
            title: 'Message'),
      ],
      onTap: _onItemTapped,
      // onTap:(index) {
      //
      //       index == 0
      //           ?
      //           Get.offAll(
      //         NotificationScreen(
      //
      //         ),
      //       )
      //           : index == 1
      //           ?
      //         Get.offAll(
      //         YellowHomeScreen(
      //           sele: 1,
      //         ),
      //       )
      //           :
      //
      //           Get.offAll(
      //         ChatlistPage(sele: 2),
      //       );
      //
      //
      // },
    );
    //   AnimatedNotchBottomBar(
    //   notchBottomBarController: _controller!,
    //   showLabel: true,
    //   notchColor: Colors.blue,
    //   itemLabelStyle: TextStyle(color: Colors.blue),
    //   removeMargins: true,
    //   bottomBarWidth: MediaQuery.of(context).size.width,
    //   durationInMilliSeconds: 100,
    //   bottomBarItems: [
    //     BottomBarItem(
    //       inActiveItem: Image.asset("assets/bottom/1.png",
    //           height: 15.h, width: 20.w, color: Colors.blue),
    //       activeItem: Image.asset("assets/bottom/1.png",
    //           height: 15.h, width: 20.w, color: Colors.white),
    //       itemLabel: 'Meeting',
    //     ),
    //     BottomBarItem(
    //       inActiveItem: Image.asset("assets/bottom/7.png",
    //           height: 15.h, width: 20.w, color: Colors.blue),
    //       activeItem: Image.asset("assets/bottom/7.png",
    //           height: 15.h, width: 20.w, color: Colors.white),
    //       itemLabel: 'Board',
    //     ),
    //     BottomBarItem(
    //       inActiveItem: Image.asset("assets/bottom/3.png",
    //           height: 15.h, width: 20.w, color: Colors.blue),
    //       activeItem: Image.asset("assets/bottom/3.png",
    //           height: 15.h, width: 20.w, color: Colors.white),
    //       itemLabel: 'Home',
    //     ),
    //     BottomBarItem(
    //       inActiveItem: Stack(
    //         children: [
    //           Container(
    //             child: Image.asset(
    //               "assets/bottom/5.png",
    //               height: 15.h,
    //               width: 20.w,
    //               color: Colors.blue,
    //             ),
    //           ),
    //         ],
    //       ),
    //       activeItem: Stack(
    //         children: [
    //           Container(
    //             child: Image.asset("assets/bottom/5.png",
    //                 height: 15.h, width: 20.w, color: Colors.white),
    //           ),
    //           // unreadmsgmodal?.remainToread == 0
    //           //     ? Container()
    //           //     : Positioned(
    //           //         left: 3.w,
    //           //         child: Container(
    //           //           alignment: Alignment.center,
    //           //           height: 2.w,
    //           //           width: 2.w,
    //           //           decoration: BoxDecoration(
    //           //             shape: BoxShape.circle,
    //           //             color: Colors.red,
    //           //           ),
    //           //           child: Text(
    //           //             unreadmsgmodal?.remainToread.toString() ?? '',
    //           //             style:
    //           //                 TextStyle(color: Colors.white, fontSize: 12.sp),
    //           //           ),
    //           //         ))
    //         ],
    //       ),
    //       itemLabel: 'Chat',
    //     ),
    //     BottomBarItem(
    //       inActiveItem: Image.asset("assets/bottom/4.png",
    //           height: 15.h, width: 20.w, color: Colors.blue),
    //       activeItem: Image.asset("assets/bottom/4.png",
    //           height: 15.h, width: 20.w, color: Colors.white),
    //       itemLabel: 'Supplier',
    //     ),
    //   ],
    //   onTap: (index) {
    //     setState(
    //       () {
    //         index == 0
    //             ? Get.to(
    //                 MeetingsPage(
    //                   sele: 0,
    //                 ),
    //               )
    //             : index == 1
    //                 ? Get.to(
    //                     PostPage(
    //                       sele: 1,
    //                     ),
    //                   )
    //                 : index == 2
    //                     ? Get.to(
    //                         YellowHomeScreen(
    //                           sele: 2,
    //                         ),
    //                       )
    //                     : index == 3
    //                         ? Get.to(
    //                             ChatlistPage(
    //                               sele: 3,
    //                             ),
    //                           )
    //                         : Get.to(
    //                             MySups(sele: 4),
    //                           );
    //       },
    //     );
    //   },
    // );
  }

  unreadmsgap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().unreadmsgapi().then((response) async {
          unreadmsgmodal = UnreadmsgModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && unreadmsgmodal?.status == "1") {
            print("unread");
            print(unreadmsgmodal?.remainToread);
          } else {}
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
