import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/main.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

class MeetingsPage extends StatefulWidget {
  int? sele;

  MeetingsPage({super.key, required this.sele});

  @override
  State<MeetingsPage> createState() => _MeetingsPageState();
}

class cate {
  String? date;
  String? name;

  cate(
    this.date,
    this.name,
  );
}

List<cate> days = [
  cate(
    '2',
    'Mon',
  ),
  cate(
    '3',
    'Tue',
  ),
  cate(
    '4',
    'Wed',
  ),
  cate(
    '5',
    'Thu',
  ),
  cate(
    '6',
    'Fri',
  ),
  cate(
    '7',
    'Sat',
  ),
  cate(
    '8',
    'Sun',
  ),
];
int sel = 3;

DateTime _selectedDay = DateTime.now();
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _MeetingsPageState extends State<MeetingsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      setit = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      bottomNavigationBar: bottomnavbar(selit: widget.sele),
      extendBody: true,
      drawer: drawer1(),
      key: scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 4.h,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     IconButton(
                //         onPressed: () {},
                //         icon: Icon(
                //           Icons.arrow_back_ios_new_rounded,
                //           color: Colors.blue,
                //           size: 23.sp,
                //         )),
                //     Text(
                //       "",
                //       style: TextStyle(
                //         fontSize: 15.sp,
                //         fontFamily: 'sofi',
                //         letterSpacing: 1,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     Row(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         IconButton(
                //             onPressed: () {
                //               Get.to(NotificationScreen());
                //             },
                //             icon: Icon(
                //               Icons.notifications_none_rounded,
                //               color: Colors.blue,
                //               size: 21.sp,
                //             )),
                //         IconButton(
                //             onPressed: () {
                //               scaffoldKey.currentState
                //                   ?.openDrawer();
                //             },
                //             icon: Icon(
                //               Icons.menu_rounded,
                //               color: Colors.blue,
                //               size: 23.sp,
                //             )),
                //       ],
                //     )
                //   ],
                // ),
                header(
                    text: "",
                    callback1: () {
                      scaffoldKey.currentState?.openDrawer();
                    }),
                // headerwid(text: ""),
                SizedBox(height: 1.5.h),
                Row(
                  children: [
                    SizedBox(width: 2.w),
                    Text(
                      'Meetings',
                      style: TextStyle(
                        fontSize: 23.sp,
                        fontFamily: 'get',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
              ],
            ),
            SizedBox(
              height: 12.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          sel = index;
                        });
                      },
                      child: Container(
                        width: 21.w,
                        child: Card(
                            color: sel == index ? Colors.blue : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  days[index].date ?? '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: sel == index
                                          ? Colors.white
                                          : Colors.blue),
                                ),
                                SizedBox(height: 0.5.h),
                                Text(
                                  days[index].name ?? '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: sel == index
                                          ? Colors.white
                                          : Colors.blue),
                                ),
                              ],
                            )),
                      ),
                    );
                  },
                  itemCount: days.length),
            ),
            SizedBox(height: 1.5.h),
            Container(
              height: 64.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 13.h,
                          child: Column(
                            children: [
                              Container(
                                height: 2.5.h,
                                width: 5.w,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.blue,
                                        Colors.blue.shade500,
                                        Colors.blue.shade300,
                                        Colors.blue.shade200,
                                        Colors.white12
                                      ],
                                    ),
                                    shape: BoxShape.circle),
                              ),
                              Container(
                                height: 10.h,
                                width: 1.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.blue,
                                      Colors.lightBlueAccent,
                                      Colors.white
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 13.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.calendar_month),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  SizedBox(
                                    width: 55.w,
                                    child: Text(
                                      "Meeting",
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontFamily: 'sofi',
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "2:00 Pm",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: Colors.black.withOpacity(0.75),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 81.w,
                                child: Text(
                                  "Discuss About Wedding Hall and Everything",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: 'sofi',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    color: Colors.black.withOpacity(0.75),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
