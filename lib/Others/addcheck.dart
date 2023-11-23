import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/addchecklistmodal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';

import 'Check List.dart';

class addchecklist extends StatefulWidget {
  const addchecklist({super.key});

  @override
  State<addchecklist> createState() => _addchecklistState();
}

class _addchecklistState extends State<addchecklist> {
  TextEditingController _title = TextEditingController();
  TextEditingController _desc = TextEditingController();
  TextEditingController _cate = TextEditingController();
  TextEditingController _start = TextEditingController();
  TextEditingController _date = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
          // height: 70.h,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 3.h),
                      Center(
                        child: Text(
                          'Add Your CheckList',
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
                          prefixIcon: Icon(Icons.note_add),
                          border: InputBorder.none,
                          fillColor: Colors.grey.withOpacity(0.12),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          hintText: 'Title',
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.67),
                              fontFamily: 'Meta1'),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Start Date :',
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
                            firstDate: DateTime(2000),
                            // The first date that can be selected
                            lastDate: DateTime(
                                2101), // The last date that can be selected
                          );

                          if (picked != null) {
                            setState(() {
                              print(picked);
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(picked);
                              _start.text = formattedDate
                                  .toString(); // Store the selected date in a variable
                            });
                          }
                        },
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.67),
                            fontFamily: 'Meta1'),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.calendar_month),
                          border: InputBorder.none,
                          fillColor: Colors.grey.withOpacity(0.12),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          hintText: 'Start date',
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.67),
                              fontFamily: 'Meta1'),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'End Date :',
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
                        controller: _date,
                        onChanged: (value) {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter check end date';
                          }
                          return null;
                        },
                        onTap: () async {
                          DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            // Initial date, can be the current date or a specific date
                            firstDate: DateTime(2000),
                            // The first date that can be selected
                            lastDate: DateTime(
                                2101), // The last date that can be selected
                          );

                          if (picked != null) {
                            setState(() {
                              print(picked);
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(picked);
                              _date.text = formattedDate
                                  .toString(); // Store the selected date in a variable
                            });
                          }
                        },
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.67),
                            fontFamily: 'Meta1'),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.calendar_month),
                          border: InputBorder.none,
                          fillColor: Colors.grey.withOpacity(0.12),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          hintText: 'End date',
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
                              addcheckap();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(2.5.w),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                    'Add Check List',
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
    );
  }

  addcheckap() {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['title'] = _title.text.trim().toString();
      data['description'] = 'Done';
      data['category'] = 'Success';
      data['start_time'] = _start.text.trim().toString();
      data['end_time'] = _date.text.trim().toString();
      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          taskprovider().addchecklistapi(data).then((response) async {
            addchecklistmodal =
                AddchecklistModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 &&
                addchecklistmodal?.status == "1") {
              print("fffd");
              Get.off(Check_list());
            } else {
              buildErrorDialog(
                  context, " Error", (addchecklistmodal?.message).toString());
            }
          });
        } else {
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    }
  }
}
