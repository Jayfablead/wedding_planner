import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/chnages/Meetings%20Page.dart';
import 'package:wedding_planner/new%20pages/Check%20List.dart';
import 'package:wedding_planner/new%20pages/NotificationScreen.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class YellowHomeScreen extends StatefulWidget {
  int? sele;

  YellowHomeScreen({super.key, required this.sele});

  @override
  State<YellowHomeScreen> createState() => _YellowHomeScreenState();
}

class cate {
  String? image;
  String? name;

  cate(
    this.image,
    this.name,
  );
}

class cate1 {
  String? image;
  String? name;
  String? desc;

  cate1(
    this.image,
    this.name,
    this.desc,
  );
}

class kop {
  String? image;
  String? name;
  String? dec;
  String? price;
  String? btn;

  kop(
    this.image,
    this.name,
    this.dec,
    this.price,
    this.btn,
  );
}

List<cate> Categories = [
  cate('https://cdn-icons-png.flaticon.com/512/6491/6491166.png', 'Wedding '),
  cate(
      'https://cdn-icons-png.flaticon.com/512/3436/3436370.png', 'Engagement '),
  cate('https://cdn-icons-png.flaticon.com/512/6117/6117300.png',
      'Anniversary '),
  cate('https://cdn-icons-png.flaticon.com/512/2454/2454313.png', 'Birthday '),
  cate('https://cdn-icons-png.flaticon.com/512/6491/6491166.png', 'Wedding '),
];
List<cate1> venue = [
  cate1(
      'https://media.weddingz.in/images/98203e459408c4f2f9c9014d9a6f669f/luxury-wedding-venues-in-surat-that-you-must-check-out-prior-to-finalizing-your-wedding-destination.jpg',
      'Dining',
      'A Big Hall with sitting'),
  cate1(
      'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
      'Royal Decor',
      'A Royal Decoration venue'),
  cate1(
      'https://media.weddingz.in/images/98203e459408c4f2f9c9014d9a6f669f/luxury-wedding-venues-in-surat-that-you-must-check-out-prior-to-finalizing-your-wedding-destination.jpg',
      'Dining',
      'A Big Hall with sitting'),
  cate1(
      'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
      'Royal Decor',
      'A Royal Decoration venue'),
  cate1(
      'https://media.weddingz.in/images/98203e459408c4f2f9c9014d9a6f669f/luxury-wedding-venues-in-surat-that-you-must-check-out-prior-to-finalizing-your-wedding-destination.jpg',
      'Dining',
      'A Big Hall with sitting'),
  cate1(
      'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
      'Royal Decor',
      'A Royal Decoration venue'),
];
TextEditingController _search = TextEditingController();
int sel = 1;

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
List<kop> Supaliers = [
  kop(
      "https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg",
      "Flower Suppliers",
      "Flower suppliers provide a wide range of fresh and beautiful flowers to meet various floral needs",
      "\$250",
      "View Detail"),
  kop(
      "https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg",
      "Flower Suppliers",
      "Flower suppliers provide a wide range of fresh and beautiful flowers to meet various floral needs",
      "\$250",
      "View Detail"),
  kop(
      "https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg",
      "Flower Suppliers",
      "Flower suppliers provide a wide range of fresh and beautiful flowers to meet various floral needs",
      "\$250",
      "View Detail"),
  kop(
      "https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg",
      "Flower Suppliers",
      "Flower suppliers provide a wide range of fresh and beautiful flowers to meet various floral needs",
      "\$250",
      "View Detail"),
  kop(
      "https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg",
      "Flower Suppliers",
      "Flower suppliers provide a wide range of fresh and beautiful flowers to meet various floral needs",
      "\$250",
      "View Detail"),
];

