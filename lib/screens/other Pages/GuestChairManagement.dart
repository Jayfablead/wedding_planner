import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class ChairManagement extends StatefulWidget {
  const ChairManagement({super.key});

  @override
  State<ChairManagement> createState() => _ChairManagementState();
}

class cate {
  String? image;
  String? hname;
  String? name;
  String? roomno;
  String? person;

  cate(
    this.image,
    this.hname,
    this.name,
    this.roomno,
    this.person,
  );
}

class cate1 {
  bool? isocu;

  cate1(
    this.isocu,
  );
}

List seat = [
  false,
  true,
  false,
  false,
  true,
  true,
  true,
  true,
  false,
  false,
  true,
  false,
  false,
  false,
  true,
  false,
  false,
  true,
  false,
  true,
];

List<cate> room = [
  cate(
      'https://static01.nyt.com/images/2019/03/24/travel/24trending-shophotels1/24trending-shophotels1-jumbo.jpg?quality=75&auto=webp',
      'Hotel 4 Kings',
      'Mr.Karam Mer',
      '111',
      '2'),
  cate(
      'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg',
      'Hotel 4 Kings',
      'Mr.Hari M.',
      '102',
      '4'),
  cate(
      'https://img.freepik.com/premium-photo/luxury-interior-design-bedroom-pool-villa_41487-28.jpg?w=826',
      'Hotel 4 Kings',
      'Mr.Tejas poter',
      '106',
      '2'),
  cate(
      'https://img.freepik.com/free-photo/modern-studio-apartment-design-with-bedroom-living-space_1262-12375.jpg?w=826&t=st=1693901111~exp=1693901711~hmac=5789ceb2f26a983c2ea4886be9f710d1df4974ee16d9e962dfb80c69724499f7',
      'Hotel 4 Kings',
      'Mr.Aron finch',
      '092',
      '6'),
  cate(
      'https://img.freepik.com/free-photo/luxury-bedroom-suite-resort-high-rise-hotel-with-working-table_105762-1783.jpg?size=626&ext=jpg&ga=GA1.1.1162323827.1691047344&semt=ais',
      'Hotel 4 Kings',
      'Mr.Khan',
      '018',
      '4'),
  cate(
      'https://assets-global.website-files.com/5c6d6c45eaa55f57c6367749/628d35d6b9575f5b35b4231a_Twin%20Hotel%20Room%20(1)%20(1).jpg',
      'Hotel 4 Kings',
      'Mr.Kingsman',
      '001',
      '6'),
];
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
TextEditingController _search = TextEditingController();

