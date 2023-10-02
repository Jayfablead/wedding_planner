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

class _ViewAllCategoryState extends State<ViewAllCategory> {
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
                    "Categories",
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
              SizedBox(height: 2.h),
              SizedBox(
                height: 86.h,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 0.5.h,
                      mainAxisSpacing: 2.h,
                      childAspectRatio: 1.5 / 1,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 1.w),
                              height: 8.h,
                              width: 17.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: Categories[index].image.toString(),
                                  progressIndicatorBuilder:
                                      (context, url, progress) => Center(
                                          child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    'assets/pic.png',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 1.5.h),
                            Text(
                              Categories[index].name.toString(),
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600),
                            ),
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
