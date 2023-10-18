import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class RoomManagement extends StatefulWidget {
  const RoomManagement({super.key});

  @override
  State<RoomManagement> createState() => _RoomManagementState();
}

class cate {
  String? image;
  String? hname;
  String? name;
  String? roomno;
  String? person;

  cate(
    this.image,
    this.hname,
    this.name,
    this.roomno,
    this.person,
  );
}

List<cate> room = [
  cate(
      'https://static01.nyt.com/images/2019/03/24/travel/24trending-shophotels1/24trending-shophotels1-jumbo.jpg?quality=75&auto=webp',
      'Hotel 4 Kings',
      'Mr.Karam Mer',
      '111',
      '2'),
  cate(
      'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg',
      'Hotel 4 Kings',
      'Mr.Hari M.',
      '102',
      '4'),
  cate(
      'https://img.freepik.com/premium-photo/luxury-interior-design-bedroom-pool-villa_41487-28.jpg?w=826',
      'Hotel 4 Kings',
      'Mr.Tejas poter',
      '106',
      '2'),
  cate(
      'https://img.freepik.com/free-photo/modern-studio-apartment-design-with-bedroom-living-space_1262-12375.jpg?w=826&t=st=1693901111~exp=1693901711~hmac=5789ceb2f26a983c2ea4886be9f710d1df4974ee16d9e962dfb80c69724499f7',
      'Hotel 4 Kings',
      'Mr.Aron finch',
      '092',
      '6'),
  cate(
      'https://img.freepik.com/free-photo/luxury-bedroom-suite-resort-high-rise-hotel-with-working-table_105762-1783.jpg?size=626&ext=jpg&ga=GA1.1.1162323827.1691047344&semt=ais',
      'Hotel 4 Kings',
      'Mr.Khan',
      '018',
      '4'),
  cate(
      'https://assets-global.website-files.com/5c6d6c45eaa55f57c6367749/628d35d6b9575f5b35b4231a_Twin%20Hotel%20Room%20(1)%20(1).jpg',
      'Hotel 4 Kings',
      'Mr.Kingsman',
      '001',
      '6'),
];
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
TextEditingController _search = TextEditingController();

class _RoomManagementState extends State<RoomManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      drawer: drawer1(),
      key: scaffoldKey,
      body: Padding(
        // padding: const EdgeInsets.all(8.0),
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Center(
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
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.blue,
                              size: 23.sp,
                            )),
                        Text(
                          "Room Management",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: 'sofi',
                            letterSpacing: 1,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              scaffoldKey.currentState?.openDrawer();
                            },
                            icon: Icon(
                              Icons.menu_rounded,
                              color: Colors.blue,
                              size: 23.sp,
                            ))
                      ],
                    ),
                    SizedBox(height: 1.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 20.w,
                          width: 20.w,
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://q-xx.bstatic.com/xdata/images/hotel/max500/362802217.jpg?k=bfa466d492f3f7a75754eeae62d98ed49cdf23b82eee9ecba76749b7e10b1724&o=',
                            height: 9.5.h,
                            width: 20.w,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
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
                          width: 55.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 0.5.h),
                              Text(
                                'Hotel 4 King',
                                style: TextStyle(
                                    fontSize: 19.sp,
                                    fontFamily: 'sofi',
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                'TVC Company',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: 'sofi',
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    searchBox1(),
                    SizedBox(height: 1.h),
                  ],
                ),
              ),
              SliverList.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 16.h,
                      margin: EdgeInsets.symmetric(vertical: 0.5.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Card(
                        elevation: 3.5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 16.h,
                              width: 40.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: room[index].image.toString(),
                                  progressIndicatorBuilder:
                                      (context, url, progress) => Center(
                                          child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    'assets/deprf.png',
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 2.5.w, bottom: 0.5.h),
                                      child: Row(
                                        children: [
                                          Icon(Icons.person_outline_rounded),
                                          SizedBox(width: 2.w),
                                          Text(
                                            'Name : ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.sp,
                                                letterSpacing: 1,
                                                fontFamily: 'sofi',
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 3.w),
                                      child: Text(
                                        room[index].name.toString(),
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.75),
                                            fontSize: 15.sp,
                                            letterSpacing: 1,
                                            fontFamily: 'sofi',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 3.w),
                                  child: Row(
                                    children: [
                                      Icon(Icons.hotel_outlined),
                                      SizedBox(width: 2.w),
                                      Text(
                                        'Room no : ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.sp,
                                            fontFamily: 'sofi',
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(width: 1.w),
                                      Text(
                                        room[index].roomno.toString(),
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.75),
                                          fontSize: 15.sp,
                                          letterSpacing: 1,
                                          fontFamily: 'sofi',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 3.w),
                                  child: Row(
                                    children: [
                                      Icon(Icons.people_alt_outlined),
                                      SizedBox(width: 2.w),
                                      Text(
                                        room[index].person.toString() +
                                            ' person',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                          fontFamily: 'sofi',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: room.length),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      width: 94.w,
      height: 6.5.h,
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        right: 3.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            // Color of the shadow
            offset: Offset(0, 2.5),
            // Offset of the shadow (x, y)
            blurRadius: 4, // Spread of the shadow
            // How much the shadow extends
          ),
        ],
      ),
      child: TextField(
        cursorColor: Colors.black,
        controller: _search,
        onChanged: (value) {},
        style: TextStyle(
          fontSize: 15.sp,
          letterSpacing: 1,
          fontFamily: 'Sofi',
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: Colors.black,
          ),
          focusedBorder: InputBorder.none,
          // Remove border when focused
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: 'Search',
          contentPadding: EdgeInsets.only(top: 1.7.h),
          hintStyle: TextStyle(
            fontSize: 15.sp,
            letterSpacing: 1,
            fontFamily: 'Sofi',
            fontWeight: FontWeight.w700,
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }

  Widget searchBox1() {
    return Container(
      alignment: Alignment.center,
      width: 94.w,
      height: 6.5.h,
      padding: EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(65),
      ),
      child: TextField(
        controller: _search,
        onChanged: (value) {},
        style:
            TextStyle(color: Colors.black, fontSize: 13.sp, fontFamily: 'get'),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black.withOpacity(0.65),
            size: 25,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 35,
            minWidth: 40,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.65), fontFamily: 'get'),
        ),
      ),
    );
  }
}
