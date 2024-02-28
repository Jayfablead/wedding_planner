import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../Modal/SingalEventViewModal.dart';
import '../Provider/taskprovider.dart';
import '../widgets/buildErrorDialog.dart';
import '../widgets/const.dart';
import '../widgets/headerwidget.dart';
import '../widgets/pdfView.dart';
import '../widgets/webview.dart';

class EventSpace extends StatefulWidget {
  String? eventspaceid;

  EventSpace({super.key, this.eventspaceid});

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
  static var httpClient = new HttpClient();
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    singaleventview();
    setState(() {
      ind = 0;
      isLoading = true;
    });
  }

  // bool isLoading = true;
  CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
        key: scaffoldKey27,
        drawer: drawer1(),
        body: isLoading
            ? Container()
            : Padding(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                          BorderRadius.circular(
                                                              7),
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
                                                      'Event Space Name : ',
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
                                                      width: 45.w,
                                                      child: Text(
                                                        singaleventviewmodal
                                                                        ?.eventSpaceName ==
                                                                    "" ||
                                                                singaleventviewmodal
                                                                        ?.eventSpaceName ==
                                                                    null
                                                            ? "N/A"
                                                            : singaleventviewmodal
                                                                    ?.eventSpaceName ??
                                                                "",
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.8),
                                                            fontFamily: 'sofi',
                                                            letterSpacing: 1,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                  SizedBox(height: 1.5.h),
                                  Row(
                                    children: [
                                      Text("Capacity : ",
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              color: Colors.blue,
                                              fontFamily: 'sofi',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                  for (int index = 0;
                                      index <
                                          (singaleventviewmodal
                                                  ?.capacity?.length ??
                                              0);
                                      index++) ...[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2.w),
                                          margin: EdgeInsets.symmetric(
                                              vertical: 0.5.h),
                                          width: 90.w,
                                          height: 10.h,
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
                                                        BorderRadius.circular(
                                                            7),
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
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Name :- ',
                                                        style: TextStyle(
                                                            fontSize: 17.sp,
                                                            color: Colors.blue,
                                                            fontFamily: 'sofi',
                                                            letterSpacing: 1,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        singaleventviewmodal
                                                                        ?.capacity?[
                                                                            index]
                                                                        .capacityName ==
                                                                    "" ||
                                                                singaleventviewmodal
                                                                        ?.capacity?[
                                                                            index]
                                                                        .capacityName ==
                                                                    null
                                                            ? "N/A"
                                                            : singaleventviewmodal
                                                                    ?.capacity?[
                                                                        index]
                                                                    .capacityName ??
                                                                "",
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.8),
                                                            fontFamily: 'sofi',
                                                            letterSpacing: 1,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 0.5.h),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Capacity :- ',
                                                        style: TextStyle(
                                                            fontSize: 17.sp,
                                                            color: Colors.blue,
                                                            fontFamily: 'sofi',
                                                            letterSpacing: 1,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        singaleventviewmodal
                                                                        ?.capacity?[
                                                                            index]
                                                                        .capacity ==
                                                                    "" ||
                                                                singaleventviewmodal
                                                                        ?.capacity?[
                                                                            index]
                                                                        .capacity ==
                                                                    null
                                                            ? "N/A"
                                                            : singaleventviewmodal
                                                                    ?.capacity?[
                                                                        index]
                                                                    .capacity ??
                                                                "",
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.8),
                                                            fontFamily: 'sofi',
                                                            letterSpacing: 1,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                  SizedBox(height: 1.5.h),
                                  Row(
                                    children: [
                                      Text("Fixed furniture :- ",
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              color: Colors.blue,
                                              fontFamily: 'sofi',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  for (int index = 0;
                                      index <
                                          (singaleventviewmodal
                                                  ?.fixedFurniture?.length ??
                                              0);
                                      index++) ...[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2.w),
                                          margin: EdgeInsets.symmetric(
                                              vertical: 0.5.h),
                                          width: 90.w,
                                          height: 10.h,
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
                                                        BorderRadius.circular(
                                                            7),
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
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Name :- ',
                                                        style: TextStyle(
                                                            fontSize: 17.sp,
                                                            color: Colors.blue,
                                                            fontFamily: 'sofi',
                                                            letterSpacing: 1,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        singaleventviewmodal
                                                                        ?.fixedFurniture?[
                                                                            index]
                                                                        .itemName ==
                                                                    "" ||
                                                                singaleventviewmodal
                                                                        ?.fixedFurniture?[
                                                                            index]
                                                                        .itemName ==
                                                                    null
                                                            ? "N/A"
                                                            : singaleventviewmodal
                                                                    ?.fixedFurniture?[
                                                                        index]
                                                                    .itemName ??
                                                                "",
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.8),
                                                            fontFamily: 'sofi',
                                                            letterSpacing: 1,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 0.5.h),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'ItemDetails :- ',
                                                        style: TextStyle(
                                                            fontSize: 17.sp,
                                                            color: Colors.blue,
                                                            fontFamily: 'sofi',
                                                            letterSpacing: 1,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        width: 25.w,
                                                        child: Text(
                                                          singaleventviewmodal
                                                                          ?.fixedFurniture?[
                                                                              index]
                                                                          .itemDetails ==
                                                                      "" ||
                                                                  singaleventviewmodal
                                                                          ?.fixedFurniture?[
                                                                              index]
                                                                          .itemDetails ==
                                                                      null
                                                              ? "N/A"
                                                              : singaleventviewmodal
                                                                      ?.fixedFurniture?[
                                                                          index]
                                                                      .itemDetails ??
                                                                  "",
                                                          style: TextStyle(
                                                              fontSize: 15.sp,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.8),
                                                              fontFamily:
                                                                  'sofi',
                                                              letterSpacing: 1,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
                            for (int index = 0;
                                index <
                                    (singaleventviewmodal?.docFile?.length ??
                                        0);
                                index++) ...[
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 1.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(900),
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
                                                (singaleventviewmodal?.docFile?[index])
                                                    .toString().split('/').last,
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(PdfView(
                                                        link: singaleventviewmodal
                                                                    ?.docFile?[
                                                                index] ??
                                                            '',
                                                      ));
                                                      print(singaleventviewmodal?.docFile);
                                                    },
                                                    child: Text(
                                                      'View File',
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                        fontFamily: 'pop',
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13.sp,
                                                        letterSpacing: 1,
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      String url =
                                                          singaleventviewmodal
                                                                      ?.docFile?[
                                                                  index] ??
                                                              '';
                                                      String fileExtension =
                                                          path.extension(
                                                              (singaleventviewmodal
                                                                      ?.docFile)
                                                                  .toString());
                                                      if (fileExtension ==
                                                          ".txt") {
                                                        Navigator.push(context,
                                                            MaterialPageRoute(
                                                          builder: (context) {
                                                            return webview(
                                                              data: url,
                                                            );
                                                          },
                                                        ));
                                                      } else {
                                                        EasyLoading.show(
                                                            status:
                                                                'Downloading ..',
                                                            indicator:
                                                                CircularProgressIndicator(
                                                              color:
                                                                  Colors.white,
                                                            ));
                                                        const downloadsFolderPath =
                                                            '/storage/emulated/0/Download';
                                                        var request =
                                                            await httpClient.getUrl(
                                                                Uri.parse(url
                                                                    .toString()));
                                                        var response =
                                                            await request
                                                                .close();
                                                        var bytes =
                                                            await consolidateHttpClientResponseBytes(
                                                                response);
                                                        String fileName = url
                                                            .toString()
                                                            .split('/')
                                                            .last;

                                                        Directory dir = Platform
                                                                .isAndroid
                                                            ? Directory(
                                                                downloadsFolderPath)
                                                            : await getApplicationDocumentsDirectory();
                                                        final String filePath =
                                                            '${dir.path}/${fileName}${fileName.endsWith('.pdf') ? '' : '.pdf'}';
                                                        final File file =
                                                            File(filePath);
                                                        await file.writeAsBytes(
                                                            bytes);
                                                        EasyLoading.showSuccess(
                                                            "Downloaded");
                                                        print(file);
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                'file downloaded to : ${dir.path}',
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            timeInSecForIosWeb:
                                                                1,
                                                            backgroundColor:
                                                                Colors.blue,
                                                            textColor:
                                                                Colors.white,
                                                            fontSize: 13.sp);
                                                      }
                                                    },
                                                    child: Text(
                                                      'Download',
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                        fontFamily: 'pop',
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.bold,
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
      ),
    );
  }

  singaleventview() {
    final Map<String, String> data = {};
    data['bride_groom_id'] = (userData?.user?.id).toString();
    data['event_space_id'] = widget.eventspaceid.toString();

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().singaleventspaceapi(data).then((response) async {
          singaleventviewmodal =
              SingalEventViewModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200) {
            print("done api");
            setState(() {
              isLoading = false;
            });
          } else {
            buildErrorDialog(context, " Error",
                (viewAlleventspacemodal?.message ?? "").toString());
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
