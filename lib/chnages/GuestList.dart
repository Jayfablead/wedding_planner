import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/main.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class GuestList extends StatefulWidget {
  const GuestList({super.key});

  @override
  State<GuestList> createState() => _GuestListState();
}

int sel1 = 1;

List cate = ['All', 'Veg', 'Non-Veg', 'Top Rated'];

class _GuestListState extends State<GuestList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      sel1 = 1;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffefefef),
      key: scaffoldKey,
      drawer: drawer1(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            children: [
              SizedBox(height: 5.h),
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
                    'Guest List',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'get',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  IconButton(
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Icon(Icons.menu_rounded)),
                ],
              ),
              SizedBox(height: 1.5.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        sel1 = 1;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 8.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: sel1 == 1 ? Colors.amber : Colors.white,
                          borderRadius: BorderRadius.circular(9)),
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Text('Bride',
                          style: TextStyle(
                              fontSize: 12.5.sp,
                              fontFamily: 'sofi',
                              color: sel1 == 1 ? Colors.white : Colors.amber,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1)),
                    ),
                  ),
                  SizedBox(width: 0.w),
                  InkWell(
                    onTap: () {
                      setState(() {
                        sel1 = 2;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 8.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: sel1 == 2 ? Colors.amber : Colors.white,
                          borderRadius: BorderRadius.circular(9)),
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Text('Groom',
                          style: TextStyle(
                              fontSize: 12.5.sp,
                              fontFamily: 'sofi',
                              color: sel1 == 2 ? Colors.white : Colors.amber,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              sel1 == 2?  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Groom\'s Guests ( 20 )',
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontFamily: 'sofi',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                      Text(
                        'Invites',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'sofi',
                            color: Colors.black87.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 71.h,
                    child: Column(children: [
                      SizedBox(height: 0.5.h),
                      Container(
                        height: 69.5.h,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return   ListTile(
                              title: Text('Haresh Mer ${index +1}',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: 'sofi',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),),
                              trailing: Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                            );

                          },
                          itemCount: 20,
                        ),
                      ),
                    ]),
                  ),
                  Positioned(
                    top: 74.5.h,
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
              ):
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bride\'s Guests ( 15 )',
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontFamily: 'sofi',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                      Text(
                        'Invites',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: 'sofi',
                            color: Colors.black87.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 71.h,
                    child: Column(children: [
                      SizedBox(height: 0.5.h),
                      Container(
                        height: 69.5.h,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return   ListTile(
                              title: Text('Karam Patel ${index +1}',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: 'sofi',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),),
                              trailing: Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                            );

                          },
                          itemCount: 15,
                        ),
                      ),
                    ]),
                  ),
                  Positioned(
                    top: 74.5.h,
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

            ],
          ),
        ),
      ),
    );
  }  Widget checkdetails() {
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
          hintText: 'Guest Name',
          hintStyle: TextStyle(color: Colors.black, fontFamily: 'Meta1'),
        ),
      ),
    );
  }
}
