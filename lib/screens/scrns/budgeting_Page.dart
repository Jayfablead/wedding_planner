import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/scrns/viewBudgetPage.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

class BudgetingList extends StatefulWidget {
  const BudgetingList({super.key});

  @override
  State<BudgetingList> createState() => _BudgetingListState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
bool readmore = false;

class _BudgetingListState extends State<BudgetingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(),
      key: scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
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
              //       "Budget",
              //       style: TextStyle(
              //         fontSize: 17.sp,
              //         fontFamily: 'sofi',
              //         letterSpacing: 1,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.blue,
              //       ),
              //     ),
              //     IconButton(
              //         onPressed: () {
              //           scaffoldKey.currentState?.openDrawer();
              //         },
              //         icon: Icon(
              //           Icons.menu_rounded,
              //           size: 23.sp,
              //           color: Colors.blue,
              //         ))
              //   ],
              // ),
              header(
                  text: "Budget",
                  callback1: () {
                    scaffoldKey.currentState?.openDrawer();
                  }),
              // headerwid(text: "Budget"),
              SizedBox(
                height: 0.h,
              ),
              SizedBox(
                height: 88.h,
                child: CustomScrollView(
                  slivers: [
                    SliverGrid.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 2.w,
                          childAspectRatio: 0.663 / 1,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 0.5.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://t4.ftcdn.net/jpg/02/94/25/71/360_F_294257124_lTMpgGMKp03SjzXnMnWfpogrDw7H46Gf.jpg",
                                  fit: BoxFit.cover,
                                  height: 17.h,
                                  width: 35.w,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                'Supplier ${index + 1}',
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontFamily: 'sofi',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 35.w,
                                child: Text(
                                  'Budget Starting from \$ 10,000',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: 'sofi',
                                      height: 1.5,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(ViewBudget());
                                      },
                                      child: Container(
                                        height: 4.5.h,
                                        width: 34.w,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(25.sp),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "View Details",
                                          style: TextStyle(
                                              fontSize: 12.sp,
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
                      itemCount: 8,
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
