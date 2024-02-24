import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/ReadnewmsgModal.dart';
import 'package:wedding_planner/Modal/SendThradModal.dart';
import 'package:wedding_planner/Modal/ThreadChatModal.dart';
import 'package:wedding_planner/Provider/authprovider.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/load.dart';
import 'package:wedding_planner/widgets/video.dart';
import 'package:wedding_planner/widgets/webview.dart';

import '../Modal/UserProfileModal.dart';

class ThreadPage extends StatefulWidget {
  String? img;
  String? name;
  String? id;

  ThreadPage({super.key, this.name, this.img, this.id});

  @override
  State<ThreadPage> createState() => _ThreadPageState();
}

class _ThreadPageState extends State<ThreadPage> {
  final ScrollController _scrollController = ScrollController();
  var outputDate2 = "";
  var outputDate1;
  String? date2 = "";
  String? data1;
  int? diff;
  int? type;
  Timer? _timer;
  static var httpClient = new HttpClient();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
    });
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      fullchatap();
    });
  }

  int? days;

  Future<void> Counter() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      diff;
      outputDate1;
    });
  }

  TextEditingController _msg = TextEditingController();
  bool isLoading = true;
  ImagePicker _picker = ImagePicker();
  File? _pickedFile = null;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 300.w,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.blue,
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 1.w),
                    height: 11.w,
                    width: 11.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: widget.img.toString(),
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/user.png',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 2.w,
              ),
              SizedBox(
                width: 53.w,
                child: Text(
                  widget.name == "" || widget.name == null
                      ? "N/A"
                      : widget.name ?? '',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontFamily: 'sofi',
                      color: Colors.black),
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(null))
            ],
          ),
        ),
        body: isLoading
            ? Container()
            : SingleChildScrollView(
                child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Stack(
                    children: [
                      Container(
                        height: 87.h,
                        child: Column(children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            height: 77.h,
                            child: threadchat?.data?.livechat?.length == 0
                                ? Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "No Messages Available",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          fontFamily: 'sofi',
                                          color: Colors.black),
                                    ),
                                  )
                                : ListView.builder(
                                    controller: _scrollController,
                                    reverse: true,
                                    shrinkWrap: true,
                                    itemCount:
                                        threadchat?.data?.livechat?.length,
                                    itemBuilder: (context, index) {
                                      // bool showSeparator = false;
                                      // DateTime? date2;
                                      // var outputFormat2 = DateFormat('yyyy-MM-dd');
                                      // outputDate1 = outputFormat2
                                      //     .format(DateTime.parse(fullchatmodal?.data?.livechat?[index].createdAt ??""));
                                      // if(index<(fullchatmodal?.data?.livechat?.length ?? 0)-1){
                                      //    String date2 = DateFormat("dd").format(DateTime.parse(fullchatmodal?.data?.livechat?[index].createdAt ?? ""));
                                      //  diff = (DateTime.now().day)-(int.parse(date2.toString()));
                                      //    days = diff;
                                      //
                                      //    outputDate2 = outputFormat2
                                      //        .format(DateTime.parse(fullchatmodal?.data?.livechat?[index+1].createdAt ??""));
                                      //   Counter();
                                      //   if(outputDate1!=outputDate2){
                                      //     showSeparator =true;
                                      //   }
                                      // }

                                      bool showSeparator = false;

                                      var outputFormat2 =
                                          DateFormat('yyyy-MM-dd');
                                      var outputFormat1 = DateFormat("dd");
                                      DateTime parseDate =
                                          DateFormat("yyyy-MM-dd hh:mm:ss")
                                              .parse(threadchat
                                                      ?.data
                                                      ?.livechat?[index]
                                                      .createdAt ??
                                                  "");

                                      if (index <
                                          ((threadchat?.data?.livechat
                                                      ?.length ??
                                                  0) -
                                              1)) {
                                        DateTime parseDate1 =
                                            DateFormat("yyyy-MM-dd hh:mm:ss")
                                                .parse(threadchat
                                                        ?.data
                                                        ?.livechat?[index + 1]
                                                        .createdAt ??
                                                    "");
                                        var inputDate1 = DateTime.parse(
                                            parseDate1.toString());
                                        outputDate2 =
                                            outputFormat2.format(inputDate1);
                                      }
                                      var inputDate =
                                          DateTime.parse(parseDate.toString());

                                      outputDate1 =
                                          outputFormat2.format(inputDate);

                                      date2 = outputFormat1.format(inputDate);

                                      diff = (DateTime.now().day) -
                                          int.parse(date2.toString());
                                      Counter();

                                      // outputDate2 = outputFormat2.format(inputDate);

                                      return Column(
                                        children: [
                                          threadchat?.data?.livechat?[index]
                                                      .fromId ==
                                                  userData?.user?.id
                                              ? Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            DateFormat('HH:mm').format(
                                                                DateTime.parse(threadchat
                                                                        ?.data
                                                                        ?.livechat?[
                                                                            index]
                                                                        .createdAt ??
                                                                    "")),
                                                            style: TextStyle(
                                                                fontSize: 11.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFamily:
                                                                    'sofi'),
                                                          ),
                                                          SizedBox(width: 1.w),
                                                          Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        1.w),
                                                            height: 3.5.h,
                                                            width: 7.5.w,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          90),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                imageUrl: userprofile
                                                                        ?.userDetails
                                                                        ?.profileImg ??
                                                                    '',
                                                                progressIndicatorBuilder:
                                                                    (context,
                                                                            url,
                                                                            progress) =>
                                                                        CircularProgressIndicator(),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    Image.asset(
                                                                  'assets/user.png',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 1.h),
                                                      Container(
                                                        width: 60.w,
                                                        alignment: Alignment
                                                            .centerRight,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 5.w,
                                                                vertical:
                                                                    1.3.h),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20),
                                                            topLeft:
                                                                Radius.circular(
                                                                    20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20),
                                                          ),
                                                        ),
                                                        child: threadchat
                                                                    ?.data
                                                                    ?.livechat?[
                                                                        index]
                                                                    .messageType ==
                                                                "1"
                                                            ? Text(
                                                                threadchat
                                                                        ?.data
                                                                        ?.livechat?[
                                                                            index]
                                                                        .message ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    letterSpacing:
                                                                        1.5,
                                                                    fontFamily:
                                                                        'sofi'),
                                                              )
                                                            : threadchat
                                                                        ?.data
                                                                        ?.livechat?[
                                                                            index]
                                                                        .messageType ==
                                                                    "2"
                                                                ? Container(
                                                                    margin: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            1.w),
                                                                    height:
                                                                        20.h,
                                                                    width: 60.w,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        imageUrl:
                                                                            threadchat?.data?.livechat?[index].message ??
                                                                                '',
                                                                        progressIndicatorBuilder: (context,
                                                                                url,
                                                                                progress) =>
                                                                            CircularProgressIndicator(),
                                                                        errorWidget: (context,
                                                                                url,
                                                                                error) =>
                                                                            Image.asset(
                                                                          'assets/user.png',
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                : threadchat
                                                                            ?.data
                                                                            ?.livechat?[index]
                                                                            .messageType ==
                                                                        "3"
                                                                    ? Container(
                                                                        height:
                                                                            20.h,
                                                                        width:
                                                                            60.w,
                                                                        child: addVideo(
                                                                            videoid:
                                                                                threadchat?.data?.livechat?[index].message ?? ""),
                                                                      )
                                                                    : GestureDetector(
                                                                        onTap:
                                                                            () async {
                                                                          final String? url = (threadchat
                                                                              ?.data
                                                                              ?.livechat?[index]
                                                                              .message);
                                                                          String
                                                                              fileExtension =
                                                                              path.extension(url!);

                                                                          if (fileExtension ==
                                                                              ".txt") {
                                                                            Get.to(webview(
                                                                              data: threadchat?.data?.livechat?[index].message,
                                                                            ));
                                                                          } else {
                                                                            EasyLoading.show(
                                                                                status: 'Downloading ..',
                                                                                indicator: CircularProgressIndicator(
                                                                                  color: Colors.white,
                                                                                ));
                                                                            const downloadsFolderPath =
                                                                                '/storage/emulated/0/Download';
                                                                            var request =
                                                                                await httpClient.getUrl(Uri.parse((threadchat?.data?.livechat?[index].message).toString()));
                                                                            var response =
                                                                                await request.close();
                                                                            var bytes =
                                                                                await consolidateHttpClientResponseBytes(response);
                                                                            String
                                                                                fileName =
                                                                                url.toString().split('/').last;
                                                                            Directory dir = Platform.isAndroid
                                                                                ? Directory(downloadsFolderPath)
                                                                                : await getApplicationDocumentsDirectory();
                                                                            final String
                                                                                filePath =
                                                                                '${dir.path}/${fileName}';
                                                                            final File
                                                                                file =
                                                                                File(filePath);
                                                                            await file.writeAsBytes(bytes);
                                                                            EasyLoading.showSuccess("Downloaded");
                                                                            print(file);
                                                                          }
                                                                          // else {
                                                                          //   EasyLoading.show(status: 'Downloading');
                                                                          //   var response = await http.get(Uri.parse((fullchatmodal?.data?.livechat?[index].message).toString()));
                                                                          //
                                                                          //   String fileName = url.toString().split('/').last;
                                                                          //   Directory? storageDirectory = Platform.isAndroid ? await getExternalStorageDirectory() : await getDownloadsDirectory();
                                                                          //   String directoryPath = storageDirectory!.path;
                                                                          //   File file = File('$directoryPath/$fileName');
                                                                          //   // Directory directory = await getApplicationDocumentsDirectory();
                                                                          //   await file.writeAsBytes(response.bodyBytes);
                                                                          //   String filePath = '${storageDirectory.path}/$fileName';
                                                                          //   EasyLoading.showSuccess("Downloaded");
                                                                          //   try {
                                                                          //     final result = await OpenFile.open(filePath);
                                                                          //   } catch (e) {
                                                                          //     print(e.toString());
                                                                          //   }
                                                                          // }
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          threadchat?.data?.livechat?[index].message ??
                                                                              "",
                                                                          style: TextStyle(
                                                                              fontSize: 12.sp,
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                              letterSpacing: 1.5,
                                                                              fontFamily: 'sofi'),
                                                                        ),
                                                                      ),
                                                      ),
                                                      SizedBox(height: 1.h),
                                                    ],
                                                  ),
                                                )
                                              : Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        1.w),
                                                            height: 3.5.h,
                                                            width: 7.5.w,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                imageUrl: widget
                                                                    .img
                                                                    .toString(),
                                                                progressIndicatorBuilder:
                                                                    (context,
                                                                            url,
                                                                            progress) =>
                                                                        CircularProgressIndicator(),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    Image.asset(
                                                                  'assets/user.png',
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 1.w),
                                                          Text(
                                                            DateFormat('HH:mm').format(
                                                                DateTime.parse(threadchat
                                                                        ?.data
                                                                        ?.livechat?[
                                                                            index]
                                                                        .createdAt ??
                                                                    "")),
                                                            style: TextStyle(
                                                                fontSize: 11.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFamily:
                                                                    'sofi'),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 1.h),
                                                      Container(
                                                        width: 60.w,
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 5.w,
                                                                vertical:
                                                                    1.3.h),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .grey.shade300,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20),
                                                            topLeft:
                                                                Radius.circular(
                                                                    20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20),
                                                          ),
                                                        ),
                                                        child: threadchat
                                                                    ?.data
                                                                    ?.livechat?[
                                                                        index]
                                                                    .messageType ==
                                                                "1"
                                                            ? Text(
                                                                threadchat
                                                                        ?.data
                                                                        ?.livechat?[
                                                                            index]
                                                                        .message ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    letterSpacing:
                                                                        1.5,
                                                                    fontFamily:
                                                                        'sofi'),
                                                              )
                                                            : threadchat
                                                                        ?.data
                                                                        ?.livechat?[
                                                                            index]
                                                                        .messageType ==
                                                                    "2"
                                                                ? Container(
                                                                    margin: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            1.w),
                                                                    height:
                                                                        20.h,
                                                                    width: 60.w,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        imageUrl:
                                                                            threadchat?.data?.livechat?[index].message ??
                                                                                '',
                                                                        progressIndicatorBuilder: (context,
                                                                                url,
                                                                                progress) =>
                                                                            CircularProgressIndicator(),
                                                                        errorWidget: (context,
                                                                                url,
                                                                                error) =>
                                                                            Image.asset(
                                                                          'assets/defimg.jpg',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                : threadchat
                                                                            ?.data
                                                                            ?.livechat?[index]
                                                                            .messageType ==
                                                                        "3"
                                                                    ? Container(
                                                                        height:
                                                                            20.h,
                                                                        width:
                                                                            60.w,
                                                                        child: addVideo(
                                                                            videoid:
                                                                                threadchat?.data?.livechat?[index].message ?? ""),
                                                                      )
                                                                    : GestureDetector(
                                                                        onTap:
                                                                            () async {
                                                                          final String? url = (threadchat
                                                                              ?.data
                                                                              ?.livechat?[index]
                                                                              .message);
                                                                          String
                                                                              fileExtension =
                                                                              path.extension(url!);

                                                                          if (fileExtension ==
                                                                              ".txt") {
                                                                            Get.to(webview(
                                                                              data: threadchat?.data?.livechat?[index].message,
                                                                            ));
                                                                          } else {
                                                                            EasyLoading.show(
                                                                                status: 'Downloading ..',
                                                                                indicator: CircularProgressIndicator(
                                                                                  color: Colors.white,
                                                                                ));
                                                                            const downloadsFolderPath =
                                                                                '/storage/emulated/0/Download';
                                                                            var request =
                                                                                await httpClient.getUrl(Uri.parse((threadchat?.data?.livechat?[index].message).toString()));
                                                                            var response =
                                                                                await request.close();
                                                                            var bytes =
                                                                                await consolidateHttpClientResponseBytes(response);
                                                                            String
                                                                                fileName =
                                                                                url.toString().split('/').last;
                                                                            Directory dir = Platform.isAndroid
                                                                                ? Directory(downloadsFolderPath)
                                                                                : await getApplicationDocumentsDirectory();
                                                                            final String
                                                                                filePath =
                                                                                '${dir.path}/${fileName}';
                                                                            final File
                                                                                file =
                                                                                File(filePath);
                                                                            await file.writeAsBytes(bytes);
                                                                            EasyLoading.showSuccess("Downloaded");
                                                                            print(file);
                                                                          }
                                                                          // else {
                                                                          //   EasyLoading.show(status: 'Downloading');
                                                                          //   var response = await http.get(Uri.parse((fullchatmodal?.data?.livechat?[index].message).toString()));
                                                                          //
                                                                          //   String fileName = url.toString().split('/').last;
                                                                          //   Directory? storageDirectory = Platform.isAndroid ? await getExternalStorageDirectory() : await getDownloadsDirectory();
                                                                          //   String directoryPath = storageDirectory!.path;
                                                                          //   File file = File('$directoryPath/$fileName');
                                                                          //   // Directory directory = await getApplicationDocumentsDirectory();
                                                                          //   await file.writeAsBytes(response.bodyBytes);
                                                                          //   String filePath = '${storageDirectory.path}/$fileName';
                                                                          //   EasyLoading.showSuccess("Downloaded");
                                                                          //   try {
                                                                          //     final result = await OpenFile.open(filePath);
                                                                          //   } catch (e) {
                                                                          //     print(e.toString());
                                                                          //   }
                                                                          // }
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          threadchat?.data?.livechat?[index].message ??
                                                                              "",
                                                                          style: TextStyle(
                                                                              fontSize: 12.sp,
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.normal,
                                                                              letterSpacing: 1.5,
                                                                              fontFamily: 'sofi'),
                                                                        ),
                                                                      ),
                                                      ),
                                                      SizedBox(height: 1.h),
                                                    ],
                                                  ),
                                                )
                                        ],
                                      );
                                    }),
                          ),
                        ]),
                      ),
                      threadchat?.data?.livechat?.length == 0
                          ? Container()
                          : Positioned(
                              top: 1.h,
                              left: 30.w,
                              right: 30.w,
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 3.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                  child: Text(
                                    outputDate1 == '' || outputDate1 == null
                                        ? 'N/A'
                                        : (diff == 0)
                                            ? "Today"
                                            : (diff == 1)
                                                ? "Yesterday"
                                                : outputDate1.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontFamily: "Poppins"),
                                  ))),
                      Positioned(
                        top: 79.h,
                        child: Row(children: [
                          IconButton(
                              onPressed: () {
                                selectoption();
                              },
                              icon: Icon(
                                Icons.attach_file,
                                size: 20.sp,
                                color: Colors.blue,
                              )),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            width: 68.w,
                            child: TextField(
                              controller: _msg,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.3.sp,
                                  fontFamily: 'get'),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                border: InputBorder.none,
                                hintText: 'Send a message',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontFamily: 'get'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  type = 1;
                                  FocusScope.of(context).unfocus();
                                  sendmessageap();
                                });
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(2.5.w),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(90)),
                                  child: Center(
                                      child: Icon(
                                    Icons.send,
                                    size: 18.sp,
                                    color: Colors.white,
                                  ))))
                        ]),
                      ),
                    ],
                  ),
                ),
              )),
      ),
    );
  }

  sendmessageap() {
    final Map<String, String> data = {};
    data['textMsg'] = type == 1 ? _msg.text : "";
    data['file'] = type == 1 ? "" : _pickedFile!.path;
    data['mType'] = type.toString();
    data['topic_id'] = widget.id ?? '';
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().sendthreadapi(data).then((response) async {
          sendthread = SendThreadModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && sendthread?.status == "1") {
            fullchatap();
            print(sendthread?.status);
            _msg.text = "";
          } else {
            // buildErrorDialog(context, "", "Please type the message");
            buildErrorDialog(
                context, " Error", (sendthread?.message).toString());
            fullchatap();
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  selectoption() {
    showModalBottomSheet(
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
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 3.h),
                    Center(
                      child: Text(
                        'Select from below',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'sofi',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            height: 0.17.h,
                            letterSpacing: 1),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  final XFile? photo = await _picker.pickVideo(
                                      source: ImageSource.gallery);
                                  setState(() {
                                    type = 3;
                                    _pickedFile = File(photo!.path);
                                    print("video daat");
                                    print(_pickedFile);
                                  });
                                  sendmessageap();
                                  // getvideo();
                                  Navigator.of(context).pop();
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50.0,
                                      width: 50.0,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue),
                                      child: Icon(
                                        Icons.video_camera_back,
                                        color: Colors.white,
                                        size: 25.0,
                                      ),
                                    ),
                                    Text(
                                      "video",
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
                              ),
                              GestureDetector(
                                onTap: () async {
                                  final XFile? photo = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(() {
                                    _pickedFile = File(photo!.path);
                                    type = 2;
                                    print(_pickedFile);
                                  });
                                  sendmessageap();
                                  Navigator.of(context).pop();

                                  // XFile? photo = await _picker.pickVideo(source: ImageSource.gallery);
                                  // setState(() {
                                  //   _pickedFile = File(photo!.path);
                                  // });
                                  // addchat();
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50.0,
                                      width: 50.0,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue),
                                      child: Icon(
                                        Icons.photo,
                                        color: Colors.white,
                                        size: 25.0,
                                      ),
                                    ),
                                    Text(
                                      "Image",
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
                              ),
                              GestureDetector(
                                onTap: () async {
                                  print("hooo");
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles();

                                  if (result != null) {
                                    setState(() {
                                      type = 4;
                                      _pickedFile = File(
                                          result.files.single.path.toString());
                                      print(_pickedFile);
                                      sendmessageap();
                                    });
                                  } else {
                                    // User canceled the picker
                                  }
                                  Navigator.of(context).pop();
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50.0,
                                      width: 50.0,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue),
                                      child: Icon(
                                        Icons.contact_page,
                                        color: Colors.white,
                                        size: 25.0,
                                      ),
                                    ),
                                    Text(
                                      "Document",
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
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
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

  fullchatap() {
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().threadchatapi(widget.id).then((response) async {
          threadchat = ThreadchatModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && threadchat?.status == "1") {
            readnewmsgap();
            userprofileap();
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

  readnewmsgap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().readmsgapi(widget.id).then((response) async {
          readnewmsgmodal =
              ReadnewmsgModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && readnewmsgmodal?.status == "1") {
          } else {}
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
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
