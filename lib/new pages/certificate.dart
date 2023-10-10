import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class Certificate extends StatefulWidget {
  const Certificate({super.key});

  @override
  State<Certificate> createState() => _CertificateState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class cate {
  String? image;
  String? name;
  double? Rating;
  String? desc;

  cate(
    this.image,
    this.name,
    this.desc,
    this.Rating,
  );
}

List<cate> venue = [
  cate(
      'https://i.pinimg.com/originals/c5/25/55/c525556bdc809edf44944171ec3d54c7.jpg',
      'Dining',
      'A Big Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sitting',
      3),
  cate(
      'https://dypdvfcjkqkg2.cloudfront.net/large/5181614-9225.png',
      'Garden Sitting',
      'Sitting Arrangement in Garden with chairs and sitting arrangement with mandap and shadi ki chize',
      4),
  cate(
      'https://img.freepik.com/premium-vector/logistics-logo-icon-vector-template_644408-364.jpg',
      'Simple Walkaway',
      'A Simple Red Carpet Walking Arena',
      3),
  cate(
      'https://image.shutterstock.com/image-photo/image-260nw-1487440595.jpg',
      'Engagement',
      'An Arrangements for Engagement An Arrangements for Engagement An Arrangements for Engagement ',
      5),
  cate(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4YbKLFy8I8cYMpoV0p60zldXyMv3Q0IYXBQ&usqp=CAU',
      'Royal Decor',
      'A Royal Decoration venue A Royal Decoration venue A Royal Decoration venue A Royal Decoration venue ',
      3),
  cate(
      'https://i.pinimg.com/originals/c5/25/55/c525556bdc809edf44944171ec3d54c7.jpg',
      'Dining',
      'A Big Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sittingBig Hall with sitting',
      3),
  cate(
      'https://dypdvfcjkqkg2.cloudfront.net/large/5181614-9225.png',
      'Garden Sitting',
      'Sitting Arrangement in Garden with chairs and sitting arrangement with mandap and shadi ki chize',
      4),
  cate(
      'https://img.freepik.com/premium-vector/logistics-logo-icon-vector-template_644408-364.jpg',
      'Simple Walkaway',
      'A Simple Red Carpet Walking Arena',
      3),
  cate(
      'https://image.shutterstock.com/image-photo/image-260nw-1487440595.jpg',
      'Engagement',
      'An Arrangements for Engagement An Arrangements for Engagement An Arrangements for Engagement ',
      5),
  cate(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4YbKLFy8I8cYMpoV0p60zldXyMv3Q0IYXBQ&usqp=CAU',
      'Royal Decor',
      'A Royal Decoration venue A Royal Decoration venue A Royal Decoration venue A Royal Decoration venue ',
      3),
];

class _CertificateState extends State<Certificate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(),
      key: scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
              child: Container(
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
                        "Certificates",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: 'sofi',
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            scaffoldKey.currentState?.openDrawer();
                          },
                          icon: Icon(Icons.menu_rounded))
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      searchBox(),
                      Container(
                          padding: EdgeInsets.all(2.8.w),
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(11)),
                          child: Icon(
                            CupertinoIcons.sort_up_circle,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  SizedBox(height: 2.h),
                ]),
          )),
          SliverList.builder(
            itemBuilder: (context, index) {
              return Container(
                  height: 19.h,
                  padding: EdgeInsets.all(1.w),
                  margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 1.w),
                        height: 14.h,
                        width: 29.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black38)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: venue[index].image.toString(),
                            progressIndicatorBuilder:
                                (context, url, progress) =>
                                    Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/deprf.png',
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 54.w,
                            child: Container(
                              padding: EdgeInsets.only(left: 1.w),
                              child: Text(
                                'Supplier ${index + 1}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.5.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Container(
                            padding: EdgeInsets.only(left: 1.w),
                            width: 55.w,
                            child: Text(
                              venue[index].desc.toString(),
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: 1.h),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 45.w,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 1.5.h),
                              margin: EdgeInsets.symmetric(horizontal: 3.w),
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(90)),
                              child: Text(
                                'Download',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Colors.white,
                                    fontFamily: 'sofi',
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ));
            },
            itemCount: venue.length,
          ),
        ]),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      width: 80.w,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        // controller: _search,
        onChanged: (value) {},
        style: TextStyle(color: Colors.black, fontFamily: 'Meta1'),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.black, fontFamily: 'Meta1'),
        ),
      ),
    );
  }
}
