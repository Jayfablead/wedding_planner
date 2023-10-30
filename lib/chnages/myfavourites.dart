import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/AddtofavouriteModal.dart';
import 'package:wedding_planner/Modal/FavouritelistModal.dart';
import 'package:wedding_planner/Suppliers/SupplierDetailsPage.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../Provider/taskprovider.dart';

class myfavourite extends StatefulWidget {
  myfavourite({super.key});

  @override
  State<myfavourite> createState() => _myfavouriteState();
}

class cate {
  String? image;
  String? name;
  String? vv;
  double? Rating;
  String? desc;

  cate(
    this.image,
    this.name,
    this.vv,
    this.desc,
    this.Rating,
  );
}

class _myfavouriteState extends State<myfavourite> {
  List<cate> HotelIm = [
    cate(
        'https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg',
        'Green velly',
        "Good Service",
        'A Big Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sitting',
        3),
    cate(
        'https://balloonpro.in/wp-content/uploads/2023/06/20210306_090946.jpg',
        'Garden green',
        "Good Service",
        'Sitting Arrangement in Garden with chairs and sitting arrangement with mandap and shadi ki chize',
        4),
    cate(
        'https://content.jdmagicbox.com/comp/ahmedabad/a8/079pxx79.xx79.190719110521.s4a8/catalogue/lilly-s-flower-decoration-and-gift-shop-ghatlodiya-ahmedabad-decorators-ypttjhzlti.jpg?clr=',
        'New Style',
        "Good Service",
        'A Simple Red Carpet Walking Arena',
        3),
    cate(
        'https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg',
        'Green velly',
        "Good Service",
        'A Big Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sitting',
        3),
    cate(
        'https://balloonpro.in/wp-content/uploads/2023/06/20210306_090946.jpg',
        'Garden green',
        "Good Service",
        'Sitting Arrangement in Garden with chairs and sitting arrangement with mandap and shadi ki chize',
        4),
    cate(
        'https://content.jdmagicbox.com/comp/ahmedabad/a8/079pxx79.xx79.190719110521.s4a8/catalogue/lilly-s-flower-decoration-and-gift-shop-ghatlodiya-ahmedabad-decorators-ypttjhzlti.jpg?clr=',
        'New Style',
        "Good Service",
        'A Simple Red Carpet Walking Arena',
        3),
    cate(
        'https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg',
        'Green velly',
        "Good Service",
        'A Big Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sitting',
        3),
    cate(
        'https://balloonpro.in/wp-content/uploads/2023/06/20210306_090946.jpg',
        'Garden green',
        "Good Service",
        'Sitting Arrangement in Garden with chairs and sitting arrangement with mandap and shadi ki chize',
        4),
    cate(
        'https://content.jdmagicbox.com/comp/ahmedabad/a8/079pxx79.xx79.190719110521.s4a8/catalogue/lilly-s-flower-decoration-and-gift-shop-ghatlodiya-ahmedabad-decorators-ypttjhzlti.jpg?clr=',
        'New Style',
        "Good Service",
        'A Simple Red Carpet Walking Arena',
        3),
    cate(
        'https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg',
        'Green velly',
        "Good Service",
        'A Big Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sitting',
        3),
    cate(
        'https://balloonpro.in/wp-content/uploads/2023/06/20210306_090946.jpg',
        'Garden green',
        "Good Service",
        'Sitting Arrangement in Garden with chairs and sitting arrangement with mandap and shadi ki chize',
        4),
    cate(
        'https://content.jdmagicbox.com/comp/ahmedabad/a8/079pxx79.xx79.190719110521.s4a8/catalogue/lilly-s-flower-decoration-and-gift-shop-ghatlodiya-ahmedabad-decorators-ypttjhzlti.jpg?clr=',
        'New Style',
        "Good Service",
        'A Simple Red Carpet Walking Arena',
        3),
  ];

