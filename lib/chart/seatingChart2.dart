import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/main.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class ViewTables2 extends StatefulWidget {
  const ViewTables2({super.key});

  @override
  State<ViewTables2> createState() => _ViewTables2State();
}

int sel1 = 1;
int sel = 1;

class _ViewTables2State extends State<ViewTables2> {
  int? open = 0;
  bool test = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey.shade100,
      key: scaffoldKey,
      drawer: drawer1(),
      bottomNavigationBar: bottomnavbar(selit: -3),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child:
        Column(
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
                    icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.blue,size: 23.sp,)),
                Text(
                  'Guests',
                  style: TextStyle(
                      fontSize: 17.sp, fontFamily: 'sofi',fontWeight: FontWeight.bold,letterSpacing: 1,color: Colors.blue),
                ),
                IconButton(
                    onPressed: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    icon: Icon(Icons.menu_rounded,color: Colors.blue,size: 23.sp,)),
              ],
            ),
            // SizedBox(height: 1.5.h),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     InkWell(
            //       onTap: () {
            //         setState(() {
            //           sel1 = 1;
            //         });
            //       },
            //       child: Container(
            //         padding:
            //         EdgeInsets.symmetric(vertical: 1.3.h, horizontal: 10.w),
            //         alignment: Alignment.center,
            //         decoration: BoxDecoration(
            //             color: sel1 == 1 ? Colors.blue : Colors.white,
            //             borderRadius: BorderRadius.circular(9)),
            //         margin: EdgeInsets.symmetric(horizontal: 2.w),
            //         child: Text('Bride',
            //             style: TextStyle(
            //                 fontSize: 14.5.sp,
            //                 fontFamily: 'sofi',
            //                 color: sel1 == 1 ? Colors.white : Colors.blue,
            //                 fontWeight: FontWeight.bold,
            //                 letterSpacing: 1)),
            //       ),
            //     ),
            //     SizedBox(width: 0.w),
            //     InkWell(
            //       onTap: () {
            //         setState(() {
            //           sel1 = 2;
            //         });
            //       },
            //       child: Container(
            //         padding:
            //         EdgeInsets.symmetric(vertical: 1.3.h, horizontal: 10.w),
            //         alignment: Alignment.center,
            //         decoration: BoxDecoration(
            //             color: sel1 == 2 ? Colors.blue : Colors.white,
            //             borderRadius: BorderRadius.circular(9)),
            //         margin: EdgeInsets.symmetric(horizontal: 2.w),
            //         child: Text('Groom',
            //             style: TextStyle(
            //                 fontSize: 14.5.sp,
            //                 fontFamily: 'sofi',
            //                 color: sel1 == 2 ? Colors.white : Colors.blue,
            //                 fontWeight: FontWeight.bold,
            //                 letterSpacing: 1)),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(height: 1.5.h),
            Column(
              children: [
                for(int index = 0;index<4;index++)...[
                  Container(
                    // height: 7.h,
                    width: MediaQuery.of(context).size.width,

                    decoration: BoxDecoration(
                        color:open == index? Colors.blue:Colors.white,
                        borderRadius: open == index ? BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                            :BorderRadius.circular(20),
                        border: open != index?

                        Border.all(color: Colors.blue,width: 2):Border.all(color: Colors.transparent,width: 2)
                    ),

                    padding: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 3.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Table " + (index+1).toString(),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'sofi',
                            letterSpacing: 1,
                            color: open == index?Colors.white:Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              open  =index;
                            });
                          },
                          child: Icon(Icons.arrow_drop_down_circle_outlined,color:open == index?Colors.white:Colors.blue),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  open == index? Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))

                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 1.h,),
                            Column(
                              children: [
                                Container(
                                  width:40.w,
                                  alignment: Alignment.center,
                                  child: Row(crossAxisAlignment:CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      for(int ind=0 ;ind<4 ;ind++)...[
                                        GestureDetector(
                                          onTap:(){
                                            showdata();
                                          },
                                          child: Column(
                                            children: [
                                              Text((ind+1).toString()),
                                              Icon(Icons.person),
                                            ],
                                          ),
                                        ),
                                      ]

                                    ],
                                  ),
                                ),
                                SizedBox(height: 1.h,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap:(){
                                        showdata();
                                      },
                                      child: Column(
                                        children: [
                                          Text("10"),
                                          Icon(Icons.person),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 1.w,),
                                    Center(
                                      child: Container(
                                        height:7.h,
                                        width:40.w,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(width: 1.w,),
                                    GestureDetector(
                                      onTap:(){
                                        showdata();
                                      },
                                      child: Column(
                                        children: [
                                          Text("5"),
                                          Icon(Icons.person),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.h,),
                                Container(
                                  width:40.w,
                                  alignment: Alignment.center,
                                  child: Row(crossAxisAlignment:CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      for(int ind=9;ind>5;ind--)...[
                                        GestureDetector(
                                          onTap:(){
                                            showdata();
                                          },
                                          child: Column(
                                            children: [
                                              Text((ind).toString()),
                                              Icon(Icons.person),
                                            ],
                                          ),
                                        ),
                                      ]

                                    ],
                                  ),
                                ),
                              ],
                            ),

                            // Row(
                            //   children: [
                            //     Icon(Icons.circle_outlined,color: Colors.grey.shade600,),
                            //     SizedBox(width: 3.w,),
                            //     Text(
                            //       "Bride",
                            //       style: TextStyle(
                            //         fontSize: 16.sp,
                            //         fontFamily: 'sofi',
                            //         letterSpacing: 1,
                            //         color: Colors.blue,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(height: 2.h,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 3.w),
                              child: Row(
                                children: [

                                  Text(
                                    "Available Seats 5 out of 60",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 1.h,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 6.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for(int index =0;index<5;index++)...[
                                    Text(
                                      (index+1).toString()+"-Guest",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontFamily: 'sofi',
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                  ]


                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 1.h,),
                    ],
                  ) :Container(),
                  SizedBox(height: 1.h,),

                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
  showdata(){
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 2.h, horizontal: 3.w),
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text(
                            'Groom\'s Guest',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontFamily: 'sofi',
                                color: Colors.blue,
                                fontWeight:
                                FontWeight.bold,
                                height: 0.17.h,
                                letterSpacing: 1),
                          ),
                        ]),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Icon(CupertinoIcons.person,color: Colors.blue,size: 17.sp),SizedBox(width: 1.w),
                        Text(
                          'Guest Name :  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.blue,
                              fontWeight:
                              FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                        Text(
                          'Steave Austin',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'sofi',
                              color: Colors.black87,
                              fontWeight:
                              FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Icon(Icons.event_seat,color:Colors.blue),
                        SizedBox(width: 1.w),
                        Text(
                          'Seat No :  ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'sofi',
                              color: Colors.blue,
                              fontWeight:
                              FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                        Text(
                          '10',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'sofi',
                              color: Colors.black87,
                              fontWeight:
                              FontWeight.bold,
                              height: 0.17.h,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                  ],
                ),
              ),
            ),
            Positioned(
                right: 0,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(CupertinoIcons
                        .clear_circled_solid)))
          ],
        );
      },
    );
  }
}
