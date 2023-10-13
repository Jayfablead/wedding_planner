import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/FullchatModal.dart';
import 'package:wedding_planner/Modal/SendmessageModal.dart';
import 'package:wedding_planner/Provider/authprovider.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/load.dart';

class Msg2 extends StatefulWidget {
  String? img;
  String? name;
  String? id;


  Msg2({super.key, this.name, this.img,this.id});

  @override
  State<Msg2> createState() => _Msg2State();
}

class _Msg2State extends State<Msg2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.name);
    fullchatap();
  }

  TextEditingController _msg = TextEditingController();
bool isLoading =true;
  ImagePicker _picker = ImagePicker();
  File? _pickedFile = null;
  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        body: isLoading? Container():SingleChildScrollView(
            child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Stack(
              children: [
                SizedBox(
                  height: 100.h,
                  child: Column(children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
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
                                icon: Icon(Icons.arrow_back_ios_new_rounded)),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 1.w),
                              height: 5.h,
                              width: 11.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(90),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: widget.img.toString(),
                                  progressIndicatorBuilder:
                                      (context, url, progress) =>
                                          CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    'assets/icons/user.png',
                                    color: Colors.white,
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
                            widget.name ?? '',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontFamily: 'sofi',
                                color: Colors.black),
                          ),
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.more_vert_rounded))
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Container(
                      height: 79.h,
                      child:ListView.builder(
                        reverse: false,
                          itemCount: fullchatmodal?.data?.livechat?.length,
                          itemBuilder: (context,index) {
                            DateTime dateTime = DateTime.parse(fullchatmodal?.data?.livechat?[index].createdAt ?? "");
                           DateFormat timeFormat = DateFormat('HH:mm'); // Customize the format as needed
                           String formattedTime = timeFormat.format(dateTime);
                            return  fullchatmodal?.data?.livechat?[index].fromId == userData?.user?.id ?
                            Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        formattedTime,
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'sofi'),
                                      ),
                                      SizedBox(width: 1.w),
                                      Container(
                                        margin:
                                        EdgeInsets.symmetric(horizontal: 1.w),
                                        height: 3.5.h,
                                        width: 7.5.w,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(90),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl:
                                            'https://i.pinimg.com/550x/09/5c/44/095c44ce9421a10fad713a32d8648f6f.jpg',
                                            progressIndicatorBuilder:
                                                (context, url, progress) =>
                                                CircularProgressIndicator(),
                                            errorWidget: (context, url, error) =>
                                                Image.asset(
                                                  'assets/icons/user.png',
                                                  color: Colors.white,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.h),
                                  Container(
                                    width: 60.w,
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.w, vertical: 1.3.h),
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                    child:fullchatmodal?.data?.livechat?[index].messageType == "1" ?
                                    Text(
                                      fullchatmodal?.data?.livechat?[index].message ?? "",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5,
                                          fontFamily: 'sofi'),
                                    ):fullchatmodal?.data?.livechat?[index].messageType == "2"?  Container(
                                      margin: EdgeInsets.symmetric(horizontal: 1.w),
                                      height: 20.h,
                                      width: 60.w,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: fullchatmodal?.data?.livechat?[index].message ?? '',
                                          progressIndicatorBuilder:
                                              (context, url, progress) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                                'assets/icons/user.png',
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                    ):Container(),
                                  ),
                                ],
                              ),
                            ):
                                     Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin:
                                            EdgeInsets.symmetric(horizontal: 1.w),
                                            height: 3.5.h,
                                            width: 7.5.w,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl:
                                                fullchatmodal?.data?.livechat?[index].message ?? "",
                                                progressIndicatorBuilder:
                                                    (context, url, progress) =>
                                                    CircularProgressIndicator(),
                                                errorWidget: (context, url, error) =>
                                                    Image.asset(
                                                      'assets/icons/user.png',
                                                      color: Colors.white,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 1.w),
                                          Text(
                                           formattedTime,
                                            style: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'sofi'),
                                          ),


                                        ],
                                      ),
                                      SizedBox(height: 1.h),
                                      Container(
                                        width: 60.w,
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w, vertical: 1.3.h),
                                        decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: fullchatmodal?.data?.livechat?[index].messageType == "1" ?
                                        Text(
                                          fullchatmodal?.data?.livechat?[index].message ?? "",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                              fontFamily: 'sofi'),
                                        ):fullchatmodal?.data?.livechat?[index].messageType == "2"?  Container(
                                          margin: EdgeInsets.symmetric(horizontal: 1.w),
                                          height: 20.h,
                                          width: 60.w,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl: fullchatmodal?.data?.livechat?[index].message ?? '',
                                              progressIndicatorBuilder:
                                                  (context, url, progress) =>
                                                  CircularProgressIndicator(),
                                              errorWidget: (context, url, error) =>
                                                  Image.asset(
                                                    'assets/icons/user.png',
                                                    color: Colors.white,
                                                  ),
                                            ),
                                          ),
                                        ):Container()
                                      ),
                                    ],
                                  ),
                                );
                      }),

                      // Column(
                      //   children: [
                      //     Align(
                      //       alignment: Alignment.centerRight,
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.end,
                      //         crossAxisAlignment: CrossAxisAlignment.end,
                      //         children: [
                      //           Row(
                      //             mainAxisAlignment: MainAxisAlignment.end,
                      //             crossAxisAlignment: CrossAxisAlignment.end,
                      //             children: [
                      //               Text(
                      //                 '9:00 AM',
                      //                 style: TextStyle(
                      //                     fontSize: 11.sp,
                      //                     fontWeight: FontWeight.w600,
                      //                     fontFamily: 'sofi'),
                      //               ),
                      //               SizedBox(width: 1.w),
                      //               Container(
                      //                 margin:
                      //                     EdgeInsets.symmetric(horizontal: 1.w),
                      //                 height: 3.5.h,
                      //                 width: 7.5.w,
                      //                 child: ClipRRect(
                      //                   borderRadius: BorderRadius.circular(90),
                      //                   child: CachedNetworkImage(
                      //                     fit: BoxFit.cover,
                      //                     imageUrl:
                      //                         'https://i.pinimg.com/550x/09/5c/44/095c44ce9421a10fad713a32d8648f6f.jpg',
                      //                     progressIndicatorBuilder:
                      //                         (context, url, progress) =>
                      //                             CircularProgressIndicator(),
                      //                     errorWidget: (context, url, error) =>
                      //                         Image.asset(
                      //                       'assets/icons/user.png',
                      //                       color: Colors.white,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(height: 1.h),
                      //           Container(
                      //             width: 60.w,
                      //             alignment: Alignment.centerRight,
                      //             padding: EdgeInsets.symmetric(
                      //                 horizontal: 5.w, vertical: 1.3.h),
                      //             decoration: BoxDecoration(
                      //               color: Colors.amber,
                      //               borderRadius: BorderRadius.only(
                      //                 bottomLeft: Radius.circular(20),
                      //                 topLeft: Radius.circular(20),
                      //                 bottomRight: Radius.circular(20),
                      //               ),
                      //             ),
                      //             child: Text(
                      //               'Oyahoo',
                      //               style: TextStyle(
                      //                   fontSize: 12.sp,
                      //                   color: Colors.white,
                      //                   fontWeight: FontWeight.bold,
                      //                   letterSpacing: 1.5,
                      //                   fontFamily: 'sofi'),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(height: 1.5.h),
                      //     Align(
                      //       alignment: Alignment.centerLeft,
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Row(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             crossAxisAlignment: CrossAxisAlignment.end,
                      //             children: [
                      //               Container(
                      //                 margin:
                      //                     EdgeInsets.symmetric(horizontal: 1.w),
                      //                 height: 3.5.h,
                      //                 width: 7.5.w,
                      //                 child: ClipRRect(
                      //                   borderRadius: BorderRadius.circular(90),
                      //                   child: CachedNetworkImage(
                      //                     fit: BoxFit.cover,
                      //                     imageUrl: widget.img.toString(),
                      //                     progressIndicatorBuilder:
                      //                         (context, url, progress) =>
                      //                             CircularProgressIndicator(),
                      //                     errorWidget: (context, url, error) =>
                      //                         Image.asset(
                      //                       'assets/icons/user.png',
                      //                       color: Colors.white,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               SizedBox(width: 1.w),
                      //               Text(
                      //                 '9:00 AM',
                      //                 style: TextStyle(
                      //                     fontSize: 11.sp,
                      //                     fontWeight: FontWeight.w600,
                      //                     fontFamily: 'sofi'),
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(height: 1.h),
                      //           Container(
                      //             width: 60.w,
                      //             alignment: Alignment.centerLeft,
                      //             padding: EdgeInsets.symmetric(
                      //                 horizontal: 5.w, vertical: 1.3.h),
                      //             decoration: BoxDecoration(
                      //               color: Colors.black12,
                      //               borderRadius: BorderRadius.only(
                      //                 bottomRight: Radius.circular(20),
                      //                 bottomLeft: Radius.circular(20),
                      //                 topRight: Radius.circular(20),
                      //               ),
                      //             ),
                      //             child: Text(
                      //               'Oyahoo Gozaimos',
                      //               style: TextStyle(
                      //                   fontSize: 12.sp,
                      //                   color: Colors.black,
                      //                   fontWeight: FontWeight.bold,
                      //                   letterSpacing: 1.5,
                      //                   fontFamily: 'sofi'),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(height: 1.5.h),
                      //     Align(
                      //       alignment: Alignment.centerRight,
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.end,
                      //         crossAxisAlignment: CrossAxisAlignment.end,
                      //         children: [
                      //           Row(
                      //             mainAxisAlignment: MainAxisAlignment.end,
                      //             crossAxisAlignment: CrossAxisAlignment.end,
                      //             children: [
                      //               Text('9:00 AM',
                      //                   style: TextStyle(
                      //                       fontSize: 11.sp,
                      //                       fontWeight: FontWeight.w600,
                      //                       fontFamily: 'sofi')),
                      //               SizedBox(width: 1.w),
                      //               Container(
                      //                 margin:
                      //                     EdgeInsets.symmetric(horizontal: 1.w),
                      //                 height: 3.5.h,
                      //                 width: 7.5.w,
                      //                 child: ClipRRect(
                      //                   borderRadius: BorderRadius.circular(90),
                      //                   child: CachedNetworkImage(
                      //                     fit: BoxFit.cover,
                      //                     imageUrl:
                      //                         'https://i.pinimg.com/550x/09/5c/44/095c44ce9421a10fad713a32d8648f6f.jpg',
                      //                     progressIndicatorBuilder:
                      //                         (context, url, progress) =>
                      //                             CircularProgressIndicator(),
                      //                     errorWidget: (context, url, error) =>
                      //                         Image.asset(
                      //                       'assets/icons/user.png',
                      //                       color: Colors.white,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(height: 1.h),
                      //           Container(
                      //             width: 60.w,
                      //             alignment: Alignment.centerRight,
                      //             padding: EdgeInsets.symmetric(
                      //                 horizontal: 5.w, vertical: 1.3.h),
                      //             decoration: BoxDecoration(
                      //               color: Colors.amber,
                      //               borderRadius: BorderRadius.only(
                      //                 bottomLeft: Radius.circular(20),
                      //                 topLeft: Radius.circular(20),
                      //                 bottomRight: Radius.circular(20),
                      //               ),
                      //             ),
                      //             child: Text(
                      //               'How Are You?',
                      //               style: TextStyle(
                      //                   fontSize: 12.sp,
                      //                   color: Colors.white,
                      //                   fontWeight: FontWeight.bold,
                      //                   letterSpacing: 1.5,
                      //                   fontFamily: 'sofi'),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(height: 1.5.h),
                      //     Align(
                      //       alignment: Alignment.centerLeft,
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Row(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             crossAxisAlignment: CrossAxisAlignment.end,
                      //             children: [
                      //               Container(
                      //                 margin:
                      //                     EdgeInsets.symmetric(horizontal: 1.w),
                      //                 height: 3.5.h,
                      //                 width: 7.5.w,
                      //                 child: ClipRRect(
                      //                   borderRadius: BorderRadius.circular(90),
                      //                   child: CachedNetworkImage(
                      //                     fit: BoxFit.cover,
                      //                     imageUrl: widget.img.toString(),
                      //                     progressIndicatorBuilder:
                      //                         (context, url, progress) =>
                      //                             CircularProgressIndicator(),
                      //                     errorWidget: (context, url, error) =>
                      //                         Image.asset(
                      //                       'assets/icons/user.png',
                      //                       color: Colors.white,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               SizedBox(width: 1.w),
                      //               Text('9:00 AM',
                      //                   style: TextStyle(
                      //                       fontSize: 11.sp,
                      //                       fontWeight: FontWeight.w600,
                      //                       fontFamily: 'sofi')),
                      //             ],
                      //           ),
                      //           SizedBox(height: 1.h),
                      //           Container(
                      //             width: 60.w,
                      //             alignment: Alignment.centerLeft,
                      //             padding: EdgeInsets.symmetric(
                      //                 horizontal: 5.w, vertical: 1.3.h),
                      //             decoration: BoxDecoration(
                      //               color: Colors.black12,
                      //               borderRadius: BorderRadius.only(
                      //                 bottomRight: Radius.circular(20),
                      //                 bottomLeft: Radius.circular(20),
                      //                 topRight: Radius.circular(20),
                      //               ),
                      //             ),
                      //             child: Text(
                      //               'Fine and How About You ?',
                      //               style: TextStyle(
                      //                   fontSize: 12.sp,
                      //                   color: Colors.black,
                      //                   fontWeight: FontWeight.bold,
                      //                   letterSpacing: 1.5,
                      //                   fontFamily: 'sofi'),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(height: 1.5.h),
                      //     Align(
                      //       alignment: Alignment.centerRight,
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.end,
                      //         crossAxisAlignment: CrossAxisAlignment.end,
                      //         children: [
                      //           Row(
                      //             mainAxisAlignment: MainAxisAlignment.end,
                      //             crossAxisAlignment: CrossAxisAlignment.end,
                      //             children: [
                      //               Text('9:00 AM',
                      //                   style: TextStyle(
                      //                       fontSize: 11.sp,
                      //                       fontWeight: FontWeight.w600,
                      //                       fontFamily: 'sofi')),
                      //               SizedBox(width: 1.w),
                      //               Container(
                      //                 margin:
                      //                     EdgeInsets.symmetric(horizontal: 1.w),
                      //                 height: 3.5.h,
                      //                 width: 7.5.w,
                      //                 child: ClipRRect(
                      //                   borderRadius: BorderRadius.circular(90),
                      //                   child: CachedNetworkImage(
                      //                     fit: BoxFit.cover,
                      //                     imageUrl:
                      //                         'https://i.pinimg.com/550x/09/5c/44/095c44ce9421a10fad713a32d8648f6f.jpg',
                      //                     progressIndicatorBuilder:
                      //                         (context, url, progress) =>
                      //                             CircularProgressIndicator(),
                      //                     errorWidget: (context, url, error) =>
                      //                         Image.asset(
                      //                       'assets/icons/user.png',
                      //                       color: Colors.white,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(height: 1.h),
                      //           Container(
                      //             width: 60.w,
                      //             alignment: Alignment.centerRight,
                      //             padding: EdgeInsets.symmetric(
                      //                 horizontal: 5.w, vertical: 1.3.h),
                      //             decoration: BoxDecoration(
                      //               color: Colors.amber,
                      //               borderRadius: BorderRadius.only(
                      //                 bottomLeft: Radius.circular(20),
                      //                 topLeft: Radius.circular(20),
                      //                 bottomRight: Radius.circular(20),
                      //               ),
                      //             ),
                      //             child: Text(
                      //               'I\'m  Also Fine',
                      //               style: TextStyle(
                      //                   fontSize: 12.sp,
                      //                   color: Colors.white,
                      //                   fontWeight: FontWeight.bold,
                      //                   letterSpacing: 1.5,
                      //                   fontFamily: 'sofi'),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(height: 1.5.h),
                      //     Align(
                      //       alignment: Alignment.centerLeft,
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Row(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             crossAxisAlignment: CrossAxisAlignment.end,
                      //             children: [
                      //               Container(
                      //                 margin:
                      //                     EdgeInsets.symmetric(horizontal: 1.w),
                      //                 height: 3.5.h,
                      //                 width: 7.5.w,
                      //                 child: ClipRRect(
                      //                   borderRadius: BorderRadius.circular(90),
                      //                   child: CachedNetworkImage(
                      //                     fit: BoxFit.cover,
                      //                     imageUrl: widget.img.toString(),
                      //                     progressIndicatorBuilder:
                      //                         (context, url, progress) =>
                      //                             CircularProgressIndicator(),
                      //                     errorWidget: (context, url, error) =>
                      //                         Image.asset(
                      //                       'assets/icons/user.png',
                      //                       color: Colors.white,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               SizedBox(width: 1.w),
                      //               Text('9:00 AM',
                      //                   style: TextStyle(
                      //                       fontSize: 11.sp,
                      //                       fontWeight: FontWeight.w600,
                      //                       fontFamily: 'sofi')),
                      //             ],
                      //           ),
                      //           SizedBox(height: 1.h),
                      //           Container(
                      //             width: 60.w,
                      //             alignment: Alignment.centerLeft,
                      //             padding: EdgeInsets.symmetric(
                      //                 horizontal: 5.w, vertical: 1.3.h),
                      //             decoration: BoxDecoration(
                      //               color: Colors.black12,
                      //               borderRadius: BorderRadius.only(
                      //                 bottomRight: Radius.circular(20),
                      //                 bottomLeft: Radius.circular(20),
                      //                 topRight: Radius.circular(20),
                      //               ),
                      //             ),
                      //             child: Text(
                      //               'Where You Sailed This Time I have been Finding you on docks this whole time and someone told me that you sailed without telling me. ',
                      //               style: TextStyle(
                      //                   fontSize: 12.sp,
                      //                   color: Colors.black,
                      //                   fontWeight: FontWeight.bold,
                      //                   letterSpacing: 1.5,
                      //                   fontFamily: 'sofi'),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(height: 1.5.h),
                      //     Align(
                      //       alignment: Alignment.centerRight,
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.end,
                      //         crossAxisAlignment: CrossAxisAlignment.end,
                      //         children: [
                      //           Row(
                      //             mainAxisAlignment: MainAxisAlignment.end,
                      //             crossAxisAlignment: CrossAxisAlignment.end,
                      //             children: [
                      //               Text('9:00 AM',
                      //                   style: TextStyle(
                      //                       fontSize: 11.sp,
                      //                       fontWeight: FontWeight.w600,
                      //                       fontFamily: 'sofi')),
                      //               SizedBox(width: 1.w),
                      //               Container(
                      //                 margin:
                      //                     EdgeInsets.symmetric(horizontal: 1.w),
                      //                 height: 3.5.h,
                      //                 width: 7.5.w,
                      //                 child: ClipRRect(
                      //                   borderRadius: BorderRadius.circular(90),
                      //                   child: CachedNetworkImage(
                      //                     fit: BoxFit.cover,
                      //                     imageUrl:
                      //                         'https://i.pinimg.com/550x/09/5c/44/095c44ce9421a10fad713a32d8648f6f.jpg',
                      //                     progressIndicatorBuilder:
                      //                         (context, url, progress) =>
                      //                             CircularProgressIndicator(),
                      //                     errorWidget: (context, url, error) =>
                      //                         Image.asset(
                      //                       'assets/icons/user.png',
                      //                       color: Colors.white,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(height: 1.h),
                      //           Container(
                      //             width: 60.w,
                      //             alignment: Alignment.centerRight,
                      //             padding: EdgeInsets.symmetric(
                      //                 horizontal: 5.w, vertical: 1.3.h),
                      //             decoration: BoxDecoration(
                      //               color: Colors.amber,
                      //               borderRadius: BorderRadius.only(
                      //                 bottomLeft: Radius.circular(20),
                      //                 topLeft: Radius.circular(20),
                      //                 bottomRight: Radius.circular(20),
                      //               ),
                      //             ),
                      //             child: Text(
                      //               'Sorry ! My brother i apologize for my bad behaviour can you forgive me this time only i will tell you from now ',
                      //               style: TextStyle(
                      //                   fontSize: 12.sp,
                      //                   color: Colors.white,
                      //                   fontWeight: FontWeight.bold,
                      //                   letterSpacing: 1.5,
                      //                   fontFamily: 'sofi'),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(height: 1.5.h),
                      //     Align(
                      //       alignment: Alignment.centerLeft,
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Row(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             crossAxisAlignment: CrossAxisAlignment.end,
                      //             children: [
                      //               Container(
                      //                 margin:
                      //                     EdgeInsets.symmetric(horizontal: 1.w),
                      //                 height: 3.5.h,
                      //                 width: 7.5.w,
                      //                 child: ClipRRect(
                      //                   borderRadius: BorderRadius.circular(90),
                      //                   child: CachedNetworkImage(
                      //                     fit: BoxFit.cover,
                      //                     imageUrl: widget.img.toString(),
                      //                     progressIndicatorBuilder:
                      //                         (context, url, progress) =>
                      //                             CircularProgressIndicator(),
                      //                     errorWidget: (context, url, error) =>
                      //                         Image.asset(
                      //                       'assets/icons/user.png',
                      //                       color: Colors.white,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               SizedBox(width: 1.w),
                      //               Text('9:00 AM',
                      //                   style: TextStyle(
                      //                       fontSize: 11.sp,
                      //                       fontWeight: FontWeight.w600,
                      //                       fontFamily: 'sofi')),
                      //             ],
                      //           ),
                      //           SizedBox(height: 1.h),
                      //           Container(
                      //             width: 60.w,
                      //             alignment: Alignment.centerLeft,
                      //             padding: EdgeInsets.symmetric(
                      //                 horizontal: 5.w, vertical: 1.3.h),
                      //             decoration: BoxDecoration(
                      //               color: Colors.black12,
                      //               borderRadius: BorderRadius.only(
                      //                 bottomRight: Radius.circular(20),
                      //                 bottomLeft: Radius.circular(20),
                      //                 topRight: Radius.circular(20),
                      //               ),
                      //             ),
                      //             child: Text(
                      //               'Nani',
                      //               style: TextStyle(
                      //                   fontSize: 12.sp,
                      //                   color: Colors.black,
                      //                   fontWeight: FontWeight.bold,
                      //                   letterSpacing: 1.5,
                      //                   fontFamily: 'sofi'),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ]),
                ),
                Positioned(
                  top: 91.5.h,
                  child: Row(children: [
                    IconButton(
                        onPressed: (){
                          selectoption();
                        },
                        icon: Icon(Icons.attach_file,size: 20.sp,)),
                    Container(
                      color: Colors.white,
                      width: 68.w,
                      child: TextField(
                        controller: _msg,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.3.sp,
                            fontFamily: 'get'),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(90),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(90),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(90),
                          ),
                          border: InputBorder.none,
                          hintText: 'Send a message',
                          hintStyle:
                              TextStyle(color: Colors.black, fontFamily: 'get'),

                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    InkWell(
                        onTap: () {
                         sendmessageap();
                        },
                        child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(2.5.w),
                            decoration: BoxDecoration(
                                color: Colors.amber,
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
  sendmessageap(){

      final Map<String, String> data = {};
      data['textMsg'] = _msg.text.trim().toString();
      data['file'] =  _msg.text== "" ?_pickedFile!.path : "";

      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          authprovider().sendmessageapi(data,widget.id).then((response) async {
            sendmessageModal = SendmessageModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && sendmessageModal?.status == "1") {
                print(sendmessageModal?.status);
                _msg.text = "";
                fullchatap();
            } else {
              buildErrorDialog(
                  context, " Error", (sendmessageModal?.message).toString());
            }
          });
        } else {
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });


  }
  selectoption(){

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: new Text('Select from below'),
          content: Container(
            // height: 180.0,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child:Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    GestureDetector(
                      onTap: () async {
                        final XFile? photo = await _picker.pickVideo(source: ImageSource.gallery);
                        setState(() {
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
                                shape: BoxShape.circle, color: Colors.lightBlue),
                            child: Icon(
                              Icons.video_camera_back,
                              color: Colors.white,
                              size: 25.0,
                            ),
                          ),
                          Text(
                            "video",
                            style:
                            TextStyle(fontSize: 12.sp, fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
                        setState(() {
                          _pickedFile = File(photo!.path);

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
                                shape: BoxShape.circle, color: Colors.lightBlue),
                            child: Icon(
                              Icons.photo,
                              color: Colors.white,
                              size: 25.0,
                            ),
                          ),
                          Text(
                            "Image",
                            style:
                            TextStyle(fontSize: 12.sp, fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        FilePickerResult? result = await FilePicker.platform.pickFiles();

                        if (result != null) {
                          setState(() {

                            _pickedFile = File(result.files.single.path.toString());
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
                                shape: BoxShape.circle, color: Colors.lightBlue),
                            child: Icon(
                              Icons.contact_page,
                              color: Colors.white,
                              size: 25.0,
                            ),
                          ),
                          Text("Document"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ),
        ),
      );

  }
  fullchatap(){
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().fullchatapi(widget.id).then((response) async {
          fullchatmodal = FullchatModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && fullchatmodal?.status == "1") {
            setState(() {
              isLoading =false;
            });


          } else {
            setState(() {
              isLoading =false;
            });


          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