  List<cate> venue = [
    cate(
        'https://media.weddingz.in/images/98203e459408c4f2f9c9014d9a6f669f/luxury-wedding-venues-in-surat-that-you-must-check-out-prior-to-finalizing-your-wedding-destination.jpg',
        'Dining',
        "Good Service",
        'A Big Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sitting',
        3),
    cate(
        'https://www.happywedding.app/blog/wp-content/uploads/2022/02/Wedding-Venues-in-Washington-State.jpg',
        'Garden Sitting',
        "Good Service",
        'Sitting Arrangement in Garden with chairs and sitting arrangement with mandap and shadi ki chize',
        4),
    cate(
        'https://imgmedia.lbb.in/media/2019/04/5ca1cedf8722f4176f30d878_1554108127903.jpg',
        'Simple Walkaway',
        "Good Service",
        'A Simple Red Carpet Walking Arena',
        3),
    cate(
        'https://image.wedmegood.com/resized/540X/uploads/member/739856/1662626980_IMG_0378.jpg?crop=7,99,1139,641',
        'Engagement',
        "Good Service",
        'An Arrangements for Engagement An Arrangements for Engagement An Arrangements for Engagement ',
        5),
    cate(
        'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
        'Royal Decor',
        "Good Service",
        'A Royal Decoration venue A Royal Decoration venue A Royal Decoration venue A Royal Decoration venue ',
        3),
    cate(
        'https://images.squarespace-cdn.com/content/v1/5fc1488e2e34347c7046adff/1608299164655-MKBFB2JIWNX23JIUWZEG/large-conservatory-wedding-venue.jpg',
        'OutSide WallHouse',
        "Good Service",
        'A Big Hall with sitting A Big Hall with sitting A Big Hall with sitting A Big Hall with sitting ',
        5),
    cate(
        'https://www.happywedding.app/blog/wp-content/uploads/2022/02/Wedding-Venues-in-Washington-State.jpg',
        'Garden Sitting',
        "Good Service",
        'Sitting Arrangement in Arrangement in GardenSitting Arrangement in Sitting Arrangement in ',
        4),
    cate(
        'https://imgmedia.lbb.in/media/2019/04/5ca1cedf8722f4176f30d878_1554108127903.jpg',
        'Simple Walkaway',
        "Good Service",
        'A Simple Red Carpet Walking ArenaA Simple Red Carpet Walking ArenaA Simple Red Carpet Walking ArenaA Simple Red Carpet Walking Arena ',
        4),
    cate(
        'https://image.wedmegood.com/resized/540X/uploads/member/739856/1662626980_IMG_0378.jpg?crop=7,99,1139,641',
        'Engagement',
        "Good Service",
        'An Arrangements for EngagementAn Arrangements for EngagementAn Arrangements for EngagementAn Arrangements for Engagement ',
        3),
    cate(
        'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
        'Royal Decor',
        "Good Service",
        'A Royal Decoration venue',
        2),
    cate(
        'https://images.squarespace-cdn.com/content/v1/5fc1488e2e34347c7046adff/1608299164655-MKBFB2JIWNX23JIUWZEG/large-conservatory-wedding-venue.jpg',
        'OutSide WallHouse',
        "Good Service",
        'A Big Hall with sitting',
        5)
  ];
  int? fav;
  int? mydata;
  bool isLoading = true;
  final GlobalKey<ScaffoldState> scaffoldKey9 = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    favouritelistap();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        drawer: drawer1(),
        backgroundColor: Colors.grey.shade100,
        key: scaffoldKey9,
        extendBody: true,
        bottomNavigationBar: bottomnavbar(selit: -3),
        body: isLoading
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 6.h,
                      ),

                      header(
                          text: "My Favourites",
                          callback1: () {
                            scaffoldKey9.currentState?.openDrawer();
                          }),
                      // headerwid(text: "My Favourites",
                      //     onCallback: (){
                      //       scaffoldKey.currentState?.openDrawer();
                      //     }),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 79.h,
                        child: favouritelistmodal?.myfavourites?.length == 0
                            ? Text(
                                "No favourite added",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontFamily: 'sofi',
                                    color: Colors.black),
                              )
                            : ListView.builder(
                                itemCount:
                                    favouritelistmodal?.myfavourites?.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(SupplierfourScreen(
                                        catid: favouritelistmodal
                                            ?.myfavourites?[index]
                                            .serviceDetail
                                            ?.categoryId,
                                        service: favouritelistmodal
                                            ?.myfavourites?[index].service,
                                        suppid: favouritelistmodal
                                            ?.myfavourites?[index]
                                            .serviceDetail
                                            ?.sId,
                                      ));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 1.h, bottom: 1.h),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                // Color of the shadow
                                                offset: Offset(0, 1.5),
                                                // Offset of the shadow (x, y)
                                                blurRadius:
                                                    8, // Spread of the shadow
                                                // How much the shadow extends
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 1.h),
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 1.w),
                                              height: 9.h,
                                              width: 18.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl: favouritelistmodal
                                                          ?.myfavourites?[index]
                                                          .profilePath ??
                                                      "",
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                              progress) =>
                                                          CircularProgressIndicator(),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Image.asset(
                                                    'assets/user.png',
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 50.w,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        favouritelistmodal
                                                                        ?.myfavourites?[
                                                                            index]
                                                                        .name ==
                                                                    '' ||
                                                                favouritelistmodal
                                                                        ?.myfavourites?[
                                                                            index]
                                                                        .name ==
                                                                    null
                                                            ? 'N/A'
                                                            : favouritelistmodal
                                                                    ?.myfavourites?[
                                                                        index]
                                                                    .name ??
                                                                '',
                                                        style: TextStyle(
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            letterSpacing: 1,
                                                            fontFamily: 'sofi',
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 0.8.h),
                                                SizedBox(
                                                  width: 66.w,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 52.w,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              favouritelistmodal
                                                                              ?.myfavourites?[
                                                                                  index]
                                                                              .service ==
                                                                          '' ||
                                                                      favouritelistmodal
                                                                              ?.myfavourites?[
                                                                                  index]
                                                                              .service ==
                                                                          null
                                                                  ? 'N/A'
                                                                  : favouritelistmodal
                                                                          ?.myfavourites?[
                                                                              index]
                                                                          .service ??
                                                                      '',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'sofi',
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.5)),
                                                            ),
                                                            SizedBox(
                                                                height: 0.8.h),
                                                            Text(
                                                              favouritelistmodal
                                                                              ?.myfavourites?[
                                                                                  index]
                                                                              .description ==
                                                                          '' ||
                                                                      favouritelistmodal
                                                                              ?.myfavourites?[
                                                                                  index]
                                                                              .description ==
                                                                          null
                                                                  ? 'N/A'
                                                                  : favouritelistmodal
                                                                          ?.myfavourites?[
                                                                              index]
                                                                          .description ??
                                                                      '',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'sofi',
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.5),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            mydata = index;
                                                          });
                                                          favourite();
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  2.w),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          7),
                                                              color:
                                                                  Colors.blue),
                                                          child: Icon(
                                                            Icons.favorite,
                                                            color: Colors.white,
                                                            size: 18.sp,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                padding: EdgeInsets.zero,
                              ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  favouritelistap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().favouritelist().then((response) async {
          favouritelistmodal =
              FavouritelistModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && favouritelistmodal?.status == "1") {
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
      }
    });
  }

  favourite() {
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
                     'Are You Sure You Want to remove from favourite?',
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
                                  addtofavouriteap(
                                      favouritelistmodal
                                          ?.myfavourites?[mydata!].id,
                                      favouritelistmodal
                                          ?.myfavourites?[mydata!].serviceId);
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
                                        color: Colors.blue,
                                      ),
                                      color: Color(0xfff4f4f4),
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

  addtofavouriteap(String? supplierid, String? catid) {
    final Map<String, String> data = {};
    data['userID'] = (userData?.user?.id).toString();
    data['supplierID'] = supplierid.toString();
    data['categoryID'] = catid.toString();
    data['isFav'] = "0";
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().addtofavouriteapi(data).then((response) async {
          addtofavouritemodal =
              AddtofavouriteModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              addtofavouritemodal?.status == "1") {
            favouritelistap();
            Get.back();
          } else {}
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
