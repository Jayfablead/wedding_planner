import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/chnages/Meetings%20Page.dart';
import 'package:wedding_planner/screens/other%20Pages/ChatListPage.dart';
import 'package:wedding_planner/screens/pages2/fbpage.dart';
import 'package:wedding_planner/screens/profilePage.dart';
import 'package:wedding_planner/screens/scrns/viewBudgetPage.dart';

class bottomnavbar extends StatefulWidget {
  int? selit;

  bottomnavbar({super.key, required this.selit});

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  NotchBottomBarController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = NotchBottomBarController(index: 0);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white.withOpacity(0.00),
      height: 90,
      shadowColor: Colors.transparent,
      child: AnimatedNotchBottomBar(
        blurFilterX: 10,
        blurFilterY: 90,

        /// Provide NotchBottomBarController
        notchBottomBarController: _controller!,
        showShadow: true,
        showLabel: true,
        notchColor: Colors.amber,
        itemLabelStyle: TextStyle(color: Colors.amber),

        /// restart app if you change removeMargins

        removeMargins: true,
        bottomBarWidth: MediaQuery.of(context).size.width,
        durationInMilliSeconds: 300,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Image.asset("assets/bottom/1.png",
                height: 10.h, width: 20.w, color: Colors.amber),
            activeItem: Image.asset(
              "assets/bottom/1.png",
              height: 10.h,
              width: 20.w,
            ),
            itemLabel: 'Meeting',
          ),
          BottomBarItem(
            inActiveItem: Image.asset("assets/bottom/2.png",
                height: 10.h, width: 20.w, color: Colors.amber),
            activeItem: Image.asset(
              "assets/bottom/2.png",
              height: 10.h,
              width: 20.w,
            ),
            itemLabel: 'Board',
          ),
          BottomBarItem(
            inActiveItem: Image.asset("assets/bottom/3.png",
                height: 10.h, width: 20.w, color: Colors.amber),
            activeItem: Image.asset(
              "assets/bottom/3.png",
              height: 10.h,
              width: 20.w,
            ),
            itemLabel: 'Chat',
          ),
          BottomBarItem(
            inActiveItem: Image.asset("assets/bottom/4.png",
                height: 10.h, width: 20.w, color: Colors.amber),
            activeItem: Image.asset(
              "assets/bottom/4.png",
              height: 10.h,
              width: 20.w,
            ),
            itemLabel: 'Venue',
          ),
          BottomBarItem(
            inActiveItem: Image.asset("assets/bottom/5.png",
                height: 10.h, width: 20.w, color: Colors.amber),
            activeItem: Image.asset(
              "assets/bottom/5.png",
              height: 10.h,
              width: 20.w,
            ),
            itemLabel: 'Supplier',
          ),
        ],
        onTap: (index) {
          setState(() {
            index == 0
                ? Get.to(MeetingsPage())
                : index == 1
                    ? Get.to(PostPage())
                    : index == 2
                        ? Get.to(ChatlistPage())
                        : index == 3
                            ? Get.to(ViewBudget())
                            : Get.to(MyProfile());
          });
        },
      ),
    );
  }
}
