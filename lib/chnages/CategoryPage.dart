import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/CategoriesModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/chnages/all%20suppliers.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

import '../new pages/Check List.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({super.key});

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class cate {
  String? image;
  String? name;

  cate(
      this.image,
      this.name,
      );
}

List<cate> Categories = [
  cate('https://cdn-icons-png.flaticon.com/512/6491/6491166.png', 'Wedding '),
  cate(
      'https://cdn-icons-png.flaticon.com/512/3436/3436370.png', 'Engagement '),
  cate('https://cdn-icons-png.flaticon.com/512/6117/6117300.png',
      'Anniversary '),
  cate('https://cdn-icons-png.flaticon.com/512/2454/2454313.png', 'Birthday '),
  cate('https://cdn-icons-png.flaticon.com/512/6491/6491166.png', 'Wedding '),
  cate(
      'https://cdn-icons-png.flaticon.com/512/3436/3436370.png', 'Engagement '),
  cate('https://cdn-icons-png.flaticon.com/512/6117/6117300.png',
      'Anniversary '),
  cate('https://cdn-icons-png.flaticon.com/512/2454/2454313.png', 'Birthday '),
  cate('https://cdn-icons-png.flaticon.com/512/6491/6491166.png', 'Wedding '),
  cate(
      'https://cdn-icons-png.flaticon.com/512/3436/3436370.png', 'Engagement '),
  cate('https://cdn-icons-png.flaticon.com/512/6117/6117300.png',
      'Anniversary '),
  cate('https://cdn-icons-png.flaticon.com/512/2454/2454313.png', 'Birthday '),
];

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  int setit = 0;
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

      isLoad = true;
    });
    CategApi();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      key: scaffoldKey,
      drawer: drawer1(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5.h),
            header(
                text: "All Category",
                callback1: () {
                  scaffoldKey.currentState?.openDrawer();
                }),
            SizedBox(height: 1.h,),
            Container(
              height: 86.h,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: categoriesmodal?.services?.length,
                  itemBuilder: (context, index){
                    return  Card(
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
                                    categoriesmodal?.services?[index]
                                        .categoryIcon ??
                                        '',
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
                                            categoriesmodal?.services?[index]
                                                .categoryName ??
                                                '',
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
                                      categoriesmodal?.services?[index]
                                          .categoryDesc ??
                                          '',
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
                                  SizedBox(
                                    width: 55.w,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.to(MySuppliers(
                                              sele: -3,
                                              id:categoriesmodal?.services?[index]
                                                  .categoryId ??
                                                  '' ,
                                            ));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3.w,
                                                vertical: 1.3.h),
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    90)),
                                            child: Text(
                                              'View Suppliers',
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  color: Colors.white,
                                                  fontFamily: 'sofi',
                                                  letterSpacing: 1,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    );
                  }
              ),
            ),



          ],
        ),
      ),
    );
  }


  CategApi() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().categoryapi().then((response) async {
          categoriesmodal =
              CategoriesModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && categoriesmodal?.status == "1") {
            print('done ');
            setState(() {
              isLoad = false;
            });
          } else {
            setState(() {
              isLoad = false;
            });
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
        setState(() {
          isLoad = false;
        });
      }
    });
  }
  bool isLoad = true;
}
