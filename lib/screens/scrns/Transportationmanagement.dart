import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/scrns/BookingDetailsPage.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

class BookingListPage extends StatefulWidget {
  const BookingListPage({super.key});

  @override
  State<BookingListPage> createState() => _BookingListPageState();
}

class book {
  String? image;
  String? name;
  String? name2;
  String? name3;
  String? name4;
  String? rent;

  book(
    this.image,
    this.name,
    this.rent,
    this.name2,
    this.name3,
    this.name4,
  );
}

List<book> booka = [
  book(
      'https://www.transparentpng.com/thumb/car-png/car-free-transparent-png-8.png',
      '2People ',
      "525/",
      "Km",
      "Gasoline",
      "Manual"),
  book('https://freepngimg.com/thumb/car/4-2-car-png-hd.png', '4People', "52/",
      "Km", "Diesel", "Automatic"),
  book(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeGqNWS9lWDFm9YMaCH8-onzHF6RWwjSoeSOgQQSFn-52EqBeHENTcI6cCK3Pw7-d3CSk&usqp=CAU',
      '6People',
      "250/",
      "Km",
      "Diesel",
      "Automatic"),
  book(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaafm0IwebkU4howREuzOCgn197iCGDF-DcC3ZJoNZA1WdQaUtS9rETN8exBr7l-fxWq0&usqp=CAU',
      '8People',
      "879/",
      "Km",
      "Diesel",
      "Manual"),
  book(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7t99en4INjyP9-fb86ADeVf0ih306dlGT1pLfw5HNq-L7vRHRFul6OGZFnJXIX82raJc&usqp=CAU',
      '10People',
      "220/",
      "Km",
      "Gasoline",
      "Manual"),
  book('https://townelivery.com/wp-content/uploads/2019/05/tran-2-898x558.png',
      '12People', "325", "Km", "Gasoline", "Manual"),
];
List cate = ['All', 'Featured Cars', 'Family Car', 'Luxury Car', 'Top Rated'];
TextEditingController _search = TextEditingController();

int sel = 0;

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _BookingListPageState extends State<BookingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      drawer: drawer1(),
      key: scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     IconButton(
                    //         onPressed: () {
                    //           Get.back();
                    //         },
                    //         icon: Icon(
                    //           Icons.arrow_back_ios_new_rounded,
                    //           color: Colors.blue,
                    //           size: 23.sp,
                    //         )),
                    //     Text(
                    //       "Transportation",
                    //       style: TextStyle(
                    //         fontSize: 17.sp,
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
                    header(text: "Transportation",callback: (){
                      Get.back();
                    },callback1: (){
                      scaffoldKey.currentState?.openDrawer();
                    }),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          searchBox1(),
                          SizedBox(
                            width: 1.w,
                          ),
                          Container(
                              padding: EdgeInsets.all(2.8.w),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(11)),
                              child: Icon(
                                CupertinoIcons.sort_up_circle,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    SizedBox(
                      height: 6.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      sel = index;
                                    });
                                  },
                                  child: Container(
                                    height: 5.h,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.h, horizontal: 8.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: sel == index
                                            ? Colors.blue
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Text(cate[index],
                                        style: TextStyle(
                                            fontSize: 12.5.sp,
                                            color: sel == index
                                                ? Colors.white
                                                : Colors.black,
                                            fontFamily: 'sofi',
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: cate.length,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'Select Transportation ',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'sofi',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //
                mainAxisSpacing: 1.h,
                crossAxisSpacing: 0.5.w,

                // childAspectRatio: 0.65 / 1,
                childAspectRatio: 0.60 / 1,
              ),
              itemCount: booka.length, // The number of items in the grid
              itemBuilder: (BuildContext context, int index) {
                // Build each item in the grid
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12.0), // Control the border radius here
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: CachedNetworkImage(
                          imageUrl: booka[index].image ?? "",
                          fit: BoxFit.cover,
                          height: 17.h,
                          width: 35.w,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: imageProvider,
                                // fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 1.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.people,
                                      size: 12.sp,
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Text(
                                      booka[index].name ?? "",
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'sofi',
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$ ' + (booka[index].rent).toString(),
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'sofi',
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      booka[index].name2.toString(),
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'sofi',
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: 1,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Row(
                            //       children: [
                            //         Icon(
                            //           Icons.local_gas_station,
                            //           size: 15.sp,
                            //           color: Colors.black.withOpacity(0.6),
                            //         ),
                            //         SizedBox(
                            //           width: 1.w,
                            //         ),
                            //         Text(
                            //           booka[index].name3 ?? "",
                            //           style: TextStyle(
                            //               fontSize: 10.sp,
                            //               fontFamily: 'sofi',
                            //               fontWeight: FontWeight.bold,
                            //               letterSpacing: 1,
                            //               color: Colors.black),
                            //         ),
                            //       ],
                            //     ),
                            //     SizedBox(
                            //       height: 2.h,
                            //     ),
                            //     // Row(
                            //     //   children: [
                            //     //     Icon(
                            //     //       Icons.auto_mode_rounded,
                            //     //       size: 12.sp,
                            //     //       color: Colors.black.withOpacity(0.6),
                            //     //     ),
                            //     //     SizedBox(
                            //     //       width: 1.w,
                            //     //     ),
                            //     //     Text(
                            //     //       booka[index].name4 ?? "",
                            //     //       style: TextStyle(
                            //     //           fontSize: 10.sp,
                            //     //           fontFamily: 'sofi',
                            //     //           fontWeight: FontWeight.bold,
                            //     //           letterSpacing: 1,
                            //     //           color: Colors.black),
                            //     //     ),
                            //     //   ],
                            //     // ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(BookingDetailsPage());
                              },
                              child: Container(
                                height: 5.h,
                                width: 39.w,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(25.sp),
                                ),
                                child: Center(
                                    child: Text(
                                  "View Details",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.white,
                                      fontFamily: 'get'),
                                )),
                              ),
                            ),
                          ]),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      width: 80.w,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        // controller: _search,
        onChanged: (value) {},
        style: TextStyle(color: Colors.black, fontFamily: 'Meta1'),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.black, fontFamily: 'Meta1'),
        ),
      ),
    );
  }

  Widget searchBox1() {
    return Container(
      alignment: Alignment.center,
      width: 80.w,
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
