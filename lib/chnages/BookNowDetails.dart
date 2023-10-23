import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/pages2/BookingSuccessfulPage.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

class BookNowDetails extends StatefulWidget {
  const BookNowDetails({super.key});

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

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeinput1.text = "";
    timeinput2.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      key: scaffoldKey,
      drawer: drawer1(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
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
                    scaffoldKey.currentState?.openDrawer();
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 0.5.w),
                          height: 15.h,
                          width: 31.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: CachedNetworkImage(
                              // fit: BoxFit.cover,
                              imageUrl:
                                  'https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg',
                              fit: BoxFit.cover,
                              progressIndicatorBuilder: (context, url,
                                      progress) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Image.asset(
                                'assets/deprf.png',
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              overflow: TextOverflow.ellipsis,
                              'Service Name ',
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      'Haresh Mangukiya ',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 13.sp,
                                          fontFamily: 'sofi',
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "haresh.fablead@gmail.com",
                                  maxLines: 2,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.black.withOpacity(0.7),
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
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                             'Parker & Julia' ,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19.sp,
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  color: Colors.black),
                            ),
                            SizedBox(height: 1.5.h),
                            Text(

                                  "Parker@gmail.com",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  fontSize: 17.sp,
                                  color: Colors.black.withOpacity(0.75)),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 1.w),
                          height: 8.5.h,
                          width: 19.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(90),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:
                              'https://riss-photography.com/wp-content/uploads/2022/01/Wollongong-City-Beach-Wedding-2.jpg',
                              progressIndicatorBuilder: (context, url,
                                  progress) =>
                                  Center(child: CircularProgressIndicator()),
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //       width: 90.w,
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Name",
                  //             style: TextStyle(
                  //                 fontSize: 14.sp,
                  //                 letterSpacing: 1,
                  //                 fontFamily: 'Sofi',
                  //                 fontWeight: FontWeight.w700,
                  //                 color: Colors.black),
                  //           ),
                  //           SizedBox(
                  //             height: 1.h,
                  //           ),
                  //           TextFormField(
                  //             controller: loction1,
                  //             decoration: InputDecoration(
                  //               hintText: "Bride & Groom Name",
                  //               hintStyle: TextStyle(
                  //                   color: Colors.black.withOpacity(0.6),
                  //                   fontSize: 14.sp,
                  //                   fontFamily: "sofi"),
                  //               prefixIcon: Icon(
                  //                 Icons.person,
                  //                 size: 18.sp,
                  //                 color: Colors.blue,
                  //               ),
                  //               filled: true,
                  //               fillColor: Colors.white,
                  //               enabledBorder: OutlineInputBorder(
                  //                   borderRadius: BorderRadius.circular(30),
                  //                   borderSide:
                  //                       BorderSide(color: Colors.white)),
                  //               disabledBorder: OutlineInputBorder(
                  //                   borderRadius: BorderRadius.circular(30),
                  //                   borderSide:
                  //                       BorderSide(color: Colors.white)),
                  //               focusedBorder: OutlineInputBorder(
                  //                   borderRadius: BorderRadius.circular(30),
                  //                   borderSide:
                  //                       BorderSide(color: Colors.white)),
                  //               border: OutlineInputBorder(
                  //                   borderRadius: BorderRadius.circular(30),
                  //                   borderSide:
                  //                       BorderSide(color: Colors.white)),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 3.h,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //       width: 90.w,
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Email",
                  //             style: TextStyle(
                  //                 fontSize: 14.sp,
                  //                 letterSpacing: 1,
                  //                 fontFamily: 'Sofi',
                  //                 fontWeight: FontWeight.w700,
                  //                 color: Colors.black),
                  //           ),
                  //           SizedBox(
                  //             height: 1.h,
                  //           ),
                  //           TextFormField(
                  //             controller: loction2,
                  //             decoration: InputDecoration(
                  //               hintText: "Bride & Groom Email",
                  //               hintStyle: TextStyle(
                  //                   color: Colors.black.withOpacity(0.6),
                  //                   fontSize: 14.sp,
                  //                   fontFamily: "sofi"),
                  //               prefixIcon: Icon(
                  //                 Icons.email,
                  //                 size: 18.sp,
                  //                 color: Colors.blue,
                  //               ),
                  //               filled: true,
                  //               fillColor: Colors.white,
                  //               enabledBorder: OutlineInputBorder(
                  //                   borderRadius: BorderRadius.circular(30),
                  //                   borderSide:
                  //                       BorderSide(color: Colors.white)),
                  //               disabledBorder: OutlineInputBorder(
                  //                   borderRadius: BorderRadius.circular(30),
                  //                   borderSide:
                  //                       BorderSide(color: Colors.white)),
                  //               focusedBorder: OutlineInputBorder(
                  //                   borderRadius: BorderRadius.circular(30),
                  //                   borderSide:
                  //                       BorderSide(color: Colors.white)),
                  //               border: OutlineInputBorder(
                  //                   borderRadius: BorderRadius.circular(30),
                  //                   borderSide:
                  //                       BorderSide(color: Colors.white)),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(children: [ Text(
                    "Starting Cost : ",
                    style: TextStyle(
                        fontSize: 18.sp,
                        letterSpacing: 1,
                        fontFamily: 'Sofi',
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ), SizedBox(width: 5.w),Text(
                    "\$ 1,50,000",
                    style: TextStyle(
                        fontSize: 18.sp,
                        letterSpacing: 1,
                        fontFamily: 'Sofi',
                        fontWeight: FontWeight.w700,
                        color: Colors.black.withOpacity(0.7)),
                  ),],),

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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.date_range,
                                  color: Colors.blue,
                                  size: 20.sp,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                hintText: 'Date',
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 14.sp,
                                    fontFamily: "sofi"),
                              ),
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              keyboardType: TextInputType.emailAddress,
                              controller: timeinput1,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.timer_outlined,
                                  color: Colors.blue,
                                  size: 19.sp,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                hintText: 'Time',
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
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
                        TextFormField(maxLines: 5,
                          controller: loction2,
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
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                BorderSide(color: Colors.white)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                BorderSide(color: Colors.white)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
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
                    Get.offAll(BookingSuccessfulPage());
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
              ), SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
