import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/pages2/BookingSuccessfulPage.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class BooKNowPage extends StatefulWidget {
  const BooKNowPage({super.key});

  @override
  State<BooKNowPage> createState() => _BooKNowPageState();
}

class _BooKNowPageState extends State<BooKNowPage> {
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: _scaffoldKey,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded)),
                  Text(
                    "Book Now",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'sofi',
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Icon(Icons.menu_rounded)),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),

              // Container(
              //     height: 17.h,
              //     padding: EdgeInsets.all(1.w),
              //     margin: EdgeInsets.symmetric(horizontal: 1.w),
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Container(
              //           decoration: BoxDecoration(
              //            borderRadius: BorderRadius.circular(10),
              //           ),
              //           margin:EdgeInsets.symmetric(horizontal: 0.5.w),
              //           height: 20.h,
              //           width: 34.w,
              //           child: ClipRRect(
              //             borderRadius: BorderRadius.circular(10),
              //             child: Padding(
              //               padding:  EdgeInsets.only(right: 1.w
              //               ),
              //               child: CachedNetworkImage(
              //                 imageUrl:
              //                 'https://cdn.pixabay.com/photo/2013/07/13/11/50/car-158795_640.png',
              //                 progressIndicatorBuilder:
              //                     (context, url, progress) => Center(
              //                     child:
              //                     CircularProgressIndicator()),
              //                 errorWidget: (context, url, error) =>
              //                     Image.asset(
              //                       'assets/deprf.png',
              //                     ),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           children: [
              //             SizedBox(
              //               width: 45.w,
              //               child: Text(
              //                 maxLines: 2,
              //                 overflow: TextOverflow.ellipsis,
              //                 'BMW 6 Series i4 Top Model..',
              //                 style: TextStyle(
              //                     color: Colors.black,
              //                     fontSize: 13.sp,
              //                     fontWeight: FontWeight.bold),
              //               ),
              //             ),
              //             SizedBox(height: 1.h),
              //             Container(
              //               width: 52.w,
              //               child: Row(
              //                 children:[
              //                   Row(
              //                     children: [
              //                       Icon(Icons.people_outline_rounded,color: Colors.pink,size: 17.sp,),
              //                       SizedBox(
              //                         width: 1.w,
              //                       ),
              //                       Text(
              //                         '2',
              //                         style: TextStyle(
              //                             color: Colors.black,
              //                             fontSize: 13.sp,
              //                             fontWeight: FontWeight.w600),
              //                       ),
              //                     ],
              //                   ),
              //                     SizedBox(
              //                       width: 11.w,
              //                     ),
              //                   Text(
              //                     "\$200/ Km",
              //                     style: TextStyle(
              //                         color:
              //                         Colors.black,
              //                         fontSize: 12.sp,
              //                         fontWeight: FontWeight.bold),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             SizedBox(height: 1.h),
              //           ],
              //         ),
              //       ],
              //     )
              // ),

              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    height: 16.h,
                    padding: EdgeInsets.all(1.w),
                    margin: EdgeInsets.symmetric(horizontal: 1.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 0.5.w),
                          height: 18.h,
                          width: 31.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              // fit: BoxFit.cover,
                              imageUrl:
                                  'https://www.transparentpng.com/thumb/car-png/car-free-transparent-png-8.png',
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 54.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 1.w),
                                    child: Container(
                                      width: 52.w,
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        'BMW 6 Series i4 Top Model.. ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 1.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.people_outline_rounded,
                                  color: Colors.pink,
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  '2',
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 1.w),
                                  child: Text(
                                    '\$ 200/ Km',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.h),
                            Row(
                              children: [
                                // Icon(
                                //   // Icons.location_on_outlined,size: 15.sp,
                                //   // color: Colors.black.withOpacity(0.8),
                                // ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                // Text(
                                //   'Surat',
                                //   style: TextStyle(
                                //       color:
                                //       Colors.black.withOpacity(0.8),
                                //       fontSize: 12.sp,
                                //       fontWeight: FontWeight.w600),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 5.w,
              ),
              SizedBox(
                width: 94.w,
                child: Row(
                  children: [
                    SizedBox(
                      width: 3.w,
                    ),
                    Container(
                      width: 85.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pick-Up",
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
                            controller: loction1,
                            decoration: InputDecoration(
                              hintText: "Surat,Gujarat",
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 14.sp,
                                  fontFamily: "sofi"),
                              suffixIcon: Icon(
                                Icons.location_on_sharp,
                                size: 18.sp,
                                color: Colors.pink,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.grey)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.grey)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.w,
              ),
              SizedBox(
                width: 94.w,
                child: Row(
                  children: [
                    SizedBox(
                      width: 3.w,
                    ),
                    Container(
                      width: 85.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Drop-Off",
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
                            controller: loction2,
                            decoration: InputDecoration(
                              hintText: "Kamrej",
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 14.sp,
                                  fontFamily: "sofi"),
                              suffixIcon: Icon(
                                Icons.location_on_sharp,
                                size: 18.sp,
                                color: Colors.pink,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.grey)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.grey)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.w,
              ),

              SizedBox(
                width: 94.w,
                child: Row(
                  children: [
                    SizedBox(
                      width: 3.w,
                    ),
                    Container(
                      width: 85.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pick-Up Date",
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
                                color: Colors.pink,
                                size: 20.sp,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.grey)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.grey)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.grey)),
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
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
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
                  ],
                ),
              ),
              SizedBox(
                height: 5.w,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 3.w,
                      ),
                      Container(
                        width: 41.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pick-Up Time",
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
                                  color: Colors.pink,
                                  size: 19.sp,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.grey)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.grey)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.grey)),
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
                      SizedBox(
                        width: 4.w,
                      ),
                      Container(
                        width: 41.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Drop-Off Time",
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
                              controller: timeinput2,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.timer_outlined,
                                  color: Colors.pink,
                                  size: 19.sp,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.grey)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.grey)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.grey)),
                                hintText: 'Time',
                                hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 14.sp,
                                    fontFamily: "sofi"),
                              ),
                              onTap: () async {
                                timepicker1();
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
                height: 5.h,
              ),

              Center(
                child: InkWell(
                  onTap: () {
                    Get.offAll(BookingSuccessfulPage());
                  },
                  child: Container(
                    height: 6.h,
                    width: 86.w,
                    decoration: BoxDecoration(
                      color: Colors.pink,
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
            ],
          ),
        ),
      ),
    );
  }
}
