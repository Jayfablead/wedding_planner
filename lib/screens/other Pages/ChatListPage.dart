import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/ChatListModal.dart';
import 'package:wedding_planner/Modal/CheckListModal.dart';
import 'package:wedding_planner/Provider/authprovider.dart';
import 'package:wedding_planner/main.dart';

import 'package:wedding_planner/screens/other%20Pages/msg2.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

class ChatlistPage extends StatefulWidget {
  int? sele;

  ChatlistPage({super.key, required this.sele});

  @override
  State<ChatlistPage> createState() => _ChatlistPageState();
}
//
// class chat {
//   String? image;
//   String? name;
//   String? msg;
//   String? time;
//
//   chat(
//     this.image,
//     this.name,
//     this.msg,
//     this.time,
//   );
// }
//
// List<chat> mesgs = [
//   chat(
//       'https://e1.pxfuel.com/desktop-wallpaper/238/852/desktop-wallpaper-masque-luffy-smiling-luffy-smile-thumbnail.jpg',
//       'Luffy',
//       'Moshi Mosh Oreva Monkey d Luffy Kaizoku wo Naru to nido',
//       '8:94 AM'),
//   chat(
//       'https://static.wikia.nocookie.net/fictionalfighters/images/4/48/Sanji.png/revision/latest?cb=20150406032640',
//       'Sanji',
//       'Hoy Mass Head Punk',
//       '9:10 AM'),
//   chat(
//       'https://w0.peakpx.com/wallpaper/311/533/HD-wallpaper-one-piece-nico-robin-one-piece-two-years-later.jpg',
//       'Robin',
//       'Oy Zoro kun Ohayoo',
//       '9:15 AM'),
//   chat(
//       'https://i.pinimg.com/736x/59/e3/d2/59e3d2fb93af21511690470abc014831.jpg',
//       'Nami',
//       'Hey! Dumb Zoro Don\'t Fight ',
//       '9:40 AM'),
//   chat(
//       'https://i.pinimg.com/236x/23/62/50/236250f1055a352c4a0cd5e0a21aaf33.jpg',
//       'Chopper',
//       'You are Injured Come to me I will Fix You ',
//       '10:50 Am'),
// ];
// int selit = 2;
TextEditingController _search = TextEditingController();
final GlobalKey<ScaffoldState> scaffoldKey3 = GlobalKey<ScaffoldState>();

class _ChatlistPageState extends State<ChatlistPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      setit = 2;
    });
    chatlistap();
  }
