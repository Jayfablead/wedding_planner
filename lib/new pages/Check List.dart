import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/CheckListModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/widgets/addcheck.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/load.dart';

class Check_list extends StatefulWidget {
  const Check_list({super.key});

  @override
  State<Check_list> createState() => _Check_listState();
}

final GlobalKey<ScaffoldState>  scaffoldKey = GlobalKey<ScaffoldState>();

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
  bool isLoading =true;
  int? sel1=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checklistap();
  }
  List<String> type = ["Today Alert","Completed","Pending"];
  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        key:  scaffoldKey,
        drawer: drawer1(),
        body: isLoading? Container():SingleChildScrollView(
            child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Stack(
              children: [
                SizedBox(
                  height: 100.h,
                  child: Column(children: [
                    SizedBox(
                      height: 5.5.h,
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
                               scaffoldKey.currentState?.openDrawer();
                            },
                            icon: Icon(Icons.menu_rounded))
                      ],
                    ),
                    SizedBox(height: 1.h),
                    search(),
                    SizedBox(height: 1.h),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 4.5.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context,index){
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  sel1 = index;
                                });
                                checklistap();
                                print(index);
                              },
                              child: Container(
                                padding:
                                EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: sel1 == index ? Colors.blue : Colors.white,
                                    borderRadius: BorderRadius.circular(9)),
                                margin: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Text(type[index],
                                    style: TextStyle(
                                        fontSize: 14.5.sp,
                                        fontFamily: 'sofi',
                                        color: sel1 == index ? Colors.white : Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1)),
                              ),
                            );
                      }),
                    ),
                    SizedBox(height: 1.h),
                 sel1 == 0 ?checklistmodal?.todayAlerts?.length == 0 ? Container(
                     height: 60.h,
                     child: Text("No CheckList" , style: TextStyle(
                       fontSize: 15.sp,
                       fontFamily: 'sofi',
                       letterSpacing: 1,
                       fontWeight: FontWeight.bold,
                     ),)):Container(
                      height: 60.h,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount:sel1==0? (checklistmodal?.todayAlerts?.length) :sel1 == 1? checklistmodal?.completed?.length :checklistmodal?.pending?.length,
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
                                        // setState(() {
                                        //   lists[index].chek = !lists[index].chek!;
                                        // });
                                      },
                                      child:sel1 == 0? (checklistmodal?.todayAlerts?[index].isCompleted == "1")
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
                                            ):sel1 == 1? (checklistmodal?.completed?[index].isCompleted == "1")
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
                                      ):checklistmodal?.pending?[index].isCompleted == "1"
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
                                       sel1== 0 ? (checklistmodal?.todayAlerts?[index].taskTitle).toString() :sel1== 1? (checklistmodal?.completed?[index].taskTitle).toString() :(checklistmodal?.pending?[index].taskTitle).toString()  ,
                                        style: TextStyle(
                                            color: sel1 == 0? (checklistmodal?.todayAlerts?[index].isCompleted == "1"
                                                ? Colors.blue
                                                : Colors.black87) :sel1 == 1? (checklistmodal?.completed?[index].isCompleted == "1"
                                                ? Colors.blue
                                                    : Colors.black87) :(checklistmodal?.pending?[index].isCompleted == "1"
                                                ? Colors.blue
                                                : Colors.black87),

                                            decoration: sel1 == 0? (checklistmodal?.todayAlerts?[index].isCompleted == "1"
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none): sel1 == 1? (checklistmodal?.completed?[index].isCompleted == "1"
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none) : (checklistmodal?.pending?[index].isCompleted == "1"
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none),
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

                      ),
                    ):sel1 ==1 ? checklistmodal?.completed?.length == 0? Container(
                     alignment: Alignment.center,
                     height: 60.h,
                     child: Text("No CheckList"  ,style: TextStyle(
                       fontSize: 15.sp,
                       fontFamily: 'sofi',
                       letterSpacing: 1,
                       fontWeight: FontWeight.bold,
                     ),)):Container(
                   alignment: Alignment.center,
                   height: 60.h,
                   child: ListView.builder(
                     padding: EdgeInsets.zero,
                     itemCount:sel1==0? (checklistmodal?.todayAlerts?.length) :sel1 == 1? checklistmodal?.completed?.length :checklistmodal?.pending?.length,
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
                                     // setState(() {
                                     //   lists[index].chek = !lists[index].chek!;
                                     // });
                                   },
                                   child:sel1 == 0? (checklistmodal?.todayAlerts?[index].isCompleted == "1")
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
                                   ):sel1 == 1? (checklistmodal?.completed?[index].isCompleted == "1")
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
                                   ):checklistmodal?.pending?[index].isCompleted == "1"
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
                                     sel1== 0 ? (checklistmodal?.todayAlerts?[index].taskTitle).toString() :sel1== 1? (checklistmodal?.completed?[index].taskTitle).toString() :(checklistmodal?.pending?[index].taskTitle).toString()  ,
                                     style: TextStyle(
                                         color: sel1 == 0? (checklistmodal?.todayAlerts?[index].isCompleted == "1"
                                             ? Colors.blue
                                             : Colors.black87) :sel1 == 1? (checklistmodal?.completed?[index].isCompleted == "1"
                                             ? Colors.blue
                                             : Colors.black87) :(checklistmodal?.pending?[index].isCompleted == "1"
                                             ? Colors.blue
                                             : Colors.black87),

                                         decoration: sel1 == 0? (checklistmodal?.todayAlerts?[index].isCompleted == "1"
                                             ? TextDecoration.lineThrough
                                             : TextDecoration.none): sel1 == 1? (checklistmodal?.completed?[index].isCompleted == "1"
                                             ? TextDecoration.lineThrough
                                             : TextDecoration.none) : (checklistmodal?.pending?[index].isCompleted == "1"
                                             ? TextDecoration.lineThrough
                                             : TextDecoration.none),
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

                   ),
                 ): checklistmodal?.pending?.length ==0 ? Container(
                   alignment: Alignment.center,
                     height: 60.h,
                     child: Text("No CheckList",  style: TextStyle(
                       fontSize: 15.sp,
                       fontFamily: 'sofi',
                       letterSpacing: 1,
                       fontWeight: FontWeight.bold,
                     ),)) :Container(
                   height: 60.h,
                   child: ListView.builder(
                     padding: EdgeInsets.zero,
                     itemCount:sel1==0? (checklistmodal?.todayAlerts?.length) :sel1 == 1? checklistmodal?.completed?.length :checklistmodal?.pending?.length,
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
                                     // setState(() {
                                     //   lists[index].chek = !lists[index].chek!;
                                     // });
                                   },
                                   child:sel1 == 0? (checklistmodal?.todayAlerts?[index].isCompleted == "1")
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
                                   ):sel1 == 1? (checklistmodal?.completed?[index].isCompleted == "1")
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
                                   ):checklistmodal?.pending?[index].isCompleted == "1"
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
                                     sel1== 0 ? (checklistmodal?.todayAlerts?[index].taskTitle).toString() :sel1== 1? (checklistmodal?.completed?[index].taskTitle).toString() :(checklistmodal?.pending?[index].taskTitle).toString()  ,
                                     style: TextStyle(
                                         color: sel1 == 0? (checklistmodal?.todayAlerts?[index].isCompleted == "1"
                                             ? Colors.blue
                                             : Colors.black87) :sel1 == 1? (checklistmodal?.completed?[index].isCompleted == "1"
                                             ? Colors.blue
                                             : Colors.black87) :(checklistmodal?.pending?[index].isCompleted == "1"
                                             ? Colors.blue
                                             : Colors.black87),

                                         decoration: sel1 == 0? (checklistmodal?.todayAlerts?[index].isCompleted == "1"
                                             ? TextDecoration.lineThrough
                                             : TextDecoration.none): sel1 == 1? (checklistmodal?.completed?[index].isCompleted == "1"
                                             ? TextDecoration.lineThrough
                                             : TextDecoration.none) : (checklistmodal?.pending?[index].isCompleted == "1"
                                             ? TextDecoration.lineThrough
                                             : TextDecoration.none),
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

                   ),
                 ),
                  ]),
                ),
                Positioned(
                  top: 91.5.h,
                  left: 20.w,
                  child: InkWell(
                      onTap: () {
                     Get.to(addchecklist());
                      },
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(2.5.w),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Center(
                                  child: Icon(
                                    CupertinoIcons.add,
                                    size: 18.sp,
                                    color: Colors.white,
                                  )),
                              Text("Add Check List",  style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'sofi',
                                letterSpacing: 1,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),),

                            ],
                          ))),
                ),
              ],
            ),
          ),
        )),
      ),
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
  checklistap(){
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().checklistapi().then((response) async {
          checklistmodal = CheckListModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && checklistmodal?.status == "1") {
              print(checklistmodal?.todayAlerts?[0].taskTitle);
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

}
