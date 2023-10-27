import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/BooknowModal.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../Modal/UserProfileModal.dart';
import '../Provider/authprovider.dart';
import '../Provider/taskprovider.dart';
import '../widgets/buildErrorDialog.dart';
import '../widgets/const.dart';
import 'BookingSuccessfulPage.dart';

class BookNowDetails extends StatefulWidget {
  String? sid;
  String? cid;
  String? sername;
  String? name;
  String? email;
  String? photo;
  String? qid;

  BookNowDetails({
    super.key,
    this.cid,
    this.email,
    this.name,
    this.photo,
    this.sername,
    this.sid,
    this.qid,
  });

  @override
  State<BookNowDetails> createState() => _BookNowDetailsState();
}

class _BookNowDetailsState extends State<BookNowDetails> {
  TextEditingController loction1 = TextEditingController();
  TextEditingController loction2 = TextEditingController();
  TextEditingController _dateinput = TextEditingController();

  TimeOfDay _timeOfDay = TimeOfDay(hour: 8, minute: 30);
  TextEditingController timeinput1 = TextEditingController();
  TextEditingController timeinput2 = TextEditingController();
  TextEditingController _comment = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey5 = GlobalKey<ScaffoldState>();

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
        timeinput1.text = DateFormat.Hm().format(
          DateTime(2021, 1, 1, picked.hour, picked.minute),
        );
      });
    }
  }

  void timepicker1() async {
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
        timeinput2.text = DateFormat.Hm().format(
          DateTime(2021, 1, 1, picked.hour, picked.minute),
        );
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      print(
          '${widget.name} , ${widget.email}  , ${widget.sername} , ${widget.cid} , ${widget.sid} ');
      timeinput1.text = "";
      _dateinput.text = "";
      _comment.text = '';
    });
    userprofileap();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
        key: scaffoldKey5,
        drawer: drawer1(),
        body: isLoading
            ? Container()
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        header(
                            text: "Booking Details",
                            callback1: () {
                              scaffoldKey5.currentState?.openDrawer();
                            }),
                        // headerwid(text: "Booking Details"),
                        SizedBox(
                          height: 2.h,
                        ),

                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              height: 16.h,
                              padding: EdgeInsets.all(1.w),
                              margin: EdgeInsets.symmetric(horizontal: 1.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 0.5.w),
                                    height: 15.h,
                                    width: 31.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: CachedNetworkImage(
                                        // fit: BoxFit.cover,
                                        imageUrl: widget.photo.toString(),
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder:
                                            (context, url, progress) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          'assets/defimg.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        widget.sername.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontFamily: 'sofi',
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        // padding: EdgeInsets.only(left: 1.w),
                                        child: Container(
                                          width: 52.w,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                overflow: TextOverflow.ellipsis,
                                                widget.name.toString(),
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.7),
                                                    fontSize: 13.sp,
                                                    fontFamily: 'sofi',
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.email.toString(),
                                            maxLines: 2,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                fontSize: 13.sp,
                                                fontFamily: 'sofi',
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        userprofile?.userDetails?.groomName ==
                                                    '' ||
                                                userprofile?.userDetails
                                                        ?.groomName ==
                                                    null
                                            ? 'N/A'
                                            : "${userprofile?.userDetails?.groomName} & ${userprofile?.userDetails?.brideName} ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19.sp,
                                            fontFamily: 'sofi',
                                            letterSpacing: 1,
                                            color: Colors.black),
                                      ),
                                      SizedBox(height: 1.5.h),
                                      Text(
                                        userprofile?.userDetails?.groomName ==
                                                    '' ||
                                                userprofile?.userDetails
                                                        ?.groomName ==
                                                    null
                                            ? 'N/A'
                                            : "${userprofile?.userDetails?.email}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'sofi',
                                            letterSpacing: 1,
                                            fontSize: 17.sp,
                                            color:
                                                Colors.black.withOpacity(0.75)),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 1.w),
                                    height: 8.5.h,
                                    width: 19.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(90),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: userprofile
                                                ?.userDetails?.profileImg ??
                                            '',
                                        progressIndicatorBuilder:
                                            (context, url, progress) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          'assets/user.png',
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 45.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            letterSpacing: 1,
                                            fontFamily: 'Sofi',
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      TextFormField(
                                        controller: _dateinput,
                                        readOnly: true,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter the date";
                                          }
                                          return null;
                                        },
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.date_range,
                                            color: Colors.blue,
                                            size: 20.sp,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          hintText: 'Date',
                                          hintStyle: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              fontSize: 14.sp,
                                              fontFamily: "sofi"),
                                        ),
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime.now(),
                                                  //DateTime.now() - not to allow to choose before today.
                                                  lastDate: DateTime(2100));

                                          if (pickedDate != null) {
                                            print(
                                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                            String formattedDate =
                                                DateFormat('dd-MM-yyyy')
                                                    .format(pickedDate);
                                            print(
                                                formattedDate); //formatted date output using intl package =>  2021-03-16
                                            setState(() {
                                              _dateinput.text =
                                                  formattedDate; //set output date to TextField value.
                                            });
                                          } else {}
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Container(
                                  width: 45.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Time",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            letterSpacing: 1,
                                            fontFamily: 'Sofi',
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      TextFormField(
                                        readOnly: true,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller: timeinput1,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter the time";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.timer_outlined,
                                            color: Colors.blue,
                                            size: 19.sp,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          hintText: 'Time',
                                          hintStyle: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              fontSize: 14.sp,
                                              fontFamily: "sofi"),
                                        ),
                                        onTap: () async {
                                          timepicker();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 90.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Comment",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        letterSpacing: 1,
                                        fontFamily: 'Sofi',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  TextFormField(
                                    maxLines: 5,
                                    controller: _comment,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter the comment";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Tell About What you need",
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 14.sp,
                                          fontFamily: "sofi"),
                                      prefixIcon: Icon(
                                        Icons.info_outline_rounded,
                                        size: 18.sp,
                                        color: Colors.blue,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              SentReq();
                            },
                            child: Container(
                              height: 6.h,
                              width: 90.w,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(25.sp),
                              ),
                              child: Center(
                                  child: Text(
                                "Continue",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                    fontFamily: 'get'),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  SentReq() {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['q_id'] = widget.qid == '' ? '' : widget.qid.toString();
      data['s_id'] = widget.sid.toString();
      data['c_id'] = widget.cid.toString();
      data['date'] = _dateinput.text.trim().toString();
      data['time'] = timeinput1.text.trim().toString();
      data['comment'] = _comment == '' ? '' : _comment.text.trim().toString();
      checkInternet().then((internet) async {
        if (internet) {
          taskprovider().sentBookingReq(data).then((response) async {
            booknowmodal = BookNowModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && booknowmodal?.status == "1") {
              Get.to(BookingSuccessfulPage(
                bId: booknowmodal?.bID,
              ));
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
  }

  userprofileap() {
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().userprofileapi().then((response) async {
          userprofile = UserProfileModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && userprofile?.status == "1") {
            print(userprofile?.userDetails?.groomName);
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
}