class _ChairManagementState extends State<ChairManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(),
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          // padding: const EdgeInsets.all(8.0),
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Center(
            child: Column(
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
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                        )),
                    Text(
                      "Sitting Arrangement",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          scaffoldKey.currentState?.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu_rounded,
                        ))
                  ],
                ),
                SizedBox(height: 1.5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://www.happywedding.app/blog/wp-content/uploads/2022/02/Wedding-Venues-in-Washington-State.jpg',
                        height: 10.5.h,
                        width: 22.w,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    SizedBox(
                      width: 55.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 0.5.h),
                          Text(
                            'Garden Sitting',
                            style: TextStyle(
                                fontSize: 19.sp,
                                fontFamily: 'sofi',
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            'TVC Company',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'sofi',
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Divider(color: Colors.black, thickness: 0.5),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    Icon(Icons.event_seat_outlined),
                    SizedBox(width: 2.w),
                    Text(
                      'Seats :',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'sofi',
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Column(
                  children: [
                    for (int index = 0; index < 10; index++) ...[
                      Column(
                        children: [
                          index == 0
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    index == 0
                                        ? Text("Vip Row",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily: 'sofi',
                                                letterSpacing: 1.5,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.pink))
                                        : Container(),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        for (int index1 = 0;
                                            index1 < 6;
                                            index1++) ...[
                                          GestureDetector(
                                            onTap: () {
                                              index1 == 2 ||
                                                      index1 == 5 ||
                                                      index1 == 3
                                                  ? seatdialog(context, "Vip",
                                                      "3", "Ram Mer")
                                                  : "";
                                            },
                                            child: Container(
                                              height: 7.w,
                                              width: 7.w,
                                              margin: EdgeInsets.only(
                                                  right: 3.w, bottom: 1.h),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                // border: Border.all(color: Colors.pink)
                                              ),
                                              child: Icon(
                                                Icons.event_seat,
                                                color: index1 == 2 ||
                                                        index1 == 5 ||
                                                        index1 == 3
                                                    ? Colors.pink
                                                    : Colors.grey,
                                                size: 24.sp,
                                              ),
                                            ),
                                          )
                                        ]
                                      ],
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    (index == 1)
                                        ? Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 0.7.h),
                                            child: Text("Guest Row",
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontFamily: 'sofi',
                                                    letterSpacing: 1.5,
                                                    color: Colors.pink,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )
                                        : (index == 3)
                                            ? Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 0.7.h),
                                                child: Text(
                                                  "Common Row",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 1.5,
                                                      color: Colors.pink,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                            : Container(),
                                    SizedBox(
                                      height: 0.7.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        for (int index1 = 0;
                                            index1 < 9;
                                            index1++) ...[
                                          GestureDetector(
                                            onTap: () {
                                              index == 1
                                                  ? index1 == 1 ||
                                                          index1 == 3 ||
                                                          index1 == 4 ||
                                                          index1 == 5 ||
                                                          index1 == 7 ||
                                                          index1 == 8
                                                      ? seatdialog(
                                                          context,
                                                          "Guest",
                                                          "45",
                                                          "Roronoa")
                                                      : ""
                                                  : index == 5
                                                      ? index1 == 3 ||
                                                              index1 == 4 ||
                                                              index1 == 5
                                                          ? seatdialog(
                                                              context,
                                                              "Common",
                                                              "45",
                                                              "Roronoa")
                                                          : ""
                                                      : index == 7
                                                          ? index1 == 1 ||
                                                                  index1 == 2 ||
                                                                  index1 == 3
                                                              ? seatdialog(
                                                                  context,
                                                                  "Common",
                                                                  "45",
                                                                  "Roronoa")
                                                              : ""
                                                          : index == 8
                                                              ? index1 == 3 ||
                                                                      index1 ==
                                                                          4 ||
                                                                      index1 ==
                                                                          5
                                                                  ? seatdialog(
                                                                      context,
                                                                      "Common",
                                                                      "45",
                                                                      "Roronoa")
                                                                  : ""
                                                              : "";
                                            },
                                            child: Container(
                                              height: 7.w,
                                              width: 7.w,
                                              margin: EdgeInsets.only(
                                                  right: 3.w, bottom: 1.h),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                // border: Border.all(color: Colors.pink)
                                              ),
                                              child: Icon(Icons.event_seat,
                                                  size: 24.sp,
                                                  color: index == 1
                                                      ? index1 == 1 ||
                                                              index1 == 3 ||
                                                              index1 == 4 ||
                                                              index1 == 5 ||
                                                              index1 == 7 ||
                                                              index1 == 8
                                                          ? Colors.pink
                                                          : Colors.grey
                                                      : index == 5
                                                          ? index1 == 3 ||
                                                                  index1 == 4 ||
                                                                  index1 == 5
                                                              ? Colors.pink
                                                              : Colors.grey
                                                          : index == 7
                                                              ? index1 == 1 ||
                                                                      index1 ==
                                                                          2 ||
                                                                      index1 ==
                                                                          3
                                                                  ? Colors.pink
                                                                  : Colors.grey
                                                              : index == 8
                                                                  ? index1 == 3 ||
                                                                          index1 ==
                                                                              4 ||
                                                                          index1 ==
                                                                              5
                                                                      ? Colors
                                                                          .pink
                                                                      : Colors
                                                                          .grey
                                                                  : Colors
                                                                      .grey),
                                            ),
                                          )
                                        ]
                                      ],
                                    ),
                                  ],
                                )
                        ],
                      )
                    ]
                  ],
                ),
                SizedBox(height: 2.h),
                Text(
                  "Seat Information",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'sofi',
                      letterSpacing: 1.5,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 1.5.h),
                Padding(
                  padding: EdgeInsets.only(left: 2.5.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 7.w,
                            width: 7.w,
                            margin: EdgeInsets.only(right: 3.w, bottom: 1.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(color: Colors.pink)
                            ),
                            child: Icon(Icons.event_seat,
                                size: 24.sp, color: Colors.grey),
                          ),
                          Text(
                            "Available",
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'sofi',
                                letterSpacing: 1.5,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 7.w,
                            width: 7.w,
                            margin: EdgeInsets.only(right: 3.w, bottom: 1.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.event_seat,
                                size: 24.sp, color: Colors.pink),
                          ),
                          Text(
                            "Selected",
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'sofi',
                                letterSpacing: 1.5,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      width: 94.w,
      height: 6.5.h,
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        right: 3.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            // Color of the shadow
            offset: Offset(0, 2.5),
            // Offset of the shadow (x, y)
            blurRadius: 4, // Spread of the shadow
            // How much the shadow extends
          ),
        ],
      ),
      child: TextField(
        cursorColor: Colors.black,
        controller: _search,
        onChanged: (value) {},
        style: TextStyle(
          fontSize: 15.sp,
          letterSpacing: 1,
          fontFamily: 'Sofi',
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: Colors.black,
          ),
          focusedBorder: InputBorder.none,
          // Remove border when focused
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: 'Search',
          contentPadding: EdgeInsets.only(top: 1.7.h),
          hintStyle: TextStyle(
            fontSize: 15.sp,
            letterSpacing: 1,
            fontFamily: 'Sofi',
            fontWeight: FontWeight.w700,
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }

  seatdialog(
      BuildContext context, String title, String contant, String contant1,
      {VoidCallback? callback, String? buttonname}) {
    Widget okButton = GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.0),
          // color: primary
        ),
        child: Center(
          child: Text(buttonname ?? 'OK',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'sofi',
                letterSpacing: 1,
                decorationColor: Colors.black,
              )),
        ),
      ),
      onTap: () {
        // if (callback == null) {
        Get.back();
        // } else {

        // }
      },
    );

    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: Colors.transparent,
            child: Stack(
              children: [
                Container(
                  width: 73.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title.toString() + ' Row',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.pink,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                decorationColor: Colors.black,
                                fontFamily: 'sofi',
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                        child: Row(
                          children: [
                            Icon(Icons.person_outline_rounded, size: 20.sp),
                            SizedBox(width: 1.w),
                            Text(
                              "Name : ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decorationColor: Colors.black,
                                fontFamily: 'sofi',
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              contant1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decorationColor: Colors.black,
                                fontFamily: 'sofi',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Row(
                          children: [
                            Icon(Icons.chair_outlined),
                            SizedBox(width: 2.w),
                            Text(
                              "Seat no : ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decorationColor: Colors.black,
                                fontFamily: 'sofi',
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              contant,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decorationColor: Colors.black,
                                fontFamily: 'sofi',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h),
                    ],
                  ),
                ),
                Positioned(
                  right: 0.w,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(900),
                      ),
                      padding: EdgeInsets.all(2.w),
                      child: Icon(Icons.close),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );
    }
    if (Platform.isIOS) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: Colors.transparent,
            child: Container(
              width: 73.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Row(
                      children: [
                        Text(
                          title + ' Row',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decorationColor: Colors.black,
                            fontFamily: 'sofi',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Row(
                      children: [
                        Text(
                          "Seat no : ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decorationColor: Colors.black,
                            fontFamily: 'sofi',
                          ),
                        ),
                        Text(
                          contant,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decorationColor: Colors.black,
                            fontFamily: 'sofi',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Row(
                      children: [
                        Text(
                          "Name : ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decorationColor: Colors.black,
                            fontFamily: 'sofi',
                          ),
                        ),
                        Text(
                          contant1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decorationColor: Colors.black,
                            fontFamily: 'sofi',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          );
        },
      );
      // CupertinoAlertDialog cupertinoAlertDialog = CupertinoAlertDialog(
      //   title: Text(title,
      //       style: TextStyle(
      //           color: Colors.black,
      //           decorationColor: Colors.black,
      //           fontFamily: 'sofi')),
      //   content: Text(contant,
      //       style: const TextStyle(
      //           color: Colors.black,
      //           decorationColor: Colors.black,
      //           fontFamily: 'sofi')),
      //   actions: [
      //     okButton,
      //   ],
      // );
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return cupertinoAlertDialog;
      //   },
      // );
    }
    // show the dialog
  }
}
