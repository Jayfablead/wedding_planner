import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/MeetingModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../Modal/ViewMeetinModal.dart';
import '../Modal/addMeetingModal.dart';
import '../widgets/const.dart';

class MeetingsPage extends StatefulWidget {
  MeetingsPage({super.key});

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

TextEditingController _title = TextEditingController();
TextEditingController _desc = TextEditingController();
TextEditingController _zoom = TextEditingController();
TextEditingController _call = TextEditingController();
TextEditingController _start = TextEditingController();
TextEditingController _time = TextEditingController();
TextEditingController _meeting = TextEditingController();
final GlobalKey<ScaffoldState> scaffoldKey14 = GlobalKey<ScaffoldState>();
final formKey = GlobalKey<FormState>();

class _MeetingsPageState extends State<MeetingsPage> {
  int? sel1 = 3;
  bool isLoading = true;
  bool isload = true;
  List<cate> nextWeekDatesWithDay = [];
  DateTime currentDate = DateTime.now();
  List<String> date1 = [];
  String? category;
  List timesel = [
    'Choose Time',
    'I’m flexible',
  ];
  String? Meet;
  List meeting = ['In person', 'Zoom', 'Phone call'];

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
            : SingleChildScrollView(
                child: Padding(
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
                                  'Meetings',
                                  style: TextStyle(
                                    fontSize: 23.sp,
                                    fontFamily: 'get',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    category = null;
                                    Meet = null;
                                  });
                                  addmeetingdialog();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 7.w,
                                        width: 7.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: Colors.blue,
                                        ),
                                        child: Center(
                                            child: Icon(
                                          Icons.add,
                                          size: 17.sp,
                                          color: Colors.white,
                                        ))),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      "Request Meeting",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        letterSpacing: 1,
                                        fontFamily: 'sofi',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
                                print("datefrment${date1[sel1!]}");
                                setState(() {
                                  sel1 = index;
                                  isload = true;
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    elevation: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          nextWeekDatesWithDay[index].date ??
                                              '',
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
                        child: isload
                            ? Container(
                                height: 60.h,
                                child:
                                    Center(child: CircularProgressIndicator()),
                              )
                            : meetingmodal?.meetingsByDate == null ||
                                    meetingmodal?.meetingsByDate?.length == 0
                                ? Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "No Meetings Available",
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
                                    itemCount:
                                        meetingmodal?.meetingsByDate?.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          viewmeetingapi(meetingmodal
                                                  ?.meetingsByDate?[index].id ??
                                              "");
                                          addmeetttttingdialog();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2.w, vertical: 1.h),
                                          margin: EdgeInsets.symmetric(
                                              vertical: 1.h),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                                          gradient:
                                                              LinearGradient(
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter,
                                                            colors: [
                                                              Colors.blue,
                                                              Colors.blue
                                                                  .shade500,
                                                              Colors.blue
                                                                  .shade300,
                                                              Colors.blue
                                                                  .shade200,
                                                              Colors.white12
                                                            ],
                                                          ),
                                                          shape:
                                                              BoxShape.circle),
                                                    ),
                                                    Container(
                                                      height: 7.h,
                                                      width: 1.w,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                        gradient:
                                                            LinearGradient(
                                                          begin: Alignment
                                                              .topCenter,
                                                          end: Alignment
                                                              .bottomCenter,
                                                          colors: [
                                                            Colors.blue,
                                                            Colors
                                                                .lightBlueAccent,
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
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Icon(
                                                          Icons.alarm,
                                                          size: 18.sp,
                                                          color: Colors.blue,
                                                        ),
                                                        SizedBox(
                                                          width: 1.w,
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
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            letterSpacing: 1,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.75),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
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
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          letterSpacing: 1,
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.75),
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
                                        ),
                                      );
                                    },
                                  ),
                      ),
                    ],
                  ),
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
              isload = false;
            });
          } else {
            setState(() {
              isLoading = false;
              isload = false;
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
        return StatefulBuilder(
          builder: (context, setState) {
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
                          padding: EdgeInsets.symmetric(
                              vertical: 3.h, horizontal: 3.w),
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
                                      'Request New Meeting',
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
                                  Text(
                                    'Title :',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'sofi',
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  TextFormField(
                                    controller: _meeting,
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter Meeting Title';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.67),
                                        fontFamily: 'Meta1'),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.title,
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
                                      hintText: 'Title',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.67),
                                          fontFamily: 'Meta1'),
                                    ),
                                  ),

                                  SizedBox(height: 1.h),
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
                                        return 'Please enter start date';
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
                                  Container(
                                    width: 90.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 0.5.h),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        hint: Row(
                                          children: [
                                            Icon(Icons.access_time_rounded,
                                                color: Colors.blue),
                                            SizedBox(width: 4.w),
                                            Text(
                                              'Select Time',
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  fontSize: 13.sp,
                                                  fontFamily: "task"),
                                            ),
                                          ],
                                        ),
                                        // Not necessary for Option 1
                                        value: category,
                                        onChanged: (newValue) {
                                          setState(() {
                                            category = newValue.toString();
                                          });
                                        },
                                        items: timesel.map((location) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              location.toString(),
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontFamily: 'task',
                                                  fontSize: 13.sp),
                                            ),
                                            value: location,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  category != 'Choose Time'
                                      ? Container()
                                      : SizedBox(height: 1.5.h),
                                  category != 'Choose Time'
                                      ? Container()
                                      : TextFormField(
                                          readOnly: true,
                                          controller: _time,
                                          onChanged: (value) {},
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter end date';
                                            }
                                            return null;
                                          },
                                          onTap: () async {
                                            timepicker();
                                          },
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.67),
                                              fontFamily: 'Meta1'),
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                                Icons.access_time_rounded,
                                                color: Colors.blue),
                                            border: InputBorder.none,
                                            fillColor: Colors.white,
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                borderSide: BorderSide(
                                                    color: Colors.white)),
                                            disabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                borderSide: BorderSide(
                                                    color: Colors.white)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                borderSide: BorderSide(
                                                    color: Colors.white)),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                borderSide: BorderSide(
                                                    color: Colors.white)),
                                            hintText: 'Select Time',
                                            hintStyle: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.67),
                                                fontFamily: 'Meta1'),
                                          ),
                                        ),
                                  SizedBox(height: 2.h),
                                  Text(
                                    'Meeting Place :',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'sofi',
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                  SizedBox(height: 1.h),
                                  Container(
                                    width: 90.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 0.5.h),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        hint: Row(
                                          children: [
                                            Icon(Icons.place_outlined,
                                                color: Colors.blue),
                                            SizedBox(width: 4.w),
                                            Text(
                                              'Select Meeting Place',
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  fontSize: 13.sp,
                                                  fontFamily: "task"),
                                            ),
                                          ],
                                        ),
                                        // Not necessary for Option 1
                                        value: Meet,
                                        onChanged: (newValue) {
                                          setState(() {
                                            Meet = newValue.toString();
                                          });
                                        },
                                        items: meeting.map((meet) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              meet.toString(),
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontFamily: 'task',
                                                  fontSize: 13.sp),
                                            ),
                                            value: meet,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  Meet == 'In person'
                                      ? Container()
                                      : SizedBox(height: 1.5.h),
                                  Meet == 'In person'
                                      ? Container()
                                      : Meet == 'Zoom'
                                          ? TextFormField(
                                              controller: _zoom,
                                              onChanged: (value) {},
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter Zoom Link';
                                                }
                                                return null;
                                              },
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.67),
                                                  fontFamily: 'Meta1'),
                                              decoration: InputDecoration(
                                                prefixIcon: Icon(
                                                  Icons.video_call_outlined,
                                                  color: Colors.blue,
                                                ),
                                                border: InputBorder.none,
                                                fillColor: Colors.white,
                                                filled: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white)),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white)),
                                                errorBorder: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    borderSide: BorderSide(
                                                        color: Colors.white)),
                                                hintText: 'Add Zoom Link',
                                                hintStyle: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.67),
                                                    fontFamily: 'Meta1'),
                                              ),
                                            )
                                          : Meet == 'Phone call'
                                              ? TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  controller: _call,
                                                  onChanged: (value) {},
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please enter Phone No';
                                                    }
                                                    return null;
                                                  },
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.67),
                                                      fontFamily: 'Meta1'),
                                                  decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                    ),
                                                    border: InputBorder.none,
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                    hintText: 'Add Phone No',
                                                    hintStyle: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.67),
                                                        fontFamily: 'Meta1'),
                                                  ),
                                                )
                                              : Container(),
                                  SizedBox(height: 2.h),

                                  Text(
                                    'Comment :',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'sofi',
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                  SizedBox(height: 1.h),
                                  TextFormField(
                                    maxLines: 5,
                                    controller: _desc,
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter Comment';
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
                                      hintText: 'Comment (Optional)',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.67),
                                          fontFamily: 'Meta1'),
                                    ),
                                  ),
                                  SizedBox(height: 3.h),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                                'Request Meeting',
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
      data['meeting_description'] = _desc.text.toString();
      data['meeting_title'] = _meeting.text.toString();
      data['start_date'] = _start.text.toString();
      data['time'] =
          category == "Choose Time" ? _time.text.toString() : "10am to 07pm";
      data['time_type'] = category == "Choose Time" ? '1' : '2';
      data['place_type'] = Meet == "In person"
          ? "1"
          : Meet == "Zoom"
              ? "2"
              : "3";
      data['place_name'] = Meet == "In person"
          ? "1"
          : Meet == "Zoom"
              ? "2"
              : "3";
      data['place_data'] = Meet == "In person"
          ? ""
          : Meet == "Zoom"
              ? _zoom.text.toString()
              : _call.text.toString();

      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          taskprovider().addmeetingapi(data).then((response) async {
            addmeetingmodal =
                AddmeetingModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && addmeetingmodal?.status == "1") {
              print("api done");
              _title.text = "";
              _desc.text = "";
              _start.text = "";
              _time.text = "";
              _meeting.text = "";
              meetingap();
              Get.back();
            } else {
              print("api error");
            }
          });
        } else {
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    }
  }

  addmeetttttingdialog() {
    showModalBottomSheet(
      backgroundColor: Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Container(
                // width: 80.w,
                // height: 70.h,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                    child: SingleChildScrollView(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Text(
                              "Meeting Detail",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'sofi',
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  height: 0.17.h,
                                  letterSpacing: 1),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            children: [
                              Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                "State Date : ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'sofi',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    height: 0.17.h,
                                    letterSpacing: 1),
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                viewmeetinmodal?.data?.startTime == "" ||
                                        viewmeetinmodal?.data?.startTime == null
                                    ? "N/A"
                                    : viewmeetinmodal?.data?.startTime ?? "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'sofi',
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.bold,
                                    height: 0.17.h,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.description,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    "Description : ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: 'sofi',
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        height: 0.17.h,
                                        letterSpacing: 1),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                viewmeetinmodal?.data?.taskDesc == "" ||
                                        viewmeetinmodal?.data?.taskDesc == null
                                    ? "N/A"
                                    : viewmeetinmodal?.data?.taskDesc ?? "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'sofi',
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.bold,
                                    height: 0.17.h,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                "Start Time : ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'sofi',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    height: 0.17.h,
                                    letterSpacing: 1),
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                viewmeetinmodal?.data?.endTime == "" ||
                                        viewmeetinmodal?.data?.endTime == null
                                    ? "N/A"
                                    : viewmeetinmodal?.data?.endTime ?? "",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'sofi',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    height: 0.17.h,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          Row(
                            children: [
                              Icon(
                                Icons.info,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                "Status : ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'sofi',
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.bold,
                                    height: 0.17.h,
                                    letterSpacing: 1),
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                viewmeetinmodal?.data?.isCompleted == "0"
                                    ? "Pending"
                                    : "Completed",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'sofi',
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.bold,
                                    height: 0.17.h,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.5.h),
                        ],
                      ),
                    ))),
            Positioned(
                top: 1.1.h,
                right: 0,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(CupertinoIcons.clear_circled_solid)))
          ],
        );
      },
    );
  }

  viewmeetingapi(String value) {
    final Map<String, String> data = {};
    data['meeting_id'] = value.toString();

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().viewmeetingapi(data).then((response) async {
          viewmeetinmodal =
              ViewMeetinModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && viewmeetinmodal?.status == 1) {
            print("done api");
            setState(() {});
          } else {
            buildErrorDialog(
                context, " Error", (viewmeetinmodal?.message ?? "").toString());
            setState(() {});
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
