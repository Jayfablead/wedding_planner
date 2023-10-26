import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/main.dart';
import 'package:wedding_planner/Modal/QuoteListModal.dart';
import 'package:wedding_planner/Modal/SearchQuotationModal.dart';
import 'package:wedding_planner/Quatations/quotedetailpage.dart';
import 'package:wedding_planner/Suppliers/SupplierDetailsPage.dart';

import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../Provider/taskprovider.dart';
import '../widgets/buildErrorDialog.dart';
import '../widgets/const.dart';

class QuoateList2 extends StatefulWidget {
  const QuoateList2({super.key});

  @override
  State<QuoateList2> createState() => _QuoateList2State();
}

TextEditingController _search = TextEditingController();

class chat {
  String? image;
  String? name;
  String? type;
  String? date;
  String? details;

  chat(
      this.image,
      this.name,
      this.type,
      this.date,
      this.details,
      );
}

List<chat> mesgs = [
  chat(
      'https://e1.pxfuel.com/desktop-wallpaper/238/852/desktop-wallpaper-masque-luffy-smiling-luffy-smile-thumbnail.jpg',
      'Luffy',
      'Flower Decor',
      '22-08-2023',
      'A decorations full of Flowers with dif dif flowers'),
  chat(
      'https://static.wikia.nocookie.net/fictionalfighters/images/4/48/Sanji.png/revision/latest?cb=20150406032640',
      'Sanji',
      'Cake Decor',
      '20-03-2024',
      'A decorations for Cake as You want.'),
  chat(
      'https://w0.peakpx.com/wallpaper/311/533/HD-wallpaper-one-piece-nico-robin-one-piece-two-years-later.jpg',
      'Robin',
      'Chair Decor',
      '17-05-2023',
      'A decorations of chair like arrangements , sitting types etc'),
  chat(
      'https://i.pinimg.com/736x/59/e3/d2/59e3d2fb93af21511690470abc014831.jpg',
      'Nami',
      'Room Decor',
      '15-09-2024',
      'A decorations for your room special as like you'),
  chat(
      'https://i.pinimg.com/236x/23/62/50/236250f1055a352c4a0cd5e0a21aaf33.jpg',
      'Chopper',
      'Garden Decor',
      '12-10-2024',
      'A decorations of your garden'),
  chat(
      'https://w0.peakpx.com/wallpaper/311/533/HD-wallpaper-one-piece-nico-robin-one-piece-two-years-later.jpg',
      'Robin',
      'Chair Decor',
      '17-05-2023',
      'A decorations of chair like arrangements , sitting types etc'),
  chat(
      'https://i.pinimg.com/736x/59/e3/d2/59e3d2fb93af21511690470abc014831.jpg',
      'Nami',
      'Room Decor',
      '15-09-2024',
      'A decorations for your room special as like you'),
  chat(
      'https://i.pinimg.com/236x/23/62/50/236250f1055a352c4a0cd5e0a21aaf33.jpg',
      'Chopper',
      'Garden Decor',
      '12-10-2024',
      'A decorations of your garden'),
];
int sel1 = 1;
bool isLoad = true;

