import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

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
    'Luffy',
  ),
  serv(
    'https://static.wikia.nocookie.net/fictionalfighters/images/4/48/Sanji.png/revision/latest?cb=20150406032640',
    'Sanji',
  ),
  serv(
    'https://w0.peakpx.com/wallpaper/311/533/HD-wallpaper-one-piece-nico-robin-one-piece-two-years-later.jpg',
    'Robin',
  ),
  serv(
    'https://i.pinimg.com/736x/59/e3/d2/59e3d2fb93af21511690470abc014831.jpg',
    'Nami',
  ),
  serv(
    'https://i.pinimg.com/236x/23/62/50/236250f1055a352c4a0cd5e0a21aaf33.jpg',
    'Chopper',
  ),
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
  cate0('https://crystallinestudio.com/imgBanner/81-crystalline-banner.jpg',
      1010),
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
];
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(),
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
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
                  "Posts",
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
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.only(left: 1.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Add Your Posts',
                    style: TextStyle(
                        fontFamily: 'sofi',
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        letterSpacing: 1),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(90)),
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 2.4.h,
                            color: Colors.white,
                          ),
                          SizedBox(width: 1.w),
                          Text(
                            "Add",
                            style:
                                TextStyle(fontSize: 15.sp, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 80.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 0.5.h),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 1.w),
                                      height: 7.h,
                                      width: 15.w,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(90),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: services[index].prof ?? '',
                                          progressIndicatorBuilder:
                                              (context, url, progress) =>
                                                  CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                            'assets/deprf.png',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    services[index].name ?? '',
                                    style: TextStyle(
                                        fontFamily: 'sofi',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.sp),
                                  ),
                                ],
                              ),
                              PopupMenuButton(
                                itemBuilder: (context) {
                                  return [];
                                },
                                icon: Icon(Icons.more_vert_rounded),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          SizedBox(
                            height: 40.h,
                            child: StaggeredGridView.countBuilder(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              // Number of columns
                              itemCount: 4,
                              // Total number of items
                              itemBuilder: (BuildContext context, int index) =>
                                  Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: photos[index].image.toString(),
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
                              staggeredTileBuilder: (int index) =>
                                  new StaggeredTile.fit(
                                1,
                              ),
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 8.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
