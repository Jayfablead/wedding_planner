import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class Check_list2 extends StatefulWidget {
  const Check_list2({super.key});

  @override
  State<Check_list2> createState() => _Check_listState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

bool ischeck = false;

class checklist {
  String? title;
  bool? chek;

  checklist(
    this.title,
    this.chek,
  );
}

List<checklist> lists = [
  checklist('Make All Bookings Page', false),
  checklist('Change Signup Page', false),
  checklist('Make All Certificates Page', true),
  checklist('Make All itinerary Page', false),
  checklist('Make All Budget Page', true),
  checklist('Make All Parcels received', false),
  checklist('Make All Notifications Page', false),
  checklist('Make All Bookings Page', true),
  checklist('Change Signup Page', false),
  checklist('Make All Certificates Page', true),
  checklist('Make All itinerary Page', false),
  checklist('Make All Budget Page', true),
  checklist('Make All Parcels received', false),
  checklist('Make All Notifications Page', false),
  checklist('Make All Bookings Page', true),
  checklist('Change Signup Page', false),
  checklist('Make All Certificates Page', true),
  checklist('Make All itinerary Page', false),
  checklist('Make All Budget Page', true),
  checklist('Make All Parcels received', false),
  checklist('Make All Notifications Page', false),
];
List<String> type = ["All", "Today Alert", "Completed", "Pending"];

class _Check_listState extends State<Check_list2> {
  TextEditingController _search = TextEditingController();
  bool isLoading = true;
  int? sel1 = 0;
  int? val;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      key: _scaffoldKey,
      drawer: drawer1(),
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Stack(
            children: [
              SizedBox(
                height: 100.h,
                child: Column(children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 23.sp,
                            color: Colors.blue,
                          )),
                      Text(
                        "Check List",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'sofi',
                          letterSpacing: 1,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu_rounded,
                            color: Colors.blue,
                            size: 23.sp,
                          ))
                    ],
                  ),
                  SizedBox(height: 1.h),
                  searchBox1(),
                  SizedBox(height: 2.h),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 4.5.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                sel1 = index;
                              });
                              // checklistap();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.h, horizontal: 5.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: sel1 == index
                                      ? Colors.blue
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Text(type[index],
                                  style: TextStyle(
                                      fontSize: 14.5.sp,
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
                  Container(
                    height: 74.h,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.h, horizontal: 1.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        lists[index].chek = !lists[index].chek!;
                                      });
                                    },
                                    child: lists[index].chek!
                                        ? Icon(
                                            Icons.check_box_rounded,
                                            color: Colors.blue,
                                            size: 22.sp,
                                          )
                                        : Icon(
                                            Icons
                                                .check_box_outline_blank_rounded,
                                            color: Colors.black54,
                                            size: 22.sp,
                                          ),
                                  ),
                                  SizedBox(width: 3.w),
                                  Container(
                                    width: 78.w,
                                    child: Text(
                                      lists[index].title ?? '',
                                      style: TextStyle(
                                          color: lists[index].chek!
                                              ? Colors.blue
                                              : Colors.black87,
                                          decoration: lists[index].chek!
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                          decorationColor: Colors.blue,
                                          decorationThickness: 2,
                                          fontSize: 13.sp,
                                          fontFamily: 'sofi',
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: lists.length,
                    ),
                  ),
                ]),
              ),
              Positioned(
                top: 91.5.h,
                left: 25.w,
                child: InkWell(
                    onTap: () {
                      // Get.to(addchecklist());
                    },
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(2.5.w),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          children: [
                            Center(
                                child: Icon(
                              CupertinoIcons.add,
                              size: 18.sp,
                              color: Colors.white,
                            )),
                            Text(
                              "Add Check List",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'sofi',
                                letterSpacing: 1,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ))),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget checkdetails() {
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
          border: InputBorder.none,
          hintText: 'Add Something',
          hintStyle: TextStyle(color: Colors.black, fontFamily: 'Meta1'),
        ),
      ),
    );
  }

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

  Widget searchBox1() {
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
