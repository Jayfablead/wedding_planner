import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Provider/authprovider.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/chart/seatingChart1.dart';
import 'package:wedding_planner/chnages/SplashScreen.dart';
import 'package:wedding_planner/widgets/load.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configLoading();
  runApp(
    const MyApp(),
  );
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
int setit = 0;

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
            home: SeatingChart1(),
            builder: EasyLoading.init(),
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
