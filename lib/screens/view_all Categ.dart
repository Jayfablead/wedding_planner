import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class ViewAllCategory extends StatefulWidget {
  const ViewAllCategory({super.key});

  @override
  State<ViewAllCategory> createState() => _ViewAllCategoryState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class cate {
  String? image;
  String? name;

  cate(
    this.image,
    this.name,
  );
}

List<cate> Categories = [
  cate(
      'https://media.weddingz.in/images/bbda52972b1de50671f1b9de639610de/Anais-Events-6.jpg',
      'Wedding Decor'),
  cate(
      'https://i.pinimg.com/originals/1f/84/20/1f8420a90aacebb1e64255bc4d57c5ad.jpg',
      'Engagement Decor'),
  cate('https://m.media-amazon.com/images/I/71xdPvVRJwL.jpg',
      'Anniversary Decor'),
  cate(
      'https://content.jdmagicbox.com/comp/surat/z9/0261px261.x261.210715153040.p8z9/catalogue/om-yash-collection-ballon-decoration-vesu-surat-birthday-party-decorators-6evf9oecpb.jpg',
      'Birthday Decor'),
];

class _ViewAllCategoryState extends State<ViewAllCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(),
      key: _scaffoldKey,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.w),
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
                    "Categories",
                    style: TextStyle(
                      fontSize: 15.sp,
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
                height: 70.h,
                child: GridView.builder(padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 0.5.h,mainAxisSpacing: 2.h,childAspectRatio: 0.92/1,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.pink.withOpacity(0.2),
                        ),
                        padding: EdgeInsets.all(2.w),
                        margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 1.w),
                              height: 15.h,
                              width: 50.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: Categories[index].image.toString(),
                                  progressIndicatorBuilder: (context, url,
                                          progress) =>
                                      Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    'assets/icons/deprf.png',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 1.h),
                            Container(margin: EdgeInsets.symmetric(horizontal: 1.w),
                                width: 40.w,
                                child: Text(
                                  Categories[index].name.toString(),
                                  style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ));
                  },
                  itemCount: Categories.length,
                ),
              )
            ]),
      ),
    );
  }
}
