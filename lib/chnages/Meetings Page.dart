import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/MeetingModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/main.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

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






class _MeetingsPageState extends State<MeetingsPage> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int? sel1=3;
  bool isLoading =true;
  List<cate> nextWeekDatesWithDay = [];
  DateTime currentDate = DateTime.now();
  List<String> date1 = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      for (int i = -3; i < 4; i++) {
        DateTime nextDate = currentDate.add(Duration(days: i));
        String formattedDate = DateFormat('yyyy-MM-dd').format(nextDate);
        String formattedDate1 = DateFormat('dd').format(nextDate);
        String dayOfWeek = DateFormat('EEEE').format(nextDate);
        date1.add(formattedDate);
        nextWeekDatesWithDay.add(cate(formattedDate1, dayOfWeek));
      }
    });
    meetingap();


  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
        bottomNavigationBar: bottomnavbar(selit: widget.sele),
        extendBody: true,
        drawer: drawer1(),
        key: scaffoldKey,
        body:isLoading?Container(): Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 4.h,
                  ),

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
                  itemCount: nextWeekDatesWithDay.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          sel1 = index;
                        });
                        meetingap();
                      },
                      child: Container(
                        width: 21.w,
                        child: Card(
                            color: sel1 == index ? Colors.blue : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  nextWeekDatesWithDay[index].date ?? '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: sel1 == index
                                          ? Colors.white
                                          : Colors.blue),
                                ),
                                SizedBox(height: 0.5.h),
                                Text(
                                  nextWeekDatesWithDay[index].name == "Monday" ? "Mon" :   nextWeekDatesWithDay[index].name == "Tuesday" ?"Tue": nextWeekDatesWithDay[index].name == "Wednesday"?"Wed":
                                  nextWeekDatesWithDay[index].name == "Thursday" ?"Thu" : nextWeekDatesWithDay[index].name == "Friday" ?"Fri":"Sat",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: sel1 == index
                                          ? Colors.white
                                          : Colors.blue),
                                ),
                              ],
                            )),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 1.5.h),
              Container(
                height: 64.h,
                child:meetingmodal?.meetingsByDate?.length == 0?Container(
                  alignment: Alignment.center,
                  child:Text(
                    "No Meeting",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'sofi',
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                      color: Colors.black,
                    ),
                  ),
                ): ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: meetingmodal?.meetingsByDate?.length,
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
                                        meetingmodal?.meetingsByDate?[index].taskTitle ?? "",
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: 'sofi',
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 1,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    // Text(
                                    //   "2:00 Pm",
                                    //   style: TextStyle(
                                    //     fontSize: 12.sp,
                                    //     fontFamily: 'sofi',
                                    //     fontWeight: FontWeight.bold,
                                    //     letterSpacing: 1,
                                    //     color: Colors.black.withOpacity(0.75),
                                    //   ),
                                    // ),
                                  ],
                                ),
                                Container(
                                  width: 81.w,
                                  child: Text(
                                    meetingmodal?.meetingsByDate?[index].taskDesc ?? "",
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
      ),
    );


  }
  meetingap(){
    checkInternet().then((internet) async
    {
      if (internet) {
        taskprovider()
            .meetingapi(date1[sel1!])
            .then((response) async {
          meetingmodal = MeetingModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && viewpostmodal?.status == "1") {
            setState(() {
              isLoading = false;
            });
          }

          else {
            setState(() {
              isLoading = false;
            });

          }
        });
      }
      else{
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
