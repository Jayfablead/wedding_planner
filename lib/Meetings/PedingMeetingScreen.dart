import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/MeetingModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../Modal/addMeetingModal.dart';
import '../widgets/const.dart';

class PedingMeetingScreen extends StatefulWidget {


  PedingMeetingScreen({super.key});

  @override
  State<PedingMeetingScreen> createState() => _PedingMeetingScreenState();
}

class cate {
  String? date;
  String? name;

  cate(
      this.date,
      this.name,
      );
}

TextEditingController _title = TextEditingController();
TextEditingController _desc = TextEditingController();
TextEditingController _cate = TextEditingController();
TextEditingController _start = TextEditingController();
TextEditingController _time = TextEditingController();
final GlobalKey<ScaffoldState> scaffoldKey14 = GlobalKey<ScaffoldState>();
final formKey = GlobalKey<FormState>();

class _PedingMeetingScreenState extends State<PedingMeetingScreen> {
  int? sel1 = 3;
  bool isLoading = true;
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
        extendBody: true,
        drawer: drawer1(),
        key: scaffoldKey14,
        body: isLoading
            ? Container()
            : Padding(
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
                        scaffoldKey14.currentState?.openDrawer();
                      }),
                  // headerwid(text: ""),
                  SizedBox(height: 1.5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 2.w),
                        child: Text(
                          'Pending Meetings',
                          style: TextStyle(
                            fontSize: 23.sp,
                            fontFamily: 'get',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     addmeetingdialog();
                      //   },
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Container(
                      //           height: 8.w,
                      //           width: 8.w,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(25),
                      //             color: Colors.blue,
                      //           ),
                      //           child: Center(
                      //               child: Icon(
                      //                 Icons.add,
                      //                 size: 20.sp,
                      //                 color: Colors.white,
                      //               ))),
                      //       SizedBox(
                      //         width: 2.w,
                      //       ),
                      //       Text(
                      //         textAlign: TextAlign.center,
                      //         "Add Meeting",
                      //         style: TextStyle(
                      //           fontSize: 14.sp,
                      //           letterSpacing: 1,
                      //           fontFamily: 'sofi',
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.black,
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 2.h),
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
                            color: sel1 == index
                                ? Colors.blue
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
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
                                  nextWeekDatesWithDay[index].name ==
                                      "Monday"
                                      ? "Mon"
                                      : nextWeekDatesWithDay[index]
                                      .name ==
                                      "Tuesday"
                                      ? "Tue"
                                      : nextWeekDatesWithDay[index]
                                      .name ==
                                      "Wednesday"
                                      ? "Wed"
                                      : nextWeekDatesWithDay[
                                  index]
                                      .name ==
                                      "Thursday"
                                      ? "Thu"
                                      : nextWeekDatesWithDay[
                                  index]
                                      .name ==
                                      "Friday"
                                      ? "Fri"
                                      : "Sat",
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
                height: 60.h,
                child: meetingmodal?.meetingsByDate == null ||
                    meetingmodal?.meetingsByDate?.length == 0
                    ? Container(
                  alignment: Alignment.center,
                  child: Text(
                    "No Pending Meetings Available",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'sofi',
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                      color: Colors.black,
                    ),
                  ),
                )
                    : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: meetingmodal?.meetingsByDate?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.w, vertical: 1.h),
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 10.h,
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
                                  height: 7.h,
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
                            height: 10.h,
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Icon(Icons.calendar_month),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    SizedBox(
                                      width: 64.w,
                                      child: Text(
                                        meetingmodal
                                            ?.meetingsByDate?[
                                        index]
                                            .taskTitle ==
                                            '' ||
                                            meetingmodal
                                                ?.meetingsByDate?[
                                            index]
                                                .taskTitle ==
                                                null
                                            ? 'N/A'
                                            : meetingmodal
                                            ?.meetingsByDate?[
                                        index]
                                            .taskTitle ??
                                            "",
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: 'sofi',
                                          fontWeight:
                                          FontWeight.w900,
                                          letterSpacing: 1,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      meetingmodal
                                          ?.meetingsByDate?[
                                      index]
                                          .endTime ==
                                          '' ||
                                          meetingmodal
                                              ?.meetingsByDate?[
                                          index]
                                              .endTime ==
                                              null
                                          ? 'N/A'
                                          : meetingmodal
                                          ?.meetingsByDate?[
                                      index]
                                          .endTime ??
                                          "",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: 'sofi',
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                        color: Colors.black
                                            .withOpacity(0.75),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 81.w,
                                  child: Text(
                                    meetingmodal
                                        ?.meetingsByDate?[
                                    index]
                                        .taskDesc ==
                                        '' ||
                                        meetingmodal
                                            ?.meetingsByDate?[
                                        index]
                                            .taskDesc ==
                                            null
                                        ? 'N/A'
                                        : meetingmodal
                                        ?.meetingsByDate?[
                                    index]
                                        .taskDesc ??
                                        "",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: Colors.black
                                          .withOpacity(0.75),
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

  meetingap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().meetingapi(date1[sel1!]).then((response) async {
          meetingmodal = MeetingModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && viewpostmodal?.status == "1") {
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  addmeetingdialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.grey.shade100,
          child: Stack(
            children: [
              Container(
                // height: 70.h,
                  child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 2.h),
                              // header(
                              //     text: "Add Your CheckList",
                              //     callback1: () {
                              //       scaffoldKey.currentState?.openDrawer();
                              //     }),
                              Center(
                                child: Text(
                                  'Add New Meeting',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontFamily: 'sofi',
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      height: 0.17.h,
                                      letterSpacing: 1),
                                ),
                              ),
                              SizedBox(height: 3.h),
                              Text(
                                'Title :',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'sofi',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                              SizedBox(height: 1.h),
                              TextFormField(
                                controller: _title,
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter check title';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.67),
                                    fontFamily: 'Meta1'),
                                decoration: InputDecoration(
                                  prefixIcon:
                                  Icon(Icons.note_add, color: Colors.blue),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                      BorderSide(color: Colors.white)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                      BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                      BorderSide(color: Colors.white)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                      BorderSide(color: Colors.white)),
                                  hintText: 'Title',
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.67),
                                      fontFamily: 'Meta1'),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 2.h),
                                  Text(
                                    'Description :',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'sofi',
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                  SizedBox(height: 1.h),
                                  TextFormField(
                                    controller: _desc,
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter check description';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.67),
                                        fontFamily: 'Meta1'),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.description,
                                        color: Colors.blue,
                                      ),
                                      border: InputBorder.none,
                                      fillColor: Colors.white,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(25),
                                          borderSide:
                                          BorderSide(color: Colors.white)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(25),
                                          borderSide:
                                          BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(25),
                                          borderSide:
                                          BorderSide(color: Colors.white)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(25),
                                          borderSide:
                                          BorderSide(color: Colors.white)),
                                      hintText: 'Description',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.67),
                                          fontFamily: 'Meta1'),
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                'Date :',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'sofi',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                              SizedBox(height: 1.h),
                              TextFormField(
                                readOnly: true,
                                controller: _start,
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter check start date';
                                  }
                                  return null;
                                },
                                onTap: () async {
                                  DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    // Initial date, can be the current date or a specific date
                                    firstDate: DateTime.now(),
                                    // The first date that can be selected
                                    lastDate: DateTime(
                                        2101), // The last date that can be selected
                                  );

                                  if (picked != null) {
                                    setState(() {
                                      print(picked);
                                      String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(picked);
                                      _start.text = formattedDate
                                          .toString(); // Store the selected date in a variable
                                    });
                                  }
                                },
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.67),
                                    fontFamily: 'Meta1'),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.calendar_month,
                                      color: Colors.blue),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                      BorderSide(color: Colors.white)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                      BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                      BorderSide(color: Colors.white)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                      BorderSide(color: Colors.white)),
                                  hintText: 'Date',
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.67),
                                      fontFamily: 'Meta1'),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                'Time :',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'sofi',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                              SizedBox(height: 1.h),
                              TextFormField(
                                readOnly: true,
                                controller: _time,
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter check end date';
                                  }
                                  return null;
                                },
                                onTap: () async {
                                  timepicker();
                                },
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.67),
                                    fontFamily: 'Meta1'),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.access_time_rounded,
                                      color: Colors.blue),
                                  border: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                      BorderSide(color: Colors.white)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                      BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                      BorderSide(color: Colors.white)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                      BorderSide(color: Colors.white)),
                                  hintText: 'Time',
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.67),
                                      fontFamily: 'Meta1'),
                                ),
                              ),
                              SizedBox(height: 3.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      addmeetingap();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(2.5.w),
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                          BorderRadius.circular(25)),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            CupertinoIcons.add,
                                            size: 17.sp,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            'Add Meeting',
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                fontFamily: 'sofi',
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                            ],
                          ),
                        ),
                      ))),
              Positioned(
                  right: 0,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(CupertinoIcons.clear_circled_solid)))
            ],
          ),
        );
      },
    );
  }

  void timepicker() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child ?? Container(),
        );
      },
    );

    if (picked != null) {
      setState(() {
        _time.text = DateFormat.Hm().format(
          DateTime(2021, 1, 1, picked.hour, picked.minute),
        );
      });
    }
  }

  addmeetingap() {
    if (formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['meeting_title'] = _title.text.toString();
      data['meeting_description'] = _desc.text.toString();
      data['start_date'] = _start.text.toString();
      data['time'] = _time.text.toString();
      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          taskprovider().addmeetingapi(data).then((response) async {
            addmeetingmodal =
                AddmeetingModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && addmeetingmodal?.status == "1") {
              _title.text = "";
              _desc.text = "";
              _start.text = "";
              _time.text = "";
              meetingap();
              Get.back();
            } else {}
          });
        } else {
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    }
  }
}
