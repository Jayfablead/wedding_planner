import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/main.dart';
import 'package:wedding_planner/screens/other%20Pages/msg2.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class ChatlistPage extends StatefulWidget {
  int? sele;

  ChatlistPage({super.key, required this.sele});

  @override
  State<ChatlistPage> createState() => _ChatlistPageState();
}

class chat {
  String? image;
  String? name;
  String? msg;
  String? time;

  chat(
    this.image,
    this.name,
    this.msg,
    this.time,
  );
}

List<chat> mesgs = [
  chat(
      'https://e1.pxfuel.com/desktop-wallpaper/238/852/desktop-wallpaper-masque-luffy-smiling-luffy-smile-thumbnail.jpg',
      'Luffy',
      'Moshi Mosh Oreva Monkey d Luffy Kaizoku wo Naru to nido',
      '8:94 AM'),
  chat(
      'https://static.wikia.nocookie.net/fictionalfighters/images/4/48/Sanji.png/revision/latest?cb=20150406032640',
      'Sanji',
      'Hoy Mass Head Punk',
      '9:10 AM'),
  chat(
      'https://w0.peakpx.com/wallpaper/311/533/HD-wallpaper-one-piece-nico-robin-one-piece-two-years-later.jpg',
      'Robin',
      'Oy Zoro kun Ohayoo',
      '9:15 AM'),
  chat(
      'https://i.pinimg.com/736x/59/e3/d2/59e3d2fb93af21511690470abc014831.jpg',
      'Nami',
      'Hey! Dumb Zoro Don\'t Fight ',
      '9:40 AM'),
  chat(
      'https://i.pinimg.com/236x/23/62/50/236250f1055a352c4a0cd5e0a21aaf33.jpg',
      'Chopper',
      'You are Injured Come to me I will Fix You ',
      '10:50 Am'),
];
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomnavbar(selit: widget.sele),
      extendBody: true,
      drawer: drawer1(),
      key: scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(null)),
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          // Scaffold.of(context).openDrawer();
                          openDrawer();
                        },
                        icon: Icon(Icons.menu_rounded))
                  ],
                ),
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
                search(),
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
                      img:
                          'https://scontent.fstv2-1.fna.fbcdn.net/v/t39.30808-6/302609737_457901669687700_1130857970330959168_n.png?_nc_cat=100&ccb=1-7&_nc_sid=a2f6c7&_nc_ohc=XI10lCO6IuYAX8Lj0gN&_nc_ht=scontent.fstv2-1.fna&oh=00_AfB8JGw4fNrPrlgTQkeUx50-WN_gfy5eYLK4R3F4gX8flQ&oe=652A8B76',
                      name: 'TVC Arena',
                    ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                  'https://scontent.fstv2-1.fna.fbcdn.net/v/t39.30808-6/302609737_457901669687700_1130857970330959168_n.png?_nc_cat=100&ccb=1-7&_nc_sid=a2f6c7&_nc_ohc=XI10lCO6IuYAX8Lj0gN&_nc_ht=scontent.fstv2-1.fna&oh=00_AfB8JGw4fNrPrlgTQkeUx50-WN_gfy5eYLK4R3F4gX8flQ&oe=652A8B76',
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'TVC Arena',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                        fontFamily: 'sofi',
                                        color: Colors.black),
                                  ),
                                  Text(
                                    '7:45 AM',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'soi',
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 52.w,
                              child: Text(
                                'Check This Sir, We Made this Full Quotation for Your Wedding',
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'soi',
                                    color: Colors.black54),
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
          SliverList.builder(
            itemCount: mesgs.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(Msg2(
                    img: mesgs[index].image,
                    name: mesgs[index].name,
                  ));
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                              imageUrl: mesgs[index].image ?? '',
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                    mesgs[index].time ?? '',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'soi',
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 52.w,
                              child: Text(
                                mesgs[index].msg ?? '',
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'soi',
                                    color: Colors.black54),
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
}
