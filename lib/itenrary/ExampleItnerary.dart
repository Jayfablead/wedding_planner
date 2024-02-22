import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/drawer.dart';
import '../widgets/headerwidget.dart';

class ExampleItinerary extends StatefulWidget {
  const ExampleItinerary({super.key});

  @override
  State<ExampleItinerary> createState() => _ExampleItineraryState();
}

final GlobalKey<ScaffoldState> scaffoldKey165 = GlobalKey<ScaffoldState>();

class _ExampleItineraryState extends State<ExampleItinerary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      key: scaffoldKey165,
      drawer: drawer1(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            header(
                text: "Example Itinerary",
                callback1: () {
                  scaffoldKey165.currentState?.openDrawer();
                }),
            SizedBox(height: 6.h),
            Image.asset('assets/egItinerar.jpg'),
          ],
        ),
      ),
    );
  }
}
