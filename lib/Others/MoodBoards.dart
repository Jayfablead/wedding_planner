import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:wedding_planner/Modal/AddpostModal.dart';
import 'package:wedding_planner/Modal/CategoriesModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/main.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../Modal/ViewPostModal.dart';

class PostPage extends StatefulWidget {
  int? sele;

  PostPage({super.key, required this.sele});

  @override
  State<PostPage> createState() => _PostPageState();
}

// final GlobalKey<ScaffoldState>  scaffoldKey2 = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _PostPageState extends State<PostPage> {
  int sel1 = 0;
  List<XFile>? resultList;
  List<XFile>? resultList1;
  List<File> selectedImages = [];
  bool isLoading = true;
  final _list = <String>[];
  ImagePicker _picker = ImagePicker();
  int itemCount = 5;
  int? count1 = 5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      setit = 1;
      isLoading = true;
    });
    CategApi();

    ViewBoardApi();
  }

  int? sel2;

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
        extendBody: true,
        bottomNavigationBar: bottomnavbar(selit: widget.sele),
        drawer: drawer1(),
        key: scaffoldKey,
        body: isLoading
            ? Container()
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      header(
                          text: "",
                          callback1: () {
                            scaffoldKey.currentState?.openDrawer();
                          }),
                      SizedBox(height: 1.h),
                      categoriesmodal?.services == null
                          ? Container()
                          : Padding(
                              padding: EdgeInsets.only(left: 1.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Add More Posts',
                                    style: TextStyle(
                                        fontFamily: 'sofi',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp,
                                        letterSpacing: 1),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      resultList =
                                          await ImagePicker().pickMultiImage();
                                      if (resultList != null) {
                                        setState(() {
                                          selectedImages = resultList!
                                              .map((XFile file) =>
                                                  File(file.path))
                                              .toList();
                                        });
                                        addpostapi();
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(90)),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 1.h, horizontal: 4.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add,
                                            size: 2.4.h,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 1.w),
                                          Text(
                                            "Add",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            categoriesmodal?.services == null
                                ? Container()
                                : Container(
                                    height: 4.5.h,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            categoriesmodal?.services?.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    sel1 = index;
                                                  });
                                                  ViewBoardApi();
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 1.h,
                                                      horizontal: 5.w),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: sel1 == index
                                                          ? Colors.blue
                                                          : Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 2.w),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          categoriesmodal
                                                                          ?.services?[
                                                                              index]
                                                                          .supplier
                                                                          ?.name ==
                                                                      "" ||
                                                                  categoriesmodal
                                                                          ?.services?[
                                                                              index]
                                                                          .supplier
                                                                          ?.name ==
                                                                      null
                                                              ? "N/A"
                                                              : categoriesmodal
                                                                      ?.services?[
                                                                          index]
                                                                      .supplier
                                                                      ?.name ??
                                                                  '',
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontFamily:
                                                                  'sofi',
                                                              color: sel1 ==
                                                                      index
                                                                  ? Colors.white
                                                                  : Colors.blue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              letterSpacing:
                                                                  1)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }),
                                  ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            categoriesmodal?.services == null
                                ? Container()
                                : Container(
                                    padding: EdgeInsets.only(left: 3.w),
                                    child: Text(
                                        categoriesmodal?.services?[sel1]
                                                        .categoryName ==
                                                    "" ||
                                                categoriesmodal?.services?[sel1]
                                                        .categoryName ==
                                                    null
                                            ? "N/A"
                                            : categoriesmodal?.services?[sel1]
                                                    .categoryName ??
                                                '',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'sofi',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1)),
                                  ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            SizedBox(
                              height: 65.h,
                              child: categoriesmodal?.services == null
                                  ? Container(
                                      height: 100.h,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'No Suppliers Available',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.black,
                                            fontFamily: 'sofi',
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  : viewpostmodal?.boards?.length == 0 ||
                                          viewpostmodal?.boards?.length == null
                                      ? Container(
                                          height: 72.h,
                                          alignment: Alignment.center,
                                          child: Text(
                                            'No Photos Available for this Category',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.black,
                                                fontFamily: 'sofi',
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      : StaggeredGridView.countBuilder(
                                          padding: EdgeInsets.zero,
                                          crossAxisCount: 2,
                                          // Number of columns
                                          itemCount:
                                              viewpostmodal?.boards?.length,
                                          // Total number of items
                                          itemBuilder: (BuildContext context,
                                                  int index) =>
                                              GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Stack(
                                                    children: [
                                                      Center(
                                                        child: Container(
                                                          height: 40.h,
                                                          width: 90.w,
                                                          alignment:
                                                              Alignment.center,
                                                          child:
                                                              ListView.builder(
                                                                  scrollDirection:
                                                                      Axis
                                                                          .horizontal,
                                                                  itemCount:
                                                                      viewpostmodal
                                                                          ?.boards
                                                                          ?.length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return Container(
                                                                      width:
                                                                          90.w,
                                                                      height:
                                                                          40.h,
                                                                      margin: EdgeInsets.only(
                                                                          right:
                                                                              3.w),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          imageUrl:
                                                                              (viewpostmodal?.boards?[index].image).toString(),
                                                                          // fit: BoxFit.cover,
                                                                          progressIndicatorBuilder: (context, url, progress) =>
                                                                              Center(child: CircularProgressIndicator()),
                                                                          errorWidget: (context, url, error) =>
                                                                              Image.asset(
                                                                            'assets/defimg.jpg',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }),
                                                        ),
                                                      ),
                                                      // Container(
                                                      //   padding: EdgeInsets.all(4.w),
                                                      //   margin: EdgeInsets.only(top: 1.h),
                                                      //   decoration: BoxDecoration(
                                                      //     borderRadius: BorderRadius.circular(20),
                                                      //   ),
                                                      //   child: ClipRRect(
                                                      //     borderRadius: BorderRadius.circular(20),
                                                      //     child: CachedNetworkImage(
                                                      //       imageUrl: imagePath,
                                                      //       height: 90.h,
                                                      //       imageBuilder: (context, imageProvider) => Container(
                                                      //         decoration: BoxDecoration(
                                                      //           image: DecorationImage(
                                                      //             image: imageProvider,
                                                      //             fit: BoxFit.cover,
                                                      //
                                                      //           ),
                                                      //         ),
                                                      //       ),
                                                      //       placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                      //       errorWidget: (context, url, error) => Icon(Icons.error),
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                      Positioned(
                                                        left: 83.5.w,
                                                        top: 3.h,
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              90),
                                                                  color: Colors
                                                                      .blue,
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .blue)),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.w),
                                                              child: Icon(
                                                                Icons
                                                                    .close_rounded,
                                                                size: 22.sp,
                                                                color: Colors
                                                                    .white,
                                                              )),
                                                        ),
                                                      )
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl: viewpostmodal
                                                          ?.boards?[index]
                                                          .image ??
                                                      "",
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                              progress) =>
                                                          Center(
                                                              child:
                                                                  CircularProgressIndicator()),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Image.asset(
                                                    'assets/user.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          staggeredTileBuilder: (int index) =>
                                              new StaggeredTile.fit(
                                            1,
                                          ),
                                          mainAxisSpacing: 8.0,
                                          crossAxisSpacing: 8.0,
                                        ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  // addpostapi() {
  //   final Map<String, String> data = {};
  //   data['category_id'] = categoriesmodal?.services?[sel1].categoryId ?? '';
  //   print(data);
  //   checkInternet().then((internet) async {
  //     if (internet) {
  //       taskprovider().addpostapi(data, selectedImages).then((response) async {
  //         addpostmodal = AddpostModal.fromJson(json.decode(response.body));
  //         if (response.statusCode == 200 && addpostmodal?.status == "1") {
  //           print('potli added');
  //           ViewBoardApi();
  //           setState(() {
  //             isLoad = false;
  //           });
  //         } else {
  //           setState(() {
  //             isLoad = false;
  //           });
  //         }
  //       });
  //     } else {
  //       setState(() {
  //         isLoad = false;
  //       });
  //       buildErrorDialog(context, 'Error', "Internet Required");
  //     }
  //   });
  // }

  addpostapi() {
    EasyLoading.show(status: 'Posting');
    final Map<String, String> data = {};
    data['category_id'] = categoriesmodal?.services?[sel1].categoryId ?? '';
    data['supplier_id'] = categoriesmodal?.services?[sel1].supplier?.id ?? '';
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().addpostapi(data, selectedImages).then((response) async {
          addpostmodal = AddpostModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && addpostmodal?.status == "1") {
            EasyLoading.showSuccess('Posted');
            ViewBoardApi();

            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              EasyLoading.showError('Canceled');
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  CategApi() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().categoryapi().then((response) async {
          categoriesmodal =
              CategoriesModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && categoriesmodal?.status == "1") {
            ViewBoardApi();
            print('done ');
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  ViewBoardApi() {
    print("enter");
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider()
            .Viewboardsapi(categoriesmodal?.services?[sel1].supplier?.id ?? "",
                categoriesmodal?.services?[sel1].categoryId ?? '')
            .then((response) async {
          viewpostmodal = ViewPostModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && viewpostmodal?.status == "1") {
            print(viewpostmodal?.boards?.length);
            setState(() {
              viewpostmodal;
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
