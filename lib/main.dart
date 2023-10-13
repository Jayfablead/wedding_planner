import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Provider/authprovider.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/chnages/GuestList.dart';
import 'package:wedding_planner/chnages/SplashScreen.dart';
import 'package:wedding_planner/chnages/VenueDetails2.dart';
import 'package:wedding_planner/chnages/View%20Table.dart';
import 'package:wedding_planner/chnages/YellowMy%20Venue.dart';
import 'package:wedding_planner/new%20pages/RoomMange2.dart';
import 'package:wedding_planner/screens/LoginPage.dart';
import 'package:wedding_planner/screens/other%20Pages/Venue%20Details%20Page.dart';
import 'package:wedding_planner/screens/other%20Pages/guestroomManagement.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

int setit = 0;
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

void openDrawer() {
  print("drawer");
  scaffoldKey.currentState?.openDrawer();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => authprovider()),
        ChangeNotifierProvider(create: (context) => taskprovider()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashLogo(),
            builder: EasyLoading.init(),
            theme: ThemeData(
              primarySwatch: Colors.amber,
            ),
          );
        },
      ),
    );
  }
}