bool isLoading =true;
  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
        bottomNavigationBar: bottomnavbar(selit: widget.sele),
        extendBody: true,
        drawer: drawer1(),
        key: scaffoldKey,
        body:isLoading?Container(): Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.blue,size: 23.sp,)),
                  //     Text(
                  //       "",
                  //       style: TextStyle(
                  //         fontSize: 15.sp,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //
                  //     IconButton(
                  //         onPressed: () {
                  //           // Scaffold.of(context).openDrawer();
                  //           openDrawer();
                  //         },
                  //         icon: Icon(Icons.menu_rounded,color: Colors.blue,size: 23.sp))
                  //   ],
                  // ),
                  // headerwid(text: ""),
                  header(text: "",callback1: (){
                    scaffoldKey.currentState?.openDrawer();
                  }),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 1.w),
                        child: Text(
                          'Messages',
                          style: TextStyle(
                              fontSize: 25.sp,
                              fontFamily: 'sofi',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  searchBox(),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      SizedBox(width: 2.w),
                      Text(
                        'My Venue ',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontFamily: 'sofi',
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  InkWell(
                    onTap: () {
                      Get.to(Msg2(
                       id:chatlistmodal?.venue?.id ,
                        name: chatlistmodal?.venue?.name,
                        img: chatlistmodal?.venue?.profile,
                      ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.w,
                          vertical: 1.h),
                      margin: EdgeInsets.symmetric(
                          vertical: 1.h),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            height: 7.h,
                            width: 15.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl:
                                    chatlistmodal?.venue?.profile ?? "",
                                progressIndicatorBuilder:
                                    (context, url, progress) =>
                                        Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => Image.asset(
                                  'assets/user.png',
                                  color: Colors.black,

                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 68.w,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                    chatlistmodal?.venue?.name ?? "",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          fontFamily: 'sofi',
                                          color: Colors.black),
                                    ),
                                    Text(
                                        chatlistmodal?.venue?.lastChatMessageInfo == null ? "":  DateFormat('HH:mm').format(DateTime.parse(chatlistmodal?.venue?.lastChatMessageInfo?.createdAt ?? "")) ,
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'soi',
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 0.5.h,),
                              SizedBox(
                                width: 52.w,
                                child: Text(
                                 chatlistmodal?.venue?.lastChatMessageInfo == null?"":chatlistmodal?.venue?.lastChatMessageInfo?.messageType == "2"?"Image":chatlistmodal?.venue?.lastChatMessageInfo?.messageType == "3"?"Video":chatlistmodal?.venue?.lastChatMessageInfo?.messageType == "4"?"File" :chatlistmodal?.venue?.lastChatMessageInfo?.message ?? "",
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'soi',
                                      color: Colors.black54),
                                ),
                              )
                            ],
                          ),
                          // SizedBox(
                          //   width: 3.w,
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Divider(color: Colors.black87),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 1.h),
                  Row(
                    children: [
                      SizedBox(width: 2.w),
                      Text(
                        'Suppliers ',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontFamily: 'sofi',
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
            chatlistmodal?.suppliers?.length == 0 ? Text("No Supplier available") :SliverList.builder(
              itemCount: chatlistmodal?.suppliers?.length,
              itemBuilder: (context, index) {
                String? formattedTime;
                if(chatlistmodal?.suppliers?[index].lastChatMessageInfo1 != null ){
                  DateTime dateTime = DateTime.parse(chatlistmodal?.suppliers?[index].lastChatMessageInfo1?.createdAt ?? "");
                  DateFormat timeFormat = DateFormat('HH:mm'); // Customize the format as needed
                   formattedTime = timeFormat.format(dateTime);
                }
                else{
                  formattedTime = "";
                }
                return InkWell(
                  onTap: () {
                    print(chatlistmodal?.suppliers?[index].profile);
                    Get.to(Msg2(
                      id:chatlistmodal?.suppliers?[index].id,
                       name: chatlistmodal?.suppliers?[index].name,
                      img: chatlistmodal?.suppliers?[index].profile,
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 1.h),
                    margin: EdgeInsets.symmetric(
                        vertical: 1.h),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 1.w),
                          height: 7.h,
                          width: 15.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(90),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: chatlistmodal?.suppliers?[index].profile ?? "",
                              progressIndicatorBuilder:
                                  (context, url, progress) =>
                                      CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Image.asset(
                                'assets/icons/user.png',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: 3.w,
                        // ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 68.w,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                   chatlistmodal?.suppliers?[index].name ?? "",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                        fontFamily: 'sofi',
                                        color: Colors.black),
                                  ),
                                  Text(
                                   formattedTime,
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'sofi',
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 1.h,),
                            SizedBox(
                              width: 52.w,
                              child: Text(
                                chatlistmodal?.suppliers?[index].lastChatMessageInfo1 == null?"":chatlistmodal?.suppliers?[index].lastChatMessageInfo1?.messageType == "2"?"Image":chatlistmodal?.suppliers?[index].lastChatMessageInfo1?.messageType == "3"?"Video":chatlistmodal?.suppliers?[index].lastChatMessageInfo1?.messageType == "4"?"File" :chatlistmodal?.suppliers?[index].lastChatMessageInfo1?.message ?? "",
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'sofi',
                                    color: Colors.black54),
                              ),
                            )
                          ],
                        ),
                        // SizedBox(
                        //   width: 3.w,
                        // ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 10.h,
            )),
          ]),
        ),
      ),
    );
  }

  // Widget searchBox() {
  //   return Container(
  //     alignment: Alignment.center,
  //     height: 6.h,
  //     padding: const EdgeInsets.symmetric(horizontal: 7),
  //     decoration: BoxDecoration(
  //       border: Border.all(color: Colors.black),
  //       borderRadius: BorderRadius.circular(90),
  //     ),
  //     child: TextField(
  //       controller: _search,
  //       onChanged: (value) {},
  //       style:
  //           TextStyle(color: Colors.black, fontSize: 12.sp, fontFamily: 'get'),
  //       decoration: InputDecoration(
  //         prefixIcon: Icon(
  //           Icons.search,
  //           color: Colors.black,
  //           size: 25,
  //         ),
  //         prefixIconConstraints: BoxConstraints(
  //           maxHeight: 35,
  //           minWidth: 40,
  //         ),
  //         border: InputBorder.none,
  //         hintText: 'Search',
  //         hintStyle: TextStyle(color: Colors.black, fontFamily: 'get'),
  //       ),
  //     ),
  //   );
  // }

  Widget search() {
    return Container(
      width: 95.w,
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.4.h),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        // controller: _search,
        onChanged: (value) {},
        style: TextStyle(color: Colors.black, fontFamily: 'Meta1'),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(CupertinoIcons.search,
              color: Colors.black.withOpacity(0.65)),
          hintText: 'Search',
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.65), fontFamily: 'Meta1'),
        ),
      ),
    );
  }
  chatlistap(){
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().chatlistapi().then((response) async {
          chatlistmodal = ChatListModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && chatlistmodal?.status == "1") {

            setState(() {
              isLoading =false;
            });
          }
          else {
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
  Widget searchBox() {
    return Container(
      alignment: Alignment.center,
      width: 94.w,
      height: 6.5.h,
      padding:EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color:Colors.white),
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
}
