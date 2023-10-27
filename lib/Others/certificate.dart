import 'dart:convert';
import 'dart:io';
import 'package:wedding_planner/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/DocumentModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

class Certificate extends StatefulWidget {
  const Certificate({super.key});

  @override
  State<Certificate> createState() => _CertificateState();
}



class cate {
  String? image;
  String? name;
  double? Rating;
  String? desc;

  cate(
    this.image,
    this.name,
    this.desc,
    this.Rating,
  );
}
final GlobalKey<ScaffoldState> scaffoldKey15 = GlobalKey<ScaffoldState>();
List<cate> venue = [
  cate(
      'https://i.pinimg.com/originals/c5/25/55/c525556bdc809edf44944171ec3d54c7.jpg',
      'Dining',
      'A Big Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sitting',
      3),
  cate(
      'https://dypdvfcjkqkg2.cloudfront.net/large/5181614-9225.png',
      'Garden Sitting',
      'Sitting Arrangement in Garden with chairs and sitting arrangement with mandap and shadi ki chize',
      4),
  cate(
      'https://img.freepik.com/premium-vector/logistics-logo-icon-vector-template_644408-364.jpg',
      'Simple Walkaway',
      'A Simple Red Carpet Walking Arena',
      3),
  cate(
      'https://image.shutterstock.com/image-photo/image-260nw-1487440595.jpg',
      'Engagement',
      'An Arrangements for Engagement An Arrangements for Engagement An Arrangements for Engagement ',
      5),
  cate(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4YbKLFy8I8cYMpoV0p60zldXyMv3Q0IYXBQ&usqp=CAU',
      'Royal Decor',
      'A Royal Decoration venue A Royal Decoration venue A Royal Decoration venue A Royal Decoration venue ',
      3),
  cate(
      'https://i.pinimg.com/originals/c5/25/55/c525556bdc809edf44944171ec3d54c7.jpg',
      'Dining',
      'A Big Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sitting',
      3),
  cate(
      'https://dypdvfcjkqkg2.cloudfront.net/large/5181614-9225.png',
      'Garden Sitting',
      'Sitting Arrangement in Garden with chairs and sitting arrangement with mandap and shadi ki chize',
      4),
  cate(
      'https://img.freepik.com/premium-vector/logistics-logo-icon-vector-template_644408-364.jpg',
      'Simple Walkaway',
      'A Simple Red Carpet Walking Arena',
      3),
  cate(
      'https://image.shutterstock.com/image-photo/image-260nw-1487440595.jpg',
      'Engagement',
      'An Arrangements for Engagement An Arrangements for Engagement An Arrangements for Engagement ',
      5),
  cate(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4YbKLFy8I8cYMpoV0p60zldXyMv3Q0IYXBQ&usqp=CAU',
      'Royal Decor',
      'A Royal Decoration venue A Royal Decoration venue A Royal Decoration venue A Royal Decoration venue ',
      3),
];
TextEditingController _search = TextEditingController();

