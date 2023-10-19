import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/new%20pages/NotificationScreen.dart';

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationState();
}
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Get.to(NotificationScreen());
              },
              icon: Icon(
                Icons.notifications_none_rounded,
                color: Colors.blue,
                size: 21.sp,
              )),
          IconButton(
              onPressed: () {
                scaffoldKey.currentState
                    ?.openDrawer();
              },
              icon: Icon(
                Icons.menu_rounded,
                color: Colors.blue,
                size: 23.sp,
              )),
        ],
      ),
    );
  }
}
