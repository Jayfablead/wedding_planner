import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MessagePage extends StatefulWidget {
  String? img;
  String? name;

  MessagePage({super.key, this.name, this.img});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.name);
  }

  TextEditingController _msg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                            height: 6.h,
                            width: 12.w,
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
                        width: 56.w,
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
                  ),SizedBox(height: 1.h),
                  Container(height: 79.5.h,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 60.w,
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 1.3.h),
                                  decoration: BoxDecoration(
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    'Oyahoo',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                        fontFamily: 'sofi'),
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text('9:00 AM',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'sofi')),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.5.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 60.w,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 1.3.h),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    'Oyahoo Gozaimos',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                        fontFamily: 'sofi'),
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text('9:00 AM',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'sofi')),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.5.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 60.w,
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 1.3.h),
                                  decoration: BoxDecoration(
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    'How Are You?',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                        fontFamily: 'sofi'),
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text('9:00 AM',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'sofi')),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.5.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 60.w,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 1.3.h),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    'Fine and How About You ?',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                        fontFamily: 'sofi'),
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text('9:00 AM',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'sofi')),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.5.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 60.w,
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 1.3.h),
                                  decoration: BoxDecoration(
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    'I\'m  Also Fine',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                        fontFamily: 'sofi'),
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text('9:00 AM',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'sofi')),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.5.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 60.w,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 1.3.h),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    'Where You Sailed This Time I have been Finding you on docks this whole time and someone told me that you sailed without telling me. ',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                        fontFamily: 'sofi'),
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text('9:00 AM',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'sofi')),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.5.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 60.w,
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 1.3.h),
                                  decoration: BoxDecoration(
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    'Sorry ! My brother i apologize for my bad behaviour can you forgive me this time only i will tell you from now ',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                        fontFamily: 'sofi'),
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text('9:00 AM',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'sofi')),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.5.h),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 60.w,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 1.3.h),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    'Nani',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                        fontFamily: 'sofi'),
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text('9:00 AM',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'sofi')),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ]),
              ),
              Positioned(
                top: 92.5.h,
                child: Row(children: [
                  Container(color: Colors.white,
                    width: 80.w,
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
                        print('Moklyo hoo');
                      },
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(2.5.w),
                          decoration: BoxDecoration(
                              color: Colors.pink,
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
    );
  }
}
