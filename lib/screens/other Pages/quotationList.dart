import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/other%20Pages/quotationDetails.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class QuotationList extends StatefulWidget {
  const QuotationList({super.key});

  @override
  State<QuotationList> createState() => _QuotationListState();
}

class chat {
  String? image;
  String? name;
  String? type;
  String? date;
  String? details;

  chat(
    this.image,
    this.name,
    this.type,
    this.date,
    this.details,
  );
}

List<chat> mesgs = [
  chat(
      'https://e1.pxfuel.com/desktop-wallpaper/238/852/desktop-wallpaper-masque-luffy-smiling-luffy-smile-thumbnail.jpg',
      'Luffy',
      'Flower Decor',
      '22-08-2023',
      'A decorations full of Flowers with dif dif flowers'),
  chat(
      'https://static.wikia.nocookie.net/fictionalfighters/images/4/48/Sanji.png/revision/latest?cb=20150406032640',
      'Sanji',
      'Cake Decor',
      '20-03-2024',
      'A decorations for Cake as You want.'),
  chat(
      'https://w0.peakpx.com/wallpaper/311/533/HD-wallpaper-one-piece-nico-robin-one-piece-two-years-later.jpg',
      'Robin',
      'Chair Decor',
      '17-05-2023',
      'A decorations of chair like arrangements , sitting types etc'),
  chat(
      'https://i.pinimg.com/736x/59/e3/d2/59e3d2fb93af21511690470abc014831.jpg',
      'Nami',
      'Room Decor',
      '15-09-2024',
      'A decorations for your room special as like you'),
  chat(
      'https://i.pinimg.com/236x/23/62/50/236250f1055a352c4a0cd5e0a21aaf33.jpg',
      'Chopper',
      'Garden Decor',
      '12-10-2024',
      'A decorations of your garden'),
];
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _QuotationListState extends State<QuotationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(),
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          children: [
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded)),
                Text(
                  "All Quotations",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'sofi',
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
            SizedBox(height: 1.h),
            Container(
              height: 86.h,
              child: ListView.builder(
                itemCount: mesgs.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 1.h),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.pink, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 5.w),
                        child: Column(
                          children: [
                            Text(
                              mesgs[index].type ?? '',
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 15.sp,
                                  fontFamily: 'sofi',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 1.w),
                                  height: 7.h,
                                  width: 14.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(90),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: mesgs[index].image ?? '',
                                      progressIndicatorBuilder:
                                          (context, url, progress) =>
                                              CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                        'assets/icons/user.png',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 40.w,
                                  child: Text(
                                    mesgs[index].name ?? '',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                        fontFamily: 'sofi',
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.5.h),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Details : ',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1,
                                          fontFamily: 'sofi',
                                          color: Colors.black87),
                                    ),
                                    SizedBox(height: 1.h),
                                    SizedBox(
                                      width: 80.w,
                                      child: Text(
                                        mesgs[index].details ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                            fontFamily: 'sofi',
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 1.5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Date : ',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                      fontFamily: 'sofi',
                                      color: Colors.black87),
                                ),
                                Text(
                                  mesgs[index].date ?? '',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      fontFamily: 'sofi',
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.5.h),
                            InkWell(
                              onTap: () {
                                Get.to(QuatationsDetails(
                                  name: mesgs[index].name,
                                  type: mesgs[index].type,date: mesgs[index].date,
                                ));
                              },
                              child: Container(
                                width: 45.w,
                                padding: EdgeInsets.symmetric(vertical: 1.2.h),
                                decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                child: Center(
                                  child: Text(
                                    "View Details",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 1.5.h),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
