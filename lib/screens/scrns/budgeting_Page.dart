import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/SupplierPage.dart';
import 'package:wedding_planner/screens/scrns/viewBudgetPage.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class BudgetingList extends StatefulWidget {
  const BudgetingList({super.key});

  @override
  State<BudgetingList> createState() => _BudgetingListState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
bool readmore = false;

class _BudgetingListState extends State<BudgetingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(),
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded)),
                  Text(
                    "Budget",
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
                                      "https://scontent.fstv3-1.fna.fbcdn.net/v/t39.30808-6/358697822_618472077053883_3672029882010162992_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=a2f6c7&_nc_ohc=nqpWtZKoNe0AX9n9qac&_nc_ht=scontent.fstv3-1.fna&oh=00_AfAPlPHSs18weZ6v5XGNpca-mkC0xYC_mic0xXLHkqm9wQ&oe=64FA32A5",
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

                              SizedBox(width: 35.w,
                                child: Text(
                                  'Budget Starting from \$ 10,000',textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: 'sofi',height: 1.5,
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
                                          color: Colors.pink,
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
