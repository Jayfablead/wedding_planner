import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/AddtobudgetModal.dart';
import 'package:wedding_planner/Modal/MybudgetModal.dart';
import 'package:wedding_planner/Modal/RemovefrombudgetModal.dart';
import 'package:wedding_planner/Modal/SetbudgetModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/main.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../../widgets/const.dart';
import '../../widgets/drawer.dart';
import '../pages2/quoatelist2.dart';

class ViewBudget extends StatefulWidget {
  const ViewBudget({super.key});

  @override
  State<ViewBudget> createState() => _ViewBudgetState();
}

final GlobalKey<ScaffoldState> scaffoldKey4 = GlobalKey<ScaffoldState>();

class icon {
  String? image;
  String? name;
  String? price;

  icon(
    this.image,
    this.name,
    this.price,
  );
}

List<icon> Icns = [
  icon('https://cdn-icons-png.flaticon.com/512/4474/4474469.png', 'Venue',
      '2500'),
  icon(
      'https://www.seekpng.com/png/full/41-415194_set-menu-food-black-icon.png',
      'Food',
      '2500'),
  icon('https://cdn-icons-png.flaticon.com/512/2907/2907439.png', 'Drinks',
      '500'),
  icon(
      'https://cdn-icons-png.flaticon.com/512/1683/1683807.png', 'Cake', '500'),
  icon(
      'https://i.pinimg.com/originals/61/3a/4f/613a4f9d74d7efc8fb5fc28c8a63446c.png',
      'Rings',
      '500'),
  icon('https://static.thenounproject.com/png/639559-200.png', 'Ceremony',
      '1000'),
  icon('https://cdn-icons-png.flaticon.com/512/2956/2956744.png', 'Photos',
      '1000'),
  icon('https://cdn-icons-png.flaticon.com/512/6491/6491292.png', 'Transport',
      '1000'),
  icon('https://cdn-icons-png.flaticon.com/512/2706/2706309.png', 'Planners',
      '1000'),
];

