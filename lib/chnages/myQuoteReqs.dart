import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class MyQuoateReq extends StatefulWidget {
  const MyQuoateReq({super.key});

  @override
  State<MyQuoateReq> createState() => _MyQuoateReqState();
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

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _MyQuoateReqState extends State<MyQuoateReq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      drawer: drawer1(),
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
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
                        Icons.arrow_back_ios_new_rounded,size: 23.sp,color: Colors.blue,
                      )),
                  Text(
                    "My Quotation Requests",
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.blue,
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
                        Icons.menu_rounded,color: Colors.blue,size: 23.sp,
                      ))
                ],
              ),
              SizedBox(height: 1.h),
              searchBox1(),
              SizedBox(height: 1.h),
              SizedBox(
                height: 79.h,
                child: ListView.builder(
                  itemCount: mesgs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                // Color of the shadow
                                offset: Offset(0, 1.5),
                                // Offset of the shadow (x, y)
                                blurRadius: 8, // Spread of the shadow
                                // How much the shadow extends
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 1.w),
                              height: 8.h,
                              width: 16.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(90),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: mesgs[index].image ?? '',
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
                            SizedBox(
                              width: 5.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 68.w,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        mesgs[index].name ?? '',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                            fontFamily: 'sofi',
                                            color: Colors.black),
                                      ),
                                      Text(
                                        mesgs[index].date ?? '',
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'sofi',
                                            color:
                                                Colors.black.withOpacity(0.5)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 0.8.h),
                                SizedBox(
                                  width: 68.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        mesgs[index].type ?? '',
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'sofi',
                                          color: Colors.black.withOpacity(0.75),
                                        ),
                                      ),
                                      SizedBox(height: 0.8.h),
                                      Text(
                                        mesgs[index].details ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'sofi',
                                          color: Colors.black.withOpacity(0.5),
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      width: 95.w,
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
  Widget searchBox1() {
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
