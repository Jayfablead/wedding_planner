import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import '../widgets/headerwidget.dart';

class EventSpace extends StatefulWidget {
  const EventSpace({super.key});

  @override
  State<EventSpace> createState() => _EventSpaceState();
}

final GlobalKey<ScaffoldState> scaffoldKey27 = GlobalKey<ScaffoldState>();
final controller = PageController(viewportFraction: 0.8, keepPage: true);
List HotelIm = [
  'https://i0.wp.com/decorsutrablog.com/wp-content/uploads/2020/06/DecorSutra_Wedding-Decor-9_Royal-Decor.jpg?fit=780%2C425&ssl=1',
  'https://i.pinimg.com/originals/2f/10/f6/2f10f6363ce6fd2461cec2bd46dbc916.jpg',
  'https://fancdesigns.com/wp-content/uploads/2016/08/royal-decorations-40-royal-wedding-decorations-2246-x-1162-1.jpg',
  'https://i0.wp.com/eventertainments.com/blog/wp-content/uploads/2021/03/Best-Wedding-Stage-Decoration-with-Flowers.jpg?fit=1200%2C900&ssl=1',
  'https://cdn0.weddingwire.in/vendor/8241/3_2/960/jpg/img-20180903-wa0013_15_158241.jpeg',
  'https://www.dreamzkraft.com/admin/blog-images/big/decoration-for-wedding/wedding-decoration%E2%80%93royal-2.jpg',
];
int ind = 0;

