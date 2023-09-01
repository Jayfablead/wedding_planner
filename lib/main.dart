import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/BannerPage.dart';
import 'package:wedding_planner/screens/LoginPage.dart';
import 'package:wedding_planner/screens/MainScreen.dart';
import 'package:wedding_planner/screens/other%20Pages/booking%20page.dart';
import 'package:wedding_planner/screens/pages2/fbpage.dart';
import 'package:wedding_planner/screens/pages2/home2.dart';
import 'package:wedding_planner/screens/pages2/venue%202.dart';

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
          home: MainScreen(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
