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
                    height: 5.h,
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
                  Container(
                    height: 81.h,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 1.h),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        lists[index].chek = ! lists[index].chek!;
                                      });
                                    },
                                    child: Image.asset(
                                      lists[index].chek!
                                          ? 'assets/check/check.png'
                                          : 'assets/check/nocheck.png',
                                      color: Colors.pink,
                                      height: 3.h,
                                      fit: BoxFit.cover,
                                      width: 6.w,
                                    ),
                                  ),
                                  Container(
                                    width: 80.w,
                                    margin: EdgeInsets.only(top: 0.5.h),
                                    child: Text(
                                      lists[index].title ?? '',
                                      style: TextStyle(
                                          color: lists[index].chek!
                                              ? Colors.black54
                                              : Colors.black87,
                                          decoration: lists[index].chek!
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                          decorationColor: Colors.black87,
                                          decorationThickness: 2,
                                          fontSize: 13.sp,
                                          fontFamily: 'sofi',
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 0.5.h),
                              Divider(
                                color: Colors.black87,
                              ),
                            ],
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
                              color: Colors.pink,
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
}
