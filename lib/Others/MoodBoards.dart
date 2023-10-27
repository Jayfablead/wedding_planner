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

class serv {
  String? name;
  String? prof;

  serv(
    this.prof,
    this.name,
  );
}

class cate0 {
  String? image;
  int? like;

  cate0(
    this.image,
    this.like,
  );
}

List<serv> services = [
  serv(
    'https://e1.pxfuel.com/desktop-wallpaper/238/852/desktop-wallpaper-masque-luffy-smiling-luffy-smile-thumbnail.jpg',
    'Jalsa',
  ),
  // serv(
  //   'https://static.wikia.nocookie.net/fictionalfighters/images/4/48/Sanji.png/revision/latest?cb=20150406032640',
  //   'Sanji',
  // ),
  // serv(
  //   'https://w0.peakpx.com/wallpaper/311/533/HD-wallpaper-one-piece-nico-robin-one-piece-two-years-later.jpg',
  //   'Robin',
  // ),
  // serv(
  //   'https://i.pinimg.com/736x/59/e3/d2/59e3d2fb93af21511690470abc014831.jpg',
  //   'Nami',
  // ),
  // serv(
  //   'https://i.pinimg.com/236x/23/62/50/236250f1055a352c4a0cd5e0a21aaf33.jpg',
  //   'Chopper',
  // ),
];
List<cate0> photos = [
  cate0(
      'https://www.brides.com/thmb/vxGFGGhcMQjg211eXLaTrXHgbhc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/sq-ea8c12ac4c2946738c7d6c3d9c45692f.jpg',
      100),
  cate0(
      'https://cdn0.weddingwire.in/article/9794/original/1280/jpg/84979-couple-portrait-ideas-for-your-wedding-coordinated-peachy-vibes-sunnydhimanphotography.jpeg',
      300),
  cate0(
      'https://images.herzindagi.info/image/2021/Jan/wedding-photography-m.jpg',
      200),
  cate0(
      'https://i.pinimg.com/736x/27/c8/fd/27c8fd79950baa2f80c9d8ef96977520.jpg',
      9999),
  cate0(
      'https://media.vogue.in/wp-content/uploads/2019/09/Deepika-Padukone-wedding-featured-1920x1080.jpg',
      1500),
  cate0(
      'https://www.brides.com/thmb/vxGFGGhcMQjg211eXLaTrXHgbhc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/sq-ea8c12ac4c2946738c7d6c3d9c45692f.jpg',
      100),
  cate0(
      'https://cdn0.weddingwire.in/article/9794/original/1280/jpg/84979-couple-portrait-ideas-for-your-wedding-coordinated-peachy-vibes-sunnydhimanphotography.jpeg',
      300),
  cate0(
      'https://images.herzindagi.info/image/2021/Jan/wedding-photography-m.jpg',
      200),
  cate0('https://crystallinestudio.com/imgBanner/81-crystalline-banner.jpg',
      1010),
  cate0(
      'https://i.pinimg.com/736x/27/c8/fd/27c8fd79950baa2f80c9d8ef96977520.jpg',
      9999),
  cate0(
      'https://media.vogue.in/wp-content/uploads/2019/09/Deepika-Padukone-wedding-featured-1920x1080.jpg',
      1500),
  cate0('https://crystallinestudio.com/imgBanner/81-crystalline-banner.jpg',
      1010),
  cate0(
      'https://i.pinimg.com/736x/27/c8/fd/27c8fd79950baa2f80c9d8ef96977520.jpg',
      9999),
];

List<String> type = ["All Suppliers", "To Do", "Meeting"];
// final GlobalKey<ScaffoldState>  scaffoldKey2 = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
bool isLoad = true;

class _PostPageState extends State<PostPage> {
  int sel1 = 0;
  List<XFile>? resultList;
  List<XFile>? resultList1;
  List<File> selectedImages = [];
  ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      setit = 1;
      isLoad = true;
    });
    CategApi();
    ViewBoardApi();
  }

  int? sel2;

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoad,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
        extendBody: true,
        bottomNavigationBar: bottomnavbar(selit: widget.sele),
        drawer: drawer1(),
        key: scaffoldKey,
        body: isLoad
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
                                      }
                                      addpostapi();
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
                                              Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: (viewpostmodal
                                                        ?.boards?[index].image)
                                                    .toString(),
                                                progressIndicatorBuilder: (context,
                                                        url, progress) =>
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
              isLoad = false;
            });
          } else {
            setState(() {
              print('nop');
              EasyLoading.showError('Canceled');
              isLoad = false;
            });
          }
        });
      } else {
        setState(() {
          isLoad = false;
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

  ViewBoardApi() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider()
            .Viewboardsapi(categoriesmodal?.services?[sel1].supplier?.id ?? "",
                categoriesmodal?.services?[sel1].categoryId ?? '')
            .then((response) async {
          viewpostmodal = ViewPostModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && viewpostmodal?.status == "1") {
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
        setState(() {
          isLoad = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
