import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/new%20pages/view%20all%20bookings.dart';
import 'package:wedding_planner/screens/MainScreen.dart';
import 'package:wedding_planner/screens/other%20Pages/Venue%20Details%20Page.dart';
import 'package:wedding_planner/screens/other%20Pages/guestroomManagement.dart';
import 'package:wedding_planner/screens/scrns/MainScreen2.dart';

import 'new pages/NotificationScreen.dart';
import 'new pages/certificate.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: NotificationScreen(),
          builder: EasyLoading.init(),theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        );
      },
    );
  }
}