class _YellowHomeScreenState extends State<YellowHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      sel = 1;
    });
  }

  int? sel1 = 0;
  List<String> type = ["All Suppliers", "To Do", "Meeting"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      key: scaffoldKey,
      extendBody: true,
      drawer: drawer1(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 4.5.h,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 92.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Hi, Nami & Zoro',
                                  style: TextStyle(
                                      fontSize: 23.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: Colors.blue),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Get.to(NotificationScreen());
                                        },
                                        icon: Icon(
                                          Icons.notifications_none_rounded,
                                          color: Colors.blue,
                                          size: 21.sp,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          scaffoldKey.currentState
                                              ?.openDrawer();
                                        },
                                        icon: Icon(
                                          Icons.menu_rounded,
                                          color: Colors.blue,
                                          size: 23.sp,
                                        )),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: .50.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.date_range_outlined,
                                    color: Colors.black.withOpacity(0.75)),
                                SizedBox(width: 2.w),
                                Padding(
                                  padding: EdgeInsets.only(top: 0.4.h),
                                  child: Text(
                                    '20-03-2024',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontFamily: 'sofi',
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                        color: Colors.black.withOpacity(0.75)),
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
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  searchBox(),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),

              Container(
                height: 4.5.h,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            sel1 = index;
                          });
                          sel1 == 1
                              ? Get.to(Check_list())
                              : sel1 == 2
                                  ? Get.to(MeetingsPage(
                                      sele: 0,
                                    ))
                                  : Container();
                          print(index);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 3.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: sel1 == index ? Colors.blue : Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          margin: EdgeInsets.symmetric(horizontal: 2.w),
                          child: Text(type[index],
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'sofi',
                                  color: sel1 == index
                                      ? Colors.white
                                      : Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1)),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemCount: Supaliers.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 80.w,
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5.sp),
                                  width: 85.w,
                                  margin: EdgeInsets.symmetric(horizontal: 1.0),
                                  // decoration: BoxDecoration(
                                  //   borderRadius:
                                  //   BorderRadius.circular(25),
                                  //
                                  //   // border:  Border.all(width: 0.5,color: Colors.),
                                  //   gradient: LinearGradient(
                                  //     // begin: Alignment.topCenter,
                                  //     // end: Alignment.bottomCenter,
                                  //     // begin: Alignment.center,
                                  //     begin: Alignment.topRight,
                                  //     end: Alignment.bottomLeft,
                                  //     // stops: [0.0, 0.5, 1.0], // Gradient stops at 0.0, 0.5, and 1.0
                                  //
                                  //     colors: [
                                  //       Colors.blue,
                                  //       Colors.lightBlueAccent.shade200,
                                  //       Colors.blue,
                                  //       Colors.lightBlueAccent.shade200,
                                  //       Colors.lightBlueAccent,
                                  //       Colors.lightBlueAccent.shade200,
                                  //       Colors.white,
                                  //     ],
                                  //   ),
                                  // ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(17),
                                    child: Image.network(
                                      Supaliers[index].image.toString(),
                                      fit: BoxFit.cover, height: 20.h, width: 100.w,
                                      // Cover the entire screen
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 3.w),
                                  child: Text(Supaliers[index].name.toString(),
                                      style: TextStyle(
                                          fontSize: 14.5.sp,
                                          fontFamily: 'sofi',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          letterSpacing: 1)),
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 3.w),
                                  child: Text(Supaliers[index].dec.toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14.5.sp,
                                          fontFamily: 'sofi',
                                          color: Colors.black54,
                                          letterSpacing: 1)),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 4.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("Starting Price : ",
                                          style: TextStyle(
                                              fontSize: 14.5.sp,
                                              fontFamily: 'sofi',
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black54,
                                              letterSpacing: 1)),
                                      Text(Supaliers[index].price.toString(),
                                          style: TextStyle(
                                              fontSize: 14.5.sp,
                                              fontFamily: 'sofi',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              letterSpacing: 1))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: 50.w,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.h, horizontal: 5.w),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: Center(
                                          child: Text(
                                              Supaliers[index].btn.toString(),
                                              style: TextStyle(
                                                  fontSize: 17.sp,
                                                  fontFamily: 'sofi',
                                                  color: Colors.white,
                                                  letterSpacing: 1)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Positioned(
                                left:60.w,
                                top: 1.5.h,
                                child: Container(
                                  height: 10.w,
                                  width: 10.w,

                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(
                                    child: IconButton(
                                        onPressed:(){
                                          setState((){
                                          });


                                        } ,icon: Icon(Icons.favorite,color: Colors.red,size: 20.sp,)),
                                  ),
                                ))
                          ],
                        ),
                      );
                    }),
              )

              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(
              //           'Wedding Suppliers',
              //           style: TextStyle(
              //               fontSize: 16.sp,
              //               fontFamily: 'sofi',
              //               fontWeight: FontWeight.bold,
              //               letterSpacing: 1,
              //               color: Colors.black),
              //         ),
              //         TextButton(
              //           onPressed: () {},
              //           child: Text(
              //             'View All',
              //             style: TextStyle(
              //                 fontSize: 14.5.sp,
              //                 fontFamily: 'sofi',
              //                 fontWeight: FontWeight.bold,
              //                 letterSpacing: 1,
              //                 color: Colors.blue),
              //           ),
              //         ),
              //       ],
              //     ),
              //     SizedBox(
              //       height: 27.5.h,
              //       child: ListView.builder(
              //         padding: EdgeInsets.zero,
              //         scrollDirection: Axis.horizontal,
              //         itemCount: venue.length,
              //         itemBuilder: (context, index) {
              //           return Container(
              //             margin: EdgeInsets.symmetric(
              //                 vertical: 0.5.h, horizontal: 1.w),
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //               children: [
              //                 Container(
              //                   margin: EdgeInsets.symmetric(horizontal: 0.w),
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(10)),
              //                   height: 21.h,
              //                   width: 42.w,
              //                   child: ClipRRect(
              //                     borderRadius: BorderRadius.circular(10),
              //                     child: CachedNetworkImage(
              //                       fit: BoxFit.cover,
              //                       imageUrl: venue[index].image.toString(),
              //                       progressIndicatorBuilder:
              //                           (context, url, progress) => Center(
              //                               child: CircularProgressIndicator()),
              //                       errorWidget: (context, url, error) =>
              //                           Image.asset(
              //                         'assets/deprf.png',
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsets.only(left: 1.w),
              //                   child: Text(
              //                     venue[index].name.toString(),
              //                     style: TextStyle(
              //                         color: Colors.black,
              //                         fontSize: 15.sp,
              //                         fontFamily: 'sofi',
              //                         fontWeight: FontWeight.w600),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           );
              //         },
              //       ),
              //     ),
              //     SizedBox(height: 11.h),
              //   ],
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomnavbar(selit: widget.sele),
    );
  }

  Widget searchBox() {
    return Container(
      alignment: Alignment.center,
      width: 94.w,
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
}