class _ViewBudgetState extends State<ViewBudget> {
  TextEditingController _budget = TextEditingController();
  bool isLoading =true;
  // int? setit =3;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      setit = -3;
    });
    viewbudgetap();
  }
  int? setid;
  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
        bottomNavigationBar: bottomnavbar(selit: -3),
        extendBody: true,
        drawer: drawer1(),
        key: scaffoldKey,
        body:isLoading? Container():SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              children: [
                Column(
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
                    //       "Budget",
                    //       style: TextStyle(
                    //         fontSize: 18.sp,
                    //         fontFamily: 'sofi',
                    //         color: Colors.blue,
                    //         letterSpacing: 1,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //     IconButton(
                    //         onPressed: () {
                    //           openDrawer();
                    //         },
                    //         icon: Icon(
                    //           Icons.menu_rounded,
                    //           color: Colors.blue,
                    //           size: 23.sp,
                    //         ))
                    //   ],
                    // ),

                    header(text: "Budget",callback1: (){
                      scaffoldKey.currentState?.openDrawer();
                    }),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      height: 15.h,
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Budget : ',
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        fontFamily: 'sofi',
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    Text(
                                      '\$ ' + (mybudgetmodal?.budgetInfo?.budget).toString(),
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontFamily: 'sofi',
                                        letterSpacing: 1,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 8.h,
                                  width: 0.3.w,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Spent : ',
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        fontFamily: 'sofi',
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    Text(
                                      '\$ ' + (mybudgetmodal?.budgetInfo?.finalCost).toString(),
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontFamily: 'sofi',
                                        letterSpacing: 1,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 2.h,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     InkWell(
                    //       onTap: (){
                    //        setbudget();
                    //       },
                    //       child: Container(
                    //         padding: EdgeInsets.all(2.w),
                    //         decoration: BoxDecoration(
                    //             color: Colors.blue,
                    //             borderRadius: BorderRadius.circular(25)),
                    //         child: Row(
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             Icon(Icons.add, size: 19.sp, color: Colors.white),
                    //             SizedBox(width: 1.5.w),
                    //             Text(
                    //               'Add Items ',
                    //               style: TextStyle(
                    //                   fontSize: 15.sp,
                    //                   color: Colors.white,
                    //                   fontFamily: 'sofi',
                    //                   letterSpacing: 1,
                    //                   fontWeight: FontWeight.bold),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 3.h,
                    ),
                    mybudgetmodal?.budgetItems?.length == 0? Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60.h,
                      alignment: Alignment.center,
                      child: Text(
                       "No item added to budget.",
                        style: TextStyle(
                            color:
                            Colors.black.withOpacity(0.7),
                            overflow: TextOverflow.ellipsis,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ): Column(
                      children: [
                        for(int index =0;index<(mybudgetmodal?.budgetItems?.length ?? 0);index++)...[
                          Stack(
                            children: [
                              Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Container(
                                    height: 18.h,
                                    padding: EdgeInsets.all(1.w),
                                    margin: EdgeInsets.symmetric(horizontal: 1.w),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin:
                                          EdgeInsets.symmetric(horizontal: 0.5.w),
                                          height: 16.h,
                                          width: 30.w,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl:
                                              'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
                                              progressIndicatorBuilder:
                                                  (context, url, progress) => Center(
                                                  child:
                                                  CircularProgressIndicator()),
                                              errorWidget: (context, url, error) =>
                                                  Image.asset(
                                                    'assets/deprf.png',
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: 54.w,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(left: 1.w),
                                                    child: Text(
                                                     mybudgetmodal?.budgetItems?[index].supplierInfo?.name ?? "",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13.sp,
                                                          fontWeight: FontWeight.w600),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 1.h),
                                            SizedBox(
                                              width: 54.w,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(left: 1.w),
                                                    child: Text(
                                                      mybudgetmodal?.budgetItems?[index].supplierInfo?.category ?? "",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13.sp,
                                                          fontWeight: FontWeight.w600),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 1.h),
                                            Container(
                                              padding: EdgeInsets.only(left: 1.w),
                                              width: 55.w,
                                              child: Text(
                                                mybudgetmodal?.budgetItems?[index].supplierInfo?.description ?? "",
                                                maxLines: 2,
                                                style: TextStyle(
                                                    color:
                                                    Colors.black.withOpacity(0.7),
                                                    overflow: TextOverflow.ellipsis,
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                            SizedBox(height: 1.h),
                                            // Row(
                                            //   children: [
                                            //     Icon(
                                            //       Icons.location_on_outlined,
                                            //       size: 15.sp,
                                            //       color: Colors.black.withOpacity(0.8),
                                            //     ),
                                            //     SizedBox(
                                            //       width: 1.w,
                                            //     ),
                                            //     // Text(
                                            //     //     mybudgetmodal?.budgetItems?[index].supplierInfo?. ?? "",
                                            //     //   style: TextStyle(
                                            //     //       color:
                                            //     //       Colors.black.withOpacity(0.8),
                                            //     //       fontSize: 12.sp,
                                            //     //       fontWeight: FontWeight.w600),
                                            //     // ),
                                            //   ],
                                            // ),
                                            // SizedBox(height: 1.h),
                                            Container(
                                              padding: EdgeInsets.only(left: 1.w),
                                              child: Text(
                                                  "\$ "+ (mybudgetmodal?.budgetItems?[index].supplierInfo?.cost).toString(),
                                                style: TextStyle(
                                                    color:
                                                    Colors.black.withOpacity(0.8),
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ),
                              Positioned(
                                left: 84.w,
                                bottom: 14.5.h,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      setid= index;
                                    });
                                    remove();
                                  },
                                  icon: Icon(Icons.remove_circle_rounded,
                                      color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                        ]
                      ],
                    ),

                    SizedBox(
                      height: 2.h,
                    )
                  ],
                ),


              ],
            )



            ),
        ),

      ),
    );
  }
  setbudget(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.grey.shade100,
          child: Container(
            width: 85.w,
            padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 3.h,
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    "Add Your Budget",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      decorationColor: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
                TextFormField(

                  controller: _budget,
                  decoration: InputDecoration(
                    hintText: 'Enter total budget',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    errorStyle: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'sofi',
                        letterSpacing: 0.7,
                        fontWeight: FontWeight.bold),

                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 2.h),
                InkWell(
                  onTap: () {
                    setbudgetap();
                  },
                  child: Container(
                    width: 50.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25.sp),
                    ),
                    child: Center(
                        child: Text(
                          "Add Budget",
                          style: TextStyle(
                              fontSize: 17.sp,
                              color: Colors.white,
                              fontFamily: 'get'),
                        )),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),





              ],
            ),
          ),
        );
      },
    );
  }
  setbudgetap(){
    final Map<String, String> data = {};
    data['budget'] = _budget.text.trim().toString();

    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().setbudgetapi(data).then((response) async {
          setbudgetmodal = SetbudgetModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && setbudgetmodal?.status == "1") {
              print(setbudgetmodal?.message);
              _budget.text ="";
              viewbudgetap();
              Get.back();

          }
          else {

          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
  removefrombudgetap(){

    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().removefrombudgetapi(mybudgetmodal?.budgetItems?[setid!].id).then((response) async {
          removefrombudget = RemovefrombudgetModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && removefrombudget?.status == "1") {
            viewbudgetap();
            Get.back();
          }
          else {

          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
  // addtobudgetap(){
  //   final Map<String, String> data = {};
  //   data['uid'] = (userData?.user?.id).toString();
  //   data['category_id']="2";
  //   data['supplier_id'] ="23";
  //   checkInternet().then((internet) async {
  //     if (internet) {
  //       taskprovider().addtobudgetapi(data).then((response) async {
  //         addtobudgetmodal = addtobudgetModal.fromJson(json.decode(response.body));
  //         if (response.statusCode == 200 && addtobudgetmodal?.status == "1") {
  //
  //
  //         }
  //         else {
  //
  //         }
  //       });
  //     } else {
  //       buildErrorDialog(context, 'Error', "Internet Required");
  //     }
  //   });
  // }
  viewbudgetap(){
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().mybudgetapi().then((response) async {
          mybudgetmodal = MybudgetModal.fromJson(json.decode(response.body));
         print(mybudgetmodal?.budgetInfo?.budget);
          print(mybudgetmodal?.budgetInfo?.finalCost);
          if (response.statusCode == 200 && mybudgetmodal?.status == "1") {
            print(mybudgetmodal?.budgetItems?.length);
            setState(() {
              isLoading=false;
            });
          }
          else if(response.statusCode == 200 && mybudgetmodal?.status == "2"){
            setbudget();
            setState(() {
              isLoading=false;
            });
          }
          else {
            setState(() {
              isLoading=false;
            });
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
  remove(){
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
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 3.h),
                    Text(

                          'Are You Sure You Want to remove This from budget?',

                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'sofi',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          height: 0.17.h,
                          letterSpacing: 1),
                    ),
                    SizedBox(height: 3.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                 removefrombudgetap();
                                },
                                child: Container(
                                  width: 30.w,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(2.5.w),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontFamily: 'sofi',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  width: 30.w,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(2.5.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontFamily: 'sofi',
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
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
                    icon: Icon(CupertinoIcons.clear_circled_solid)))
          ],
        );
      },
    );
  }



}
