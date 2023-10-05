import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class Check_list extends StatefulWidget {
  const Check_list({super.key});

  @override
  State<Check_list> createState() => _Check_listState();
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
  checklist('Make All Bookings Page', true),
  checklist('Change Signup Page', false),
  checklist('Make All Certificates Page', true),
  checklist('Make All itinerary Page', false),
  checklist('Make All Budget Page', true),
  checklist('Make All Parcels received', false),
  checklist('Make All Notifications Page', false),
];

class _Check_listState extends State<Check_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          icon: Icon(Icons.arrow_back_ios_new_rounded)),
                      Text(
                        "Check List",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: 'sofi',
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          icon: Icon(Icons.menu_rounded))
                    ],
                  ),
                  SizedBox(height: 1.h),
                  search(),
                  SizedBox(height: 1.h),
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
                                            color: Colors.amber,
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
                                              ? Colors.amber
                                              : Colors.black87,
                                          decoration: lists[index].chek!
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                          decorationColor: Colors.amber,
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
                top: 93.h,
                child: Row(children: [
                  checkdetails(),
                  SizedBox(
                    width: 3.w,
                  ),
                  InkWell(
                      onTap: () {
                        print('Moklyo hoo');
                      },
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(2.5.w),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Icon(
                            CupertinoIcons.add,
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
}
