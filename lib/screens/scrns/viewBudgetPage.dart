import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/drawer.dart';

class ViewBudget extends StatefulWidget {
  const ViewBudget({super.key});

  @override
  State<ViewBudget> createState() => _ViewBudgetState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(),
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
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
                    height: 1.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'HOW TO SPEND YOUR',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontFamily: 'sofi',
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$ 10,000',
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontFamily: 'wedd',
                          letterSpacing: 4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'WEDDING BUDGET',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontFamily: 'sofi',
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
            SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1.h,
                crossAxisSpacing: 2.w,
                childAspectRatio: 2.5 / 1,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      color: Colors.pink.withOpacity(0.35),
                      height: 8.h,
                      padding: EdgeInsets.all(2.w),
                      width: 50.w,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: CachedNetworkImage(
                                imageUrl: Icns[index].image ?? '',
                                fit: BoxFit.cover,
                                height: 8.h,
                                width: 13.w,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            SizedBox(
                              width: 25.w,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Icns[index].name ?? '',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '\$ ' + (Icns[index].price).toString(),
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: 'sofi',
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                    ),
                  ],
                );
              },
              itemCount: Icns.length,
            ),
          ],
        ),
      ),
    );
  }
}