class _CertificateState extends State<Certificate> {
  static var httpClient = new HttpClient();
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    certificateapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      drawer: drawer1(),
      key: scaffoldKey15,
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            children: [
              Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     IconButton(
                      //         onPressed: () {
                      //           Get.back();
                      //         },
                      //         icon: Icon(
                      //           Icons.arrow_back_ios_new_rounded,
                      //           size: 23.sp,
                      //           color: Colors.blue,
                      //         )),
                      //     Text(
                      //       "Certificates",
                      //       style: TextStyle(
                      //         fontSize: 18.sp,
                      //         fontFamily: 'sofi',
                      //         letterSpacing: 1,
                      //         color: Colors.blue,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //     IconButton(
                      //         onPressed: () {
                      //           scaffoldKey.currentState?.openDrawer();
                      //         },
                      //         icon: Icon(
                      //           Icons.menu_rounded,
                      //           color: Colors.blue,
                      //           size: 23.sp,
                      //         ))
                      //   ],
                      // ),
                      header(
                          text: "Certificates",
                          callback1: () {
                            scaffoldKey15.currentState?.openDrawer();
                          }),
                      // headerwid(text: "Certificates"),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          searchBox1(),
                        ],
                      ),
                      SizedBox(height: 2.h),
                    ]),
              ),
              documentmodal?.data?.allDocandCerti?.length == 0
                  ? Container(
                      height: 70.h,
                      alignment: Alignment.center,
                      child: Center(
                        child: Text("No Certificates available",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontFamily: 'sofi',
                                color: Colors.black)),
                      ),
                    )
                  :
          Column(
                      children: [
                        for (int index = 0;
                            index <
                                (documentmodal?.data?.allDocandCerti?.length ??
                                    0);
                            index++) ...[
                          Container(
                              height: 19.h,
                              padding: EdgeInsets.all(1.w),
                              margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 1.w),
                                    height: 14.h,
                                    width: 29.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.black38)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: documentmodal
                                                ?.data
                                                ?.allDocandCerti?[index]
                                                .profile ??
                                            "",
                                        progressIndicatorBuilder:
                                            (context, url, progress) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          'assets/user.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 54.w,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 1.w),
                                          child: Text(
                                            'Supplier ${index + 1}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.5.sp,
                                                fontFamily: "sofi",
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 1.h),
                                      Container(
                                        padding: EdgeInsets.only(left: 1.w),
                                        width: 55.w,
                                        child: Text(
                                          documentmodal
                                                          ?.data
                                                          ?.allDocandCerti?[
                                                              index]
                                                          .name ==
                                                      "" ||
                                                  documentmodal
                                                          ?.data
                                                          ?.allDocandCerti?[
                                                              index]
                                                          .name ==
                                                      null
                                              ? "N/A"
                                              : documentmodal
                                                      ?.data
                                                      ?.allDocandCerti?[index]
                                                      .name ??
                                                  "",
                                          maxLines: 2,
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 15.sp,
                                              fontFamily: "sofi",
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      InkWell(
                                        onTap: () async {
                                          EasyLoading.show(
                                              status: 'Downloading ..',
                                              indicator:
                                                  CircularProgressIndicator(
                                                color: Colors.white,
                                              ));
                                          const downloadsFolderPath =
                                              '/storage/emulated/0/Download';
                                          var request = await httpClient.getUrl(
                                              Uri.parse(documentmodal
                                                      ?.data
                                                      ?.allDocandCerti?[index]
                                                      .docFile ??
                                                  ""));
                                          var response = await request.close();
                                          var bytes =
                                              await consolidateHttpClientResponseBytes(
                                                  response);

                                          Directory dir = Platform.isAndroid
                                              ? Directory(downloadsFolderPath)
                                              : await getApplicationDocumentsDirectory();
                                          final String filePath =
                                              '${dir.path}/${documentmodal?.data?.allDocandCerti?[index].name}';
                                          final File file = File(filePath);
                                          await file.writeAsBytes(bytes);
                                          EasyLoading.showSuccess("Downloaded");
                                          print(file);
                                        },
                                        child: Container(
                                          width: 45.w,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 1.5.h),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 3.w),
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(90)),
                                          child: Text(
                                            'Download',
                                            style: TextStyle(
                                                fontSize: 11.sp,
                                                color: Colors.white,
                                                fontFamily: 'sofi',
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                        ]
                      ],
                    )
            ],
          )),
    );
  }

  Widget searchBox1() {
    return Container(
      alignment: Alignment.center,
      width: 90.w,
      height: 6.5.h,
      padding: EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(65),
      ),
      child: TextField(
        controller: _search,
        onChanged: (value) {},
        style:
            TextStyle(color: Colors.black, fontSize: 13.sp, fontFamily: 'get'),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black.withOpacity(0.65),
            size: 25,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 35,
            minWidth: 40,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.65), fontFamily: 'get'),
        ),
      ),
    );
  }

  certificateapi() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().documentapi().then((response) async {
          documentmodal = DocumentModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && documentmodal?.status == "1") {
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
