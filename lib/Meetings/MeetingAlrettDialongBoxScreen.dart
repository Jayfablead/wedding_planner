import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../Modal/ViewMeetinModal.dart';
import '../Provider/taskprovider.dart';
import '../widgets/buildErrorDialog.dart';
import '../widgets/const.dart';

class MeetingAlrettscreen extends StatefulWidget {
  String? meetingid;

  MeetingAlrettscreen({super.key, this.meetingid});

  @override
  State<MeetingAlrettscreen> createState() => _MeetingAlrettscreenState();
}

class _MeetingAlrettscreenState extends State<MeetingAlrettscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmeetingapi();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: addmeetingdialog(),
    );
  }

  addmeetingdialog() {
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
                                "Title : ",
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
                                "Abc",
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
                                "Descrpation",
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
                                "Start date : ",
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
                              Text('Date'),
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
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    height: 0.17.h,
                                    letterSpacing: 1),
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                "Pending",
                                // sel1 == 0
                                //     ? (checklistmodal
                                //     ?.all?[var1!].isCompleted) ==
                                //     '0'
                                //     ? 'Pending'
                                //     : 'Completed'
                                //     : sel1 == 1
                                //     ? (checklistmodal?.todayAlerts?[var1!]
                                //     .isCompleted) ==
                                //     '0'
                                //     ? 'Pending'
                                //     : 'Completed'
                                //     : sel1 == 2
                                //     ? (checklistmodal
                                //     ?.completed?[var1!]
                                //     .isCompleted) ==
                                //     '0'
                                //     ? 'Pending'
                                //     : 'Completed'
                                //     : (checklistmodal?.pending?[var1!]
                                //     .isCompleted) ==
                                //     '0'
                                //     ? 'Pending'
                                //     : 'Completed',
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

  viewmeetingapi() {
    final Map<String, String> data = {};
    data['meeting_id'] = widget.meetingid.toString();

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().viewalleventspaceapi(data).then((response) async {
          viewmeetinmodal =
              ViewMeetinModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              viewAlleventspacemodal?.status == true) {
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