class _EventSpaceState extends State<EventSpace> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      ind = 0;
    });
    // venueap();
    // floordetelisapiwedding();
  }

  // bool isLoading = true;
  CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      key: scaffoldKey27,
      drawer: drawer1(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Center(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 6.h,
                    ),
                    header(
                        text: "Event Spaces",
                        callback1: () {
                          scaffoldKey27.currentState?.openDrawer();
                        }),
                    SizedBox(height: 1.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 1.5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 90.w,
                                    height: 10.h,
                                    padding: EdgeInsets.only(left: 2.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(3.w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: Colors.blue),
                                          child: Icon(
                                            CupertinoIcons.person,
                                            color: Colors.white,
                                            size: 18.sp,
                                          ),
                                        ),
                                        SizedBox(width: 5.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Venue Owner Name : ',
                                              style: TextStyle(
                                                  fontSize: 17.sp,
                                                  color: Colors.blue,
                                                  fontFamily: 'sofi',
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 0.5.h),
                                            SizedBox(
                                              width: 45.w,
                                              child: Text(
                                                "Ram Mer",
                                                // venuedetail?.venueDetails
                                                //     ?.name ==
                                                //     '' ||
                                                //     venuedetail
                                                //         ?.venueDetails
                                                //         ?.name ==
                                                //         null
                                                //     ? 'N/A'
                                                //     : venuedetail
                                                //     ?.venueDetails
                                                //     ?.name ??
                                                //     "",
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: Colors.black
                                                        .withOpacity(0.8),
                                                    fontFamily: 'sofi',
                                                    letterSpacing: 1,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 1.5.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 90.w,
                                        height: 10.h,
                                        padding: EdgeInsets.only(left: 2.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(3.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: Colors.blue),
                                              child: Icon(
                                                CupertinoIcons.info,
                                                color: Colors.white,
                                                size: 18.sp,
                                              ),
                                            ),
                                            SizedBox(width: 5.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Venue Name : ',
                                                  style: TextStyle(
                                                      fontSize: 17.sp,
                                                      color: Colors.blue,
                                                      fontFamily: 'sofi',
                                                      letterSpacing: 1,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 0.5.h),
                                                SizedBox(
                                                  width: 52.w,
                                                  child: Text(
                                                    "Tea",
                                                    // venuedetail?.venueDetails?.moreInfo
                                                    //     ?.vName ==
                                                    //     '' ||
                                                    //     venuedetail
                                                    //         ?.venueDetails
                                                    //         ?.moreInfo
                                                    //         ?.vName ==
                                                    //         null
                                                    //     ? 'N/A'
                                                    //     : venuedetail
                                                    //     ?.venueDetails
                                                    //     ?.moreInfo
                                                    //     ?.vName ??
                                                    //     "",
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        color: Colors.black
                                                            .withOpacity(0.8),
                                                        fontFamily: 'sofi',
                                                        letterSpacing: 1,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 7.h,
                                              width: 14.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl:
                                                      "https://images.ctfassets.net/e8bhhtr91vp3/2yfGTWADTN0JmoAeJLFOCb/f17368a0bd0c9271b293919681d88113/hero2_how_to_green_tea-jpg.webp?w=800&q=100",
                                                  // venuedetail
                                                  //     ?.venueDetails
                                                  //     ?.profile ??
                                                  //     "",
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                              progress) =>
                                                          CircularProgressIndicator(),
                                                  errorWidget:
                                                      (context, url, error) =>
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
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 1.5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 90.w,
                                height: 10.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(3.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: Colors.blue),
                                      child: Icon(
                                        CupertinoIcons.mail,
                                        color: Colors.white,
                                        size: 18.sp,
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Venue Email : ',
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              color: Colors.blue,
                                              fontFamily: 'sofi',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 0.5.h),
                                        SizedBox(
                                          width: 67.w,
                                          child: Text(
                                            "jay@gmail.com",
                                            // venuedetail?.venueDetails
                                            //     ?.email ==
                                            //     '' ||
                                            //     venuedetail
                                            //         ?.venueDetails
                                            //         ?.email ==
                                            //         null
                                            //     ? 'N/A'
                                            //     : venuedetail
                                            //     ?.venueDetails
                                            //     ?.email ??
                                            //     "",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                                fontFamily: 'sofi',
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 90.w,
                                height: 10.h,
                                padding: EdgeInsets.only(left: 2.15.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(3.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: Colors.blue),
                                      child: Icon(
                                        CupertinoIcons.phone,
                                        color: Colors.white,
                                        size: 18.sp,
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Contact : ',
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              color: Colors.blue,
                                              fontFamily: 'sofi',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 0.5.h),
                                        Text(
                                          "9724824359",
                                          // venuedetail?.venueDetails
                                          //     ?.contact ==
                                          //     '' ||
                                          //     venuedetail
                                          //         ?.venueDetails
                                          //         ?.contact ==
                                          //         null
                                          //     ? 'N/A'
                                          //     : venuedetail
                                          //     ?.venueDetails
                                          //     ?.contact ??
                                          //     "",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              fontFamily: 'sofi',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 90.w,
                                height: 10.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(3.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(7),
                                          color: Colors.blue),
                                      child: Icon(
                                        CupertinoIcons.person_2,
                                        color: Colors.white,
                                        size: 18.sp,
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Capacity: ',
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              color: Colors.blue,
                                              fontFamily: 'sofi',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 0.5.h),
                                        SizedBox(
                                          width: 67.w,
                                          child: Text(
                                            "120 people",
                                            // venuedetail?.venueDetails
                                            //     ?.email ==
                                            //     '' ||
                                            //     venuedetail
                                            //         ?.venueDetails
                                            //         ?.email ==
                                            //         null
                                            //     ? 'N/A'
                                            //     : venuedetail
                                            //     ?.venueDetails
                                            //     ?.email ??
                                            //     "",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                                fontFamily: 'sofi',
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),SizedBox(height: 1.5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 90.w,
                                height: 10.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(3.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(7),
                                          color: Colors.blue),
                                      child: Icon(
                                        Icons.hail,
                                        color: Colors.white,
                                        size: 18.sp,
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Fixed furniture: ',
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              color: Colors.blue,
                                              fontFamily: 'sofi',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 0.5.h),
                                        SizedBox(
                                          width: 67.w,
                                          child: Text(
                                            "120 people",
                                            // venuedetail?.venueDetails
                                            //     ?.email ==
                                            //     '' ||
                                            //     venuedetail
                                            //         ?.venueDetails
                                            //         ?.email ==
                                            //         null
                                            //     ? 'N/A'
                                            //     : venuedetail
                                            //     ?.venueDetails
                                            //     ?.email ??
                                            //     "",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                                fontFamily: 'sofi',
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.5.h),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text("Floor Plans : ",
                            style: TextStyle(
                                fontSize: 17.sp,
                                color: Colors.blue,
                                fontFamily: 'sofi',
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(height: 1.h),
                    for (int index = 0; index < 2; index++) ...[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        padding: EdgeInsets.all(2.w),
                        height: 13.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 1.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(900),
                                    ),
                                    height: 14.w,
                                    width: 14.w,
                                    // padding: EdgeInsets.all(1.w),
                                    child: Image.asset(
                                        fit: BoxFit.cover,
                                        'assets/pdficon.png')),
                                SizedBox(
                                  width: 2.w,
                                ),
                                SizedBox(
                                  width: 60.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Table",
                                        // 0
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: 'pop',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                      SizedBox(height: 0.5.h),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              // Get.to(
                                              // PdfView(
                                              // link: viewtopic
                                              //     ?.data
                                              //     ?.topic
                                              //     ?.topicFile?[index],
                                              // )
                                              // );
                                            },
                                            child: Text(
                                              'View File',
                                              textAlign: TextAlign.start,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontFamily: 'pop',
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.sp,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              // final String?
                                              // url =
                                              // viewtopic
                                              //     ?.data
                                              //     ?.topic
                                              //     ?.topicFile?[index];
                                              // String
                                              // fileExtension =
                                              // path.extension(
                                              // url!);
                                              // if (fileExtension ==
                                              // ".txt") {
                                              // Navigator.push(
                                              // context,
                                              // MaterialPageRoute(
                                              // builder:
                                              // (context) {
                                              // return webview(
                                              // data: viewtopic
                                              //     ?.data
                                              //     ?.topic
                                              //     ?.topicFile?[index],
                                              // );
                                              // },
                                              // ));
                                              // } else {
                                              // EasyLoading.show(
                                              // status: 'Downloading ..',
                                              // indicator: CircularProgressIndicator(
                                              // color:
                                              // Colors.white,
                                              // ));
                                              // const downloadsFolderPath =
                                              // '/storage/emulated/0/Download';
                                              // var request = await httpClient.getUrl(Uri.parse((viewtopic
                                              //     ?.data
                                              //     ?.topic
                                              //     ?.topicFile?[index])
                                              //     .toString()));
                                              // var response =
                                              // await request
                                              //     .close();
                                              // var bytes =
                                              // await consolidateHttpClientResponseBytes(
                                              // response);
                                              // String fileName = url
                                              //     .toString()
                                              //     .split(
                                              // '/')
                                              //     .last;
                                              //
                                              // Directory dir = Platform
                                              //     .isAndroid
                                              // ? Directory(
                                              // downloadsFolderPath)
                                              //     : await getApplicationDocumentsDirectory();
                                              // final String
                                              // filePath =
                                              // '${dir.path}/${fileName}${fileName.endsWith('.pdf') ? '' : '.pdf'}';
                                              // final File
                                              // file =
                                              // File(
                                              // filePath);
                                              // await file
                                              //     .writeAsBytes(
                                              // bytes);
                                              // EasyLoading
                                              //     .showSuccess(
                                              // "Downloaded");
                                              // print(file);
                                              // Fluttertoast.showToast(
                                              // msg:
                                              // 'file downloaded to : ${dir.path}',
                                              // toastLength:
                                              // Toast
                                              //     .LENGTH_SHORT,
                                              // timeInSecForIosWeb:
                                              // 1,
                                              // backgroundColor:
                                              // primary,
                                              // textColor:
                                              // Colors
                                              //     .white,
                                              // fontSize:
                                              // 13.sp);
                                              // }
                                            },
                                            child: Text(
                                              'Download',
                                              textAlign: TextAlign.start,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontFamily: 'pop',
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.sp,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 3.h),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