class _QuoateList2State extends State<QuoateList2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoad = true;
      sel1 = 1;
    });
    QuoteListAp();
  }

  TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoad,
      scaffold: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        drawer: drawer1(),
        key: scaffoldKey,
        body: isLoad
            ? Container()
            : SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),

                header(
                    text: "Quotation List",
                    callback1: () {
                      scaffoldKey.currentState?.openDrawer();
                    }),
                // headerwid(text: "Quotation List"),
                SizedBox(height: 1.h),
                searchBox1(),
                SizedBox(height: 2.h),

                _search.text == ''
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          sel1 = 1;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.5.h, horizontal: 5.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: sel1 == 1
                                ? Colors.blue
                                : Colors.white,
                            borderRadius:
                            BorderRadius.circular(25)),
                        margin:
                        EdgeInsets.symmetric(horizontal: 2.w),
                        child: Text('Requested',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'sofi',
                                color: sel1 == 1
                                    ? Colors.white
                                    : Colors.blue,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          sel1 = 2;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.5.h, horizontal: 5.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: sel1 == 2
                                ? Colors.blue
                                : Colors.white,
                            borderRadius:
                            BorderRadius.circular(25)),
                        margin:
                        EdgeInsets.symmetric(horizontal: 2.w),
                        child: Text('Responses',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'sofi',
                                color: sel1 == 2
                                    ? Colors.white
                                    : Colors.blue,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1)),
                      ),
                    ),
                  ],
                )
                    : Container(),
                SizedBox(height: 1.h),
                _search.text == ''
                    ? SizedBox(
                  height: 72.h,
                  child: sel1 == 1
                      ? quotelistmodal?.all?.requested?.length ==
                      0 ||
                      quotelistmodal
                          ?.all?.requested?.length ==
                          null
                      ? Center(
                    child: Text(
                      'No Requests Sended',
                      style: TextStyle(
                          fontFamily: 'sofi',
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                          letterSpacing: 1),
                    ),
                  )
                      : ListView.builder(
                    itemCount: quotelistmodal
                        ?.all?.requested?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: 1.h, bottom: 1.h),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  // Color of the shadow
                                  offset: Offset(0, 1.5),
                                  // Offset of the shadow (x, y)
                                  blurRadius:
                                  8, // Spread of the shadow
                                  // How much the shadow extends
                                ),
                              ],
                              borderRadius:
                              BorderRadius.circular(
                                  10)),
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                EdgeInsets.symmetric(
                                    horizontal: 1.w),
                                height: 8.h,
                                width: 17.w,
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius
                                      .circular(90),
                                  child:
                                  CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: quotelistmodal
                                        ?.all
                                        ?.requested?[
                                    index]
                                        .profile ??
                                        '',
                                    progressIndicatorBuilder:
                                        (context, url,
                                        progress) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context,
                                        url, error) =>
                                        Image.asset(
                                          'assets/user.png',
                                          color: Colors.black,
                                        ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
                                children: [
                                  Container(
                                    width: 68.w,
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          quotelistmodal?.all?.requested?[index].categoryName ==
                                              '' ||
                                              quotelistmodal?.all?.requested?[index].categoryName ==
                                                  null
                                              ? 'N/A'
                                              : quotelistmodal
                                              ?.all
                                              ?.requested?[index]
                                              .categoryName ??
                                              '',
                                          style: TextStyle(
                                              fontSize:
                                              17.sp,
                                              fontWeight:
                                              FontWeight
                                                  .bold,
                                              letterSpacing:
                                              1,
                                              fontFamily:
                                              'sofi',
                                              color: Colors
                                                  .black),
                                        ),
                                        Text(
                                          quotelistmodal?.all?.requested?[index].createdAt ==
                                              '' ||
                                              quotelistmodal?.all?.requested?[index].createdAt ==
                                                  null
                                              ? 'N/A'
                                              : quotelistmodal
                                              ?.all
                                              ?.requested?[index]
                                              .createdAt ??
                                              '',
                                          style: TextStyle(
                                              fontSize:
                                              11.sp,
                                              fontWeight:
                                              FontWeight
                                                  .bold,
                                              fontFamily:
                                              'sofi',
                                              color: Colors
                                                  .black
                                                  .withOpacity(
                                                  0.5)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 0.8.h),
                                  SizedBox(
                                    width: 66.w,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 65.w,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text(
                                                quotelistmodal?.all?.requested?[index].name == '' ||
                                                    quotelistmodal?.all?.requested?[index].name ==
                                                        null
                                                    ? 'N/A'
                                                    : quotelistmodal?.all?.requested?[index].name ??
                                                    '',
                                                maxLines:
                                                2,
                                                style:
                                                TextStyle(
                                                  fontSize:
                                                  14.sp,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontFamily:
                                                  'sofi',
                                                  color: Colors
                                                      .black
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                              SizedBox(
                                                  height:
                                                  0.8.h),
                                              Text(
                                                quotelistmodal?.all?.requested?[index].description == '' ||
                                                    quotelistmodal?.all?.requested?[index].description ==
                                                        null
                                                    ? 'N/A'
                                                    : quotelistmodal?.all?.requested?[index].description ??
                                                    '',
                                                overflow:
                                                TextOverflow
                                                    .ellipsis,
                                                maxLines:
                                                1,
                                                style:
                                                TextStyle(
                                                  fontSize:
                                                  13.sp,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontFamily:
                                                  'sofi',
                                                  color: Colors
                                                      .black
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    padding: EdgeInsets.zero,
                  )
                      : quotelistmodal?.all?.responsed?.length ==
                      0 ||
                      quotelistmodal
                          ?.all?.responsed?.length ==
                          null
                      ? Center(
                    child: Text(
                      'No Responses got',
                      style: TextStyle(
                          fontFamily: 'sofi',
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                          letterSpacing: 1),
                    ),
                  )
                      : ListView.builder(
                    itemCount: quotelistmodal
                        ?.all?.responsed?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: 1.h, bottom: 1.h),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  // Color of the shadow
                                  offset: Offset(0, 1.5),
                                  // Offset of the shadow (x, y)
                                  blurRadius:
                                  8, // Spread of the shadow
                                  // How much the shadow extends
                                ),
                              ],
                              borderRadius:
                              BorderRadius.circular(
                                  10)),
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                EdgeInsets.symmetric(
                                    horizontal: 1.w),
                                height: 8.h,
                                width: 17.w,
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius
                                      .circular(90),
                                  child:
                                  CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: quotelistmodal
                                        ?.all
                                        ?.responsed?[
                                    index]
                                        .profile ??
                                        '',
                                    progressIndicatorBuilder:
                                        (context, url,
                                        progress) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context,
                                        url, error) =>
                                        Image.asset(
                                          'assets/user.png',
                                          color: Colors.black,
                                        ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
                                children: [
                                  Container(
                                    width: 68.w,
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          quotelistmodal?.all?.responsed?[index].categoryName ==
                                              '' ||
                                              quotelistmodal?.all?.responsed?[index].categoryName ==
                                                  null
                                              ? 'N/A'
                                              : quotelistmodal
                                              ?.all
                                              ?.responsed?[index]
                                              .categoryName ??
                                              '',
                                          style: TextStyle(
                                              fontSize:
                                              17.sp,
                                              fontWeight:
                                              FontWeight
                                                  .bold,
                                              letterSpacing:
                                              1,
                                              fontFamily:
                                              'sofi',
                                              color: Colors
                                                  .black),
                                        ),
                                        Text(
                                          quotelistmodal?.all?.responsed?[index].createdAt ==
                                              '' ||
                                              quotelistmodal?.all?.responsed?[index].createdAt ==
                                                  null
                                              ? 'N/A'
                                              : quotelistmodal
                                              ?.all
                                              ?.responsed?[index]
                                              .createdAt ??
                                              '',
                                          style: TextStyle(
                                              fontSize:
                                              11.sp,
                                              fontWeight:
                                              FontWeight
                                                  .bold,
                                              fontFamily:
                                              'sofi',
                                              color: Colors
                                                  .black
                                                  .withOpacity(
                                                  0.5)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 0.8.h),
                                  SizedBox(
                                    width: 66.w,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 52.w,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text(
                                                quotelistmodal?.all?.responsed?[index].name == '' ||
                                                    quotelistmodal?.all?.responsed?[index].name ==
                                                        null
                                                    ? 'N/A'
                                                    : quotelistmodal?.all?.responsed?[index].name ??
                                                    '',
                                                maxLines:
                                                2,
                                                style:
                                                TextStyle(
                                                  fontSize:
                                                  14.sp,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontFamily:
                                                  'sofi',
                                                  color: Colors
                                                      .black
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                              SizedBox(
                                                  height:
                                                  0.8.h),
                                              Text(
                                                quotelistmodal?.all?.responsed?[index].description == '' ||
                                                    quotelistmodal?.all?.responsed?[index].description ==
                                                        null
                                                    ? 'N/A'
                                                    : quotelistmodal?.all?.responsed?[index].description ??
                                                    '',
                                                overflow:
                                                TextOverflow
                                                    .ellipsis,
                                                maxLines:
                                                1,
                                                style:
                                                TextStyle(
                                                  fontSize:
                                                  13.sp,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontFamily:
                                                  'sofi',
                                                  color: Colors
                                                      .black
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            print(
                                                'right');
                                            Get.to(
                                                quotedetailpage(
                                                  Qid: quotelistmodal
                                                      ?.all
                                                      ?.responsed?[
                                                  index]
                                                      .quotationId,
                                                ));
                                          },
                                          child:
                                          Container(
                                            padding:
                                            EdgeInsets
                                                .all(2
                                                .w),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    7),
                                                color: Colors
                                                    .blue),
                                            child: Icon(
                                              CupertinoIcons
                                                  .arrow_right,
                                              color: Colors
                                                  .white,
                                              size: 18.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    padding: EdgeInsets.zero,
                  ),
                ):Container(),
                _search.text != ""? searchquotationmodal?.status =="0"

                    ? Container(
                  height: 72.h,
                  child: Center(
                    child: Text(
                      'No Data Available',
                      style: TextStyle(
                          fontFamily: 'sofi',
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                          letterSpacing: 1),
                    ),
                  ),
                )
                    : Container(
                  height: 72.h,
                  child: ListView.builder(
                    itemCount: searchquotationmodal
                        ?.all?.responsed?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            top: 1.h, bottom: 1.h),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  // Color of the shadow
                                  offset: Offset(0, 1.5),
                                  // Offset of the shadow (x, y)
                                  blurRadius:
                                  8, // Spread of the shadow
                                  // How much the shadow extends
                                ),
                              ],
                              borderRadius:
                              BorderRadius.circular(10)),
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 1.w),
                                height: 8.h,
                                width: 17.w,
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(90),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl:
                                    searchquotationmodal
                                        ?.all
                                        ?.responsed?[
                                    index]
                                        .profile ??
                                        '',
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
                              SizedBox(
                                width: 4.w,
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 68.w,
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          searchquotationmodal
                                              ?.all
                                              ?.responsed?[
                                          index]
                                              .categoryName ==
                                              '' ||
                                              searchquotationmodal
                                                  ?.all
                                                  ?.responsed?[
                                              index]
                                                  .categoryName ==
                                                  null
                                              ? 'N/A'
                                              : searchquotationmodal
                                              ?.all
                                              ?.responsed?[
                                          index]
                                              .categoryName ??
                                              '',
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              fontWeight:
                                              FontWeight
                                                  .bold,
                                              letterSpacing: 1,
                                              fontFamily:
                                              'sofi',
                                              color:
                                              Colors.black),
                                        ),
                                        Text(
                                          searchquotationmodal
                                              ?.all
                                              ?.responsed?[
                                          index]
                                              .createdAt ==
                                              '' ||
                                              searchquotationmodal
                                                  ?.all
                                                  ?.responsed?[
                                              index]
                                                  .createdAt ==
                                                  null
                                              ? 'N/A'
                                              : searchquotationmodal
                                              ?.all
                                              ?.responsed?[
                                          index]
                                              .createdAt ??
                                              '',
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              fontWeight:
                                              FontWeight
                                                  .bold,
                                              fontFamily:
                                              'sofi',
                                              color: Colors
                                                  .black
                                                  .withOpacity(
                                                  0.5)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 0.8.h),
                                  SizedBox(
                                    width: 66.w,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 65.w,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text(
                                                searchquotationmodal?.all?.responsed?[index].name ==
                                                    '' ||
                                                    searchquotationmodal?.all?.responsed?[index].name ==
                                                        null
                                                    ? 'N/A'
                                                    : searchquotationmodal
                                                    ?.all
                                                    ?.responsed?[index]
                                                    .name ??
                                                    '',
                                                maxLines: 2,
                                                style:
                                                TextStyle(
                                                  fontSize:
                                                  14.sp,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,
                                                  fontFamily:
                                                  'sofi',
                                                  color: Colors
                                                      .black
                                                      .withOpacity(
                                                      0.7),
                                                ),
                                              ),
                                              SizedBox(
                                                  height:
                                                  0.8.h),
                                              Text(
                                                searchquotationmodal?.all?.responsed?[index].description ==
                                                    '' ||
                                                    searchquotationmodal?.all?.responsed?[index].description ==
                                                        null
                                                    ? 'N/A'
                                                    : searchquotationmodal
                                                    ?.all
                                                    ?.responsed?[index]
                                                    .description ??
                                                    '',
                                                overflow:
                                                TextOverflow
                                                    .ellipsis,
                                                maxLines: 1,
                                                style:
                                                TextStyle(
                                                  fontSize:
                                                  13.sp,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,
                                                  fontFamily:
                                                  'sofi',
                                                  color: Colors
                                                      .black
                                                      .withOpacity(
                                                      0.5),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    padding: EdgeInsets.zero,
                  ),
                ):Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget searchBox() {
  //   return Container(
  //     width: 95.w,
  //     height: 6.5.h,
  //     alignment: Alignment.center,
  //     padding: EdgeInsets.only(
  //       right: 3.w,
  //     ),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(10),
  //       border: Border.all(color: Colors.grey.shade300),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black26,
  //           // Color of the shadow
  //           offset: Offset(0, 2.5),
  //           // Offset of the shadow (x, y)
  //           blurRadius: 4, // Spread of the shadow
  //           // How much the shadow extends
  //         ),
  //       ],
  //     ),
  //     child: TextField(
  //       cursorColor: Colors.black,
  //       controller: _search,
  //       onChanged: (value) {
  //         // chatserch(_search.text.trim().toString());
  //       },
  //       style: TextStyle(
  //         fontSize: 15.sp,
  //         letterSpacing: 1,
  //         fontFamily: 'Sofi',
  //         fontWeight: FontWeight.w700,
  //         color: Colors.black87,
  //       ),
  //       decoration: InputDecoration(
  //         prefixIcon: Icon(
  //           CupertinoIcons.search,
  //           color: Colors.black,
  //         ),
  //         focusedBorder: InputBorder.none,
  //         // Remove border when focused
  //         enabledBorder: InputBorder.none,
  //         disabledBorder: InputBorder.none,
  //         hintText: 'Search',
  //         contentPadding: EdgeInsets.only(top: 1.7.h),
  //         hintStyle: TextStyle(
  //           fontSize: 15.sp,
  //           letterSpacing: 1,
  //           fontFamily: 'Sofi',
  //           fontWeight: FontWeight.w700,
  //           color: Colors.grey.shade500,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget searchBox1() {
    return Container(
      alignment: Alignment.center,
      width: 95.w,
      height: 6.5.h,
      padding: EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(65),
      ),
      child: TextField(
        controller: _search,
        onChanged: (value) {
          if (value.isNotEmpty) {
            searchquotation1(_search.text.trim().toString());
          }
        },
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

  QuoteListAp() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().QouteListApi().then((response) async {
          quotelistmodal = QuoteListModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && categoriesmodal?.status == "1") {
            print('done ');
            setState(() {
              isLoad = false;
            });
          } else {
            setState(() {
              isLoad = false;
            });
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
        setState(() {
          isLoad = false;
        });
      }
    });
  }

  searchquotation1(String value) {

    final Map<String, String> data = {};
    data['search'] = _search.text.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().searchquotationapi(data).then((response) async {
          searchquotationmodal =
              SearchQuotationModal.fromJson(json.decode(response.body));


          if (response.statusCode == 200 &&
              searchquotationmodal?.status == "1") {


            setState(() {
              searchquotationmodal;
            });

          } else {
            setState(() {
              searchquotationmodal;
            });
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
