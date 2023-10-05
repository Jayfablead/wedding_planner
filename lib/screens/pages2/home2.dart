import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../widgets/drawer.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class cate1 {
  String? image;
  String? name;
  String? desc;

  cate1(
    this.image,
    this.name,
    this.desc,
  );
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

class cate {
  String? image;

  cate(
    this.image,
  );
}

class dress {
  String? image;
  String? name;
  bool? islike;
  String? price;
  String? desc;
  int? likes;

  dress(
    this.image,
    this.islike,
    this.name,
    this.price,
    this.desc,
    this.likes,
  );
}

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
List<cate0> makeup = [
  cate0(
      'https://5.imimg.com/data5/DZ/AH/FW/SELLER-10261948/bridal-makeup-service-500x500.png',
      100),
  cate0(
      'https://naomisheadmasters.com/wp-content/uploads/2022/11/Bridal-Makeup-In-Haryana.jpg',
      300),
  cate0(
      'https://cdn0.weddingwire.in/article/3631/3_2/1280/jpg/11363-bridal-makeup-artists-cupcake-productions-lead-image.webp',
      200),
  cate0(
      'https://i.pinimg.com/originals/d3/b6/0d/d3b60d8fa3c96664642435898cd9d471.jpg',
      1010),
  cate0('https://shaadiwish.com/blog/wp-content/uploads/2018/10/1-6.jpg', 9999),
  cate0(
      'https://e0.pxfuel.com/wallpapers/659/446/desktop-wallpaper-elegant-bridal-makeup-bengalibride-bridalmakeup-makeup-wedding.jpg',
      1500),
  cate0(
      'https://images.shaadisaga.com/shaadisaga_production/photos/pictures/003/822/396/new_medium/ss20220505-5777-1dku0lg.webp?1651747380',
      100),
];
List<cate0> birthday = [
  cate0(
      'https://www.7eventzz.com/public/media/original-images/1643979316_1.jpg',
      100),
  cate0(
      'https://images-na.ssl-images-amazon.com/images/I/81kYAnQXc-L._SL1500_.jpg',
      300),
  cate0(
      'https://cdn.togetherv.com/dazzling-birthday-surprise-main_1688644773.webp',
      200),
  cate0(
      'https://media.karousell.com/media/photos/products/2022/1/24/birthday_decoration_hotel_set__1643064177_ad5923b6.jpg',
      1010),
  cate0(
      'https://frillx.com/cdn/shop/products/rosegold-birthday-decoration-party-supplies-kit-pack-of-38-for-husband-wife-boy-girl-117650.jpg?v=1646291318',
      9999),
  cate0(
      'https://rukminim2.flixcart.com/image/850/1000/khavrm80-0/birthday-combo/g/h/i/happy-birthday-combo-party-decoration-with-led-light-set-original-imafxch8vrdtp3dg.jpeg?q=90',
      1500),
  cate0(
      'https://i.pinimg.com/originals/91/52/1f/91521f482758b4ef94a431bc9db78a7a.jpg',
      100),
];
List<cate0> engage = [
  cate0(
      'https://i.pinimg.com/originals/1f/84/20/1f8420a90aacebb1e64255bc4d57c5ad.jpg',
      100),
  cate0(
      'https://housing.com/news/wp-content/uploads/2023/01/Mehendi-Decor-Ideas-for-Indoor-and-Outdoor-Mehandi-Ceremony.jpg',
      300),
  cate0(
      'https://5.imimg.com/data5/SELLER/Default/2022/12/KD/UV/TF/47694279/engagement-decoration.jpg',
      200),
  cate0(
      'https://productimages.withfloats.com/tile/5fdc604fbfde3900012455de.jpg',
      1010),
  cate0(
      'https://images.prismic.io/eventsgyani/06d9f6a3-6447-4f16-8b5b-04094e5245b4_6.+ganesha+backdrop.jpeg?auto=compress,format&rect=0,0,960,640&w=740&h=493',
      9999),
  cate0(
      'https://www.takerentpe.com/media/images/products/2022/05/Untitled_design_7.png',
      1500),
  cate0(
      'https://static.wixstatic.com/media/e99c4e_f658b999ed454ec8916a8039e80c254e~mv2.jpg/v1/fill/w_446,h_470,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/e99c4e_f658b999ed454ec8916a8039e80c254e~mv2.jpg',
      100),
];
List<cate0> anniversary = [
  cate0('https://m.media-amazon.com/images/I/71xdPvVRJwL.jpg', 100),
  cate0(
      'https://partydost.com/wp-content/uploads/2020/12/Untitled-design-49.jpg',
      300),
  cate0(
      'https://deowgxgt4vwfe.cloudfront.net/uploads/1604991287_webp_original.webp',
      200),
  cate0(
      'https://loviesta.com/wp-content/uploads/2021/05/Happy-Anniversary-Theme-Decoration-007.jpg',
      1010),
  cate0(
      'https://i.pinimg.com/originals/3a/c8/46/3ac846fa708a68dfc71b64ade921086e.jpg',
      9999),
  cate0(
      'https://experiencesaga.com/cdn/shop/products/WhatsAppImage2023-01-30at4.16.14PM_1.jpg?v=1675077718&width=533',
      1500),
  cate0('https://m.media-amazon.com/images/I/819hFrW34pL.jpg', 100),
];
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
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
List<cate1> venue = [
  cate1(
      'https://media.weddingz.in/images/98203e459408c4f2f9c9014d9a6f669f/luxury-wedding-venues-in-surat-that-you-must-check-out-prior-to-finalizing-your-wedding-destination.jpg',
      'Dining',
      'A Big Hall with sitting'),
  cate1(
      'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
      'Royal Decor',
      'A Royal Decoration venue'),
  cate1(
      'https://imgmedia.lbb.in/media/2019/04/5ca1cedf8722f4176f30d878_1554108127903.jpg',
      'Simple Walkaway',
      'A Simple Red Carpet Walking Arena'),
  cate1(
      'https://image.wedmegood.com/resized/540X/uploads/member/739856/1662626980_IMG_0378.jpg?crop=7,99,1139,641',
      'Engagement',
      'An Arrangements for Engagement'),
  cate1(
      'https://www.happywedding.app/blog/wp-content/uploads/2022/02/Wedding-Venues-in-Washington-State.jpg',
      'Garden Sitting',
      'Sitting Arrangement in Garden'),
  cate1(
      'https://media.weddingz.in/images/98203e459408c4f2f9c9014d9a6f669f/luxury-wedding-venues-in-surat-that-you-must-check-out-prior-to-finalizing-your-wedding-destination.jpg',
      'Dining',
      'A Big Hall with sitting'),
  cate1(
      'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
      'Royal Decor',
      'A Royal Decoration venue'),
  cate1(
      'https://imgmedia.lbb.in/media/2019/04/5ca1cedf8722f4176f30d878_1554108127903.jpg',
      'Simple Walkaway',
      'A Simple Red Carpet Walking Arena'),
  cate1(
      'https://image.wedmegood.com/resized/540X/uploads/member/739856/1662626980_IMG_0378.jpg?crop=7,99,1139,641',
      'Engagement',
      'An Arrangements for Engagement'),
  cate1(
      'https://www.happywedding.app/blog/wp-content/uploads/2022/02/Wedding-Venues-in-Washington-State.jpg',
      'Garden Sitting',
      'Sitting Arrangement in Garden'),
];
List<cate> icns = [
  cate(
    'https://cdn-icons-png.flaticon.com/512/6448/6448538.png',
  ),
  cate(
    'https://cdn-icons-png.flaticon.com/512/84/84395.png',
  ),
  cate(
    'https://static.thenounproject.com/png/1942517-200.png',
  ),
];
List<dress> Wdress = [
  dress(
      'https://c1.wallpaperflare.com/preview/526/605/244/bindi-asian-jewellery-beauty.jpg',
      false,
      'Indian Wedding Dress',
      '25000',
      'An Indian Wedding Style Dress For a beauty like you.',
      1000),
  dress(
      'https://c0.wallpaperflare.com/preview/731/452/1009/beautiful-beautiful-eyes-beautiful-girl-bride.jpg',
      true,
      'Bengoli Wedding Dress',
      '35000',
      'A Bengoli Wedding Dress For a beauty like you',
      3999),
  dress(
      'https://c1.wallpaperflare.com/preview/526/605/244/bindi-asian-jewellery-beauty.jpg',
      false,
      'Indian Wedding Dress',
      '25000',
      'An Indian Wedding Style Dress For a beauty like you.',
      1000),
  dress(
      'https://c0.wallpaperflare.com/preview/731/452/1009/beautiful-beautiful-eyes-beautiful-girl-bride.jpg',
      true,
      'Bengoli Wedding Dress',
      '35000',
      'A Bengoli Wedding Dress For a beauty like you',
      3999),
];
int sel = 1;

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      drawer: drawer1(),
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          children: [
            SizedBox(
              height: 7.h,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 92.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hi, Zoro',
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontFamily: 'get',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                color: Colors.pink),
                          ),
                          IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState?.openDrawer();
                              },
                              icon: Icon(
                                Icons.menu_rounded,
                                color: Colors.pink,
                                size: 23.sp,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              height: 10.h,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          sel = 1;
                        });
                      },
                      child: Container(
                        child: Card(
                            color: sel == 1 ? Colors.pink : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            child: Container(
                              margin: EdgeInsets.all(3.5.w),
                              child: Image.asset('assets/1.png',
                                  color: sel == 1 ? Colors.white : Colors.pink,
                                  height: 6.h,
                                  width: 13.w),
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          sel = 2;
                        });
                      },
                      child: Container(
                        child: Card(
                            color: sel == 2 ? Colors.pink : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            child: Container(
                              margin: EdgeInsets.all(3.5.w),
                              child: Image.asset('assets/2.png',
                                  color: sel == 2 ? Colors.white : Colors.pink,
                                  height: 6.h,
                                  width: 13.w),
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          sel = 3;
                        });
                      },
                      child: Container(
                        child: Card(
                            color: sel == 3 ? Colors.pink : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            child: Container(
                              margin: EdgeInsets.all(3.5.w),
                              child: Image.asset('assets/9.png',
                                  color: sel == 3 ? Colors.white : Colors.pink,
                                  height: 6.h,
                                  width: 13.w),
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          sel = 4;
                        });
                      },
                      child: Container(
                        child: Card(
                            color: sel == 4 ? Colors.pink : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            child: Container(
                              margin: EdgeInsets.all(3.5.w),
                              child: Image.asset('assets/8.png',
                                  color: sel == 4 ? Colors.white : Colors.pink,
                                  height: 6.h,
                                  width: 13.w),
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          sel = 5;
                        });
                      },
                      child: Container(
                        child: Card(
                            color: sel == 5 ? Colors.pink : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            child: Container(
                              margin: EdgeInsets.all(3.5.w),
                              child: Image.asset('assets/7.png',
                                  color: sel == 5 ? Colors.white : Colors.pink,
                                  height: 6.h,
                                  width: 13.w),
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          sel = 6;
                        });
                      },
                      child: Container(
                        child: Card(
                            color: sel == 6 ? Colors.pink : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            child: Container(
                              margin: EdgeInsets.all(3.5.w),
                              child: Image.asset('assets/5.png',
                                  color: sel == 6 ? Colors.white : Colors.pink,
                                  height: 6.h,
                                  width: 13.w),
                            )),
                      ),
                    ),
                  ]),
            ),
            sel == 2
                ? Column(
                    children: [
                      SizedBox(height: 2.h),
                      Row(children: [
                        SizedBox(width: 1.w),
                        Text(
                          'Birthday Decor',
                          style: TextStyle(
                              fontFamily: 'sofi',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              letterSpacing: 1),
                        ),
                      ]),
                      SizedBox(height: 2.h),
                      SizedBox(
                        height: 69.h,
                        child: StaggeredGridView.countBuilder(
                          padding: EdgeInsets.zero,
                          crossAxisCount: 2,
                          // Number of columns
                          itemCount: birthday.length,
                          // Total number of items
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: birthday[index].image.toString(),
                                progressIndicatorBuilder: (context, url,
                                        progress) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  'assets/deprf.png',
                                ),
                              ),
                            ),
                          ),
                          staggeredTileBuilder: (int index) =>
                              StaggeredTile.count(1, index.isEven ? 1.5 : 1),
                          // Adjust sizes based on index
                          mainAxisSpacing: 8.0,
                          // Vertical spacing
                          crossAxisSpacing: 8.0, // Horizontal spacing
                        ),
                      ),
                    ],
                  )
                : sel == 5
                    ? Column(
                        children: [
                          SizedBox(height: 2.h),
                          Row(children: [
                            SizedBox(width: 1.w),
                            Text(
                              'Photography Ideas',
                              style: TextStyle(
                                  fontFamily: 'sofi',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  letterSpacing: 1),
                            ),
                          ]),
                          SizedBox(height: 2.h),
                          SizedBox(
                            height: 69.h,
                            child: StaggeredGridView.countBuilder(
                              padding: EdgeInsets.zero,
                              crossAxisCount: 2,
                              // Number of columns
                              itemCount: photos.length,
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
                                  StaggeredTile.count(
                                      1, index.isEven ? 1.5 : 1),
                              // Adjust sizes based on index
                              mainAxisSpacing: 8.0,
                              // Vertical spacing
                              crossAxisSpacing: 8.0, // Horizontal spacing
                            ),
                          ),
                        ],
                      )
                    : sel == 4
                        ? Column(
                            children: [
                              SizedBox(height: 2.h),
                              Row(children: [
                                SizedBox(width: 1.w),
                                Text(
                                  'Anniversary Decor',
                                  style: TextStyle(
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                      letterSpacing: 1),
                                ),
                              ]),
                              SizedBox(height: 2.h),
                              SizedBox(
                                height: 69.h,
                                child: StaggeredGridView.countBuilder(
                                  padding: EdgeInsets.zero,
                                  crossAxisCount: 2,
                                  // Number of columns
                                  itemCount: anniversary.length,
                                  // Total number of items
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            anniversary[index].image.toString(),
                                        progressIndicatorBuilder:
                                            (context, url, progress) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          'assets/deprf.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  staggeredTileBuilder: (int index) =>
                                      StaggeredTile.count(
                                          1, index.isEven ? 1.5 : 1),
                                  // Adjust sizes based on index
                                  mainAxisSpacing: 8.0,
                                  // Vertical spacing
                                  crossAxisSpacing: 8.0, // Horizontal spacing
                                ),
                              ),
                            ],
                          )
                        : sel == 3
                            ? Column(
                                children: [
                                  SizedBox(height: 2.h),
                                  Row(children: [
                                    SizedBox(width: 1.w),
                                    Text(
                                      'Engagement Decor',
                                      style: TextStyle(
                                          fontFamily: 'sofi',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp,
                                          letterSpacing: 1),
                                    ),
                                  ]),
                                  SizedBox(height: 2.h),
                                  SizedBox(
                                    height: 69.h,
                                    child: StaggeredGridView.countBuilder(
                                      padding: EdgeInsets.zero,
                                      crossAxisCount: 2,
                                      // Number of columns
                                      itemCount: engage.length,
                                      // Total number of items
                                      itemBuilder:
                                          (BuildContext context, int index) =>
                                              Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl:
                                                engage[index].image.toString(),
                                            progressIndicatorBuilder: (context,
                                                    url, progress) =>
                                                Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Image.asset(
                                              'assets/deprf.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                      staggeredTileBuilder: (int index) =>
                                          StaggeredTile.count(
                                              1, index.isEven ? 1.5 : 1),
                                      // Adjust sizes based on index
                                      mainAxisSpacing: 8.0,
                                      // Vertical spacing
                                      crossAxisSpacing:
                                          8.0, // Horizontal spacing
                                    ),
                                  ),
                                ],
                              )
                            : sel == 6
                                ? Column(
                                    children: [
                                      SizedBox(height: 2.h),
                                      Row(children: [
                                        SizedBox(width: 1.w),
                                        Text(
                                          'Makeup Ideas',
                                          style: TextStyle(
                                              fontFamily: 'sofi',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.sp,
                                              letterSpacing: 1),
                                        ),
                                      ]),
                                      SizedBox(height: 2.h),
                                      SizedBox(
                                        height: 69.h,
                                        child: StaggeredGridView.countBuilder(
                                          padding: EdgeInsets.zero,
                                          crossAxisCount: 2,
                                          // Number of columns
                                          itemCount: makeup.length,
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
                                                imageUrl: makeup[index]
                                                    .image
                                                    .toString(),
                                                progressIndicatorBuilder: (context,
                                                        url, progress) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Image.asset(
                                                  'assets/deprf.png',
                                                ),
                                              ),
                                            ),
                                          ),
                                          staggeredTileBuilder: (int index) =>
                                              StaggeredTile.count(
                                                  1, index.isEven ? 1.5 : 1),
                                          // Adjust sizes based on index
                                          mainAxisSpacing: 8.0,
                                          // Vertical spacing
                                          crossAxisSpacing:
                                              8.0, // Horizontal spacing
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(children: [
                                    SizedBox(height: 2.h),
                                    Row(children: [
                                      SizedBox(width: 2.w),
                                      Text(
                                        'Wedding Hall',
                                        style: TextStyle(
                                            fontFamily: 'sofi',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp,
                                            letterSpacing: 1),
                                      ),
                                    ]),
                                    SizedBox(height: 1.h),
                                    SizedBox(
                                      height: 69.h,
                                      child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: 0.77 / 1,
                                                crossAxisSpacing: 1.w),
                                        itemCount: venue.length,
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 1.h),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 1.w),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  height: 20.h,
                                                  width: 90.w,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      imageUrl: venue[index]
                                                          .image
                                                          .toString(),
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  progress) =>
                                                              Center(
                                                                  child:
                                                                      CircularProgressIndicator()),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Image.asset(
                                                        'assets/deprf.png',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 2.w),
                                                  child: Text(
                                                    venue[index]
                                                        .name
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15.sp,
                                                        fontFamily: 'sofi',
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 2.w),
                                                  child: Text(
                                                    venue[index]
                                                        .desc
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.7),
                                                        fontSize: 13.sp,
                                                        fontFamily: 'sofi',
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ]),
          ],
        ),
      ),
    );
  }
}
