import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class FoodMenusPage extends StatefulWidget {
  const FoodMenusPage({super.key});

  @override
  State<FoodMenusPage> createState() => _FoodMenusPageState();
}

class food {
  String? image;
  String? name;
  String? desc;
  String? price;

  food(
    this.image,
    this.name,
    this.desc,
    this.price,
  );
}

List<food> fooditems = [
  food(
      'https://4.imimg.com/data4/AP/VG/ANDROID-37526939/product-500x500.jpeg',
      'Gujarati Thali',
      'Gujarati Thali is an assortment of dishes arranged as a platter for lunch or dinner in restaurants and homes, mostly in Gujarat and places with Gujarati diaspora. “Thali” literally means “plate”.',
      '140.02'),
  food(
      'https://cookwithrenu.com/wp-content/uploads/2020/09/Punjabi-Thali_Featured-Image.jpg',
      'Punjabi Thali',
      'Punjabi cuisine is a culinary style originating in the Punjab, a region in the northern part of South Asia, which is now divided in an Indian part to the east and a Pakistani part to the west.',
      '160.02'),
  food(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Royal_Rajasthani_Thali_at_Suvarna_Mahal%2C_Ram_Bagh_Hotel%2C_Jaipur.jpg/640px-Royal_Rajasthani_Thali_at_Suvarna_Mahal%2C_Ram_Bagh_Hotel%2C_Jaipur.jpg',
      'Rajashthani Thali',
      'Rajasthani cuisine is the cuisine of the Rajasthan region in North West India. It was influenced by various factors like the warlike lifestyles of its inhabitants, the availability of ingredients in an arid region and by Hindu temple traditions of sampradayas like Pushtimarg and Ramanandi.',
      '180.02'),
  food(
      'https://dinedelicious.in/wp-content/uploads/2021/03/Rabdi-Recipe-Easy-500x375.jpg',
      'Rabdi',
      'Rabdi is a sweet, condensed-milk-based dish, originating from the Indian subcontinent, more specifically Bengal region.',
      '50.02'),
  food(
      'https://enjoyinfourseason.com/wp-content/uploads/2022/05/Fourseason-HOT-GULAB-JAMUN-2PC.jpg',
      'Gulab Jamun',
      'Gulab jamun is a sweet confectionery or dessert, originating in Persia and then later introduced to the Indian subcontinent.',
      '50.02'),
];
List<food> TopRated = [
  food(
      'https://img-global.cpcdn.com/recipes/0ab0c56e39003e77/1200x630cq70/photo.jpg',
      'Idli-Sambar',
      'Idli or idly is a type of savoury rice cake, originating from South India, popular as a breakfast food in Southern India and in Sri Lanka.',
      '20.02'),
  food(
      'https://i.ytimg.com/vi/V3RLMcOLYXQ/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGH8gUigbMA8=&rs=AOn4CLCDUdLQtFw5eN0cHdfVugwHS2LukQ',
      'Vada-Sambar',
      'Vada is a category of savoury fried snacks native to South India. Vadas can be described variously as fritters, cutlets, or dumplings. Alternative names for this food include vadai, vade, and bada.',
      '20.02'),
];
List<food> Allfav = [
  food(
      'https://img-global.cpcdn.com/recipes/652f8c4bda361a03/1200x630cq70/photo.jpg',
      'Mix Sabzi',
      'Mixed Vegetables, also known as Mix Vegetable, is a Japanese manga series written and illustrated by Ayumi Komura.',
      '120.02'),
  food(
      'https://www.vegrecipesofindia.com/wp-content/uploads/2013/07/naan-recipe-2.jpg',
      'Roti-Naan',
      'Naan is a leavened, oven-baked (usually using a tandoor) or tawa-fried  flatbread which is found in the cuisines mainly of Iran, Afghanistan, Central Asia, the Indian subcontinent, Indonesia, Malaysia, Myanmar, and the Caribbean.',
      '40.02'),
  food(
      'https://i.pinimg.com/originals/fe/6c/f4/fe6cf4c486aee8d70ea43a7b772abdc2.jpg',
      'Salad',
      'A salad is a dish consisting of mixed ingredients, frequently vegetables. They are typically served chilled or at room temperature, though some can be served warm.',
      '20.02'),
  food(
      'https://curlytales.com/wp-content/uploads/2023/04/cover-1-14-585x390.jpg',
      'Papad',
      'A papad, is an Indian dough of black gram bean flour, either deep fried or cooked with dry heat (flipped over an open flame) until crunchy. Other flours made from lentils, chickpeas, rice, tapioca, millet or potato are also used.',
      '20.02'),
  food(
      'https://www.cookwithmanali.com/wp-content/uploads/2019/03/Rice-and-Dal-Instant-Pot-500x500.jpg',
      'Dal-Rice',
      'Dāl bhāt is a traditional meal originated from Nepal and popular in many areas of India, Pakistan and Bangladesh. It consists of steamed rice and a cooked lentil or other pulses stew called dal. It is a staple food in these countries. Bhāt or chāwal means "boiled rice" in a number of Indo-Aryan languages.',
      '80.02'),
];
List cate = ['All', 'Veg', 'Non-Veg', 'Top Rated'];
int sel = 0;
bool rec = false;
bool top = true;
bool fav = true;
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _FoodMenusPageState extends State<FoodMenusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffefefef),
      key: _scaffoldKey,
      drawer: drawer1(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 6.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_back_ios_new_rounded)),
                        Text(
                          'Food Menu',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                            icon: Icon(Icons.menu_rounded)),
                      ],
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                  child: Column(
                children: [
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://scontent.fstv3-1.fna.fbcdn.net/v/t39.30808-6/305220149_495231479273840_8870209323185881114_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=a2f6c7&_nc_ohc=JitQYcURCT8AX8hWsHr&_nc_ht=scontent.fstv3-1.fna&oh=00_AfBGo4wcKtVfF1N56WRWhyUCKheYrbykEKdgcwkcCMf8jQ&oe=64F88C45',
                          height: 9.h,
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
                        width: 60.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 0.5.h),
                            Text(
                              'Hotel Marriott King',
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
                ],
              )),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 6.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      sel = index;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.h, horizontal: 8.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: sel == index
                                            ? Colors.pink
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(9)),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Text(cate[index],
                                        style: TextStyle(
                                            fontSize: 12.5.sp,
                                            fontFamily: 'sofi',
                                            color: sel == index
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: cate.length,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          rec = !rec;
                          print(rec);
                        });
                      },
                      child: Container(
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recommended ',
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.bold),
                                ),
                                (rec)
                                    ? Transform.rotate(
                                        angle: -90 * pi / 180,
                                        child: Icon(
                                          Icons.arrow_left,
                                          size: 5.h,
                                        ))
                                    : Transform.rotate(
                                        angle: 90 * pi / 180,
                                        child: Icon(
                                          Icons.arrow_left,
                                          size: 5.h,
                                        )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              (rec)
                  ? SliverToBoxAdapter()
                  : SliverGrid.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 2 / 1,
                          crossAxisSpacing: 2.w,
                          mainAxisSpacing: 1.h),
                      itemCount: fooditems.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1.w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 45.w,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 0.5.h, horizontal: 1.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              (fooditems[index].name)
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontFamily: 'sofi',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '\$ ' +
                                                  (fooditems[index].price)
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontFamily: 'sofi',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              fooditems[index].desc ?? '',
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontFamily: 'sofi',
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              fooditems[index].image ?? '',
                                          height: 20.h,
                                          width: 45.w,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            Positioned(
                                left: 72.w,
                                top: 0.5.h,
                                child: Container(
                                  padding: EdgeInsets.all(2.w),
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.add,
                                        color: Colors.white,
                                        size: 15.sp,
                                      ),
                                      Text(
                                        'Budget',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.white,
                                            fontFamily: 'sofi',
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        );
                      },
                    ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          top = !top;
                          print(top);
                        });
                      },
                      child: Container(
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Top Rated ',
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.bold),
                                ),
                                (top)
                                    ? Transform.rotate(
                                        angle: -90 * pi / 180,
                                        child: Icon(
                                          Icons.arrow_left,
                                          size: 5.h,
                                        ))
                                    : Transform.rotate(
                                        angle: 90 * pi / 180,
                                        child: Icon(
                                          Icons.arrow_left,
                                          size: 5.h,
                                        )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              (top)
                  ? SliverToBoxAdapter()
                  : SliverGrid.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 2 / 1,
                          crossAxisSpacing: 2.w,
                          mainAxisSpacing: 1.h),
                      itemCount: TopRated.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1.w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 45.w,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 0.5.h, horizontal: 1.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              (TopRated[index].name).toString(),
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontFamily: 'sofi',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '\$ ' +
                                                  (TopRated[index].price)
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontFamily: 'sofi',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              TopRated[index].desc ?? '',
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontFamily: 'sofi',
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: CachedNetworkImage(
                                          imageUrl: TopRated[index].image ?? '',
                                          height: 20.h,
                                          width: 45.w,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            Positioned(
                                left: 72.w,
                                top: 0.5.h,
                                child: Container(
                                  padding: EdgeInsets.all(2.w),
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.add,
                                        color: Colors.white,
                                        size: 15.sp,
                                      ),
                                      Text(
                                        'Budget',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.white,
                                            fontFamily: 'sofi',
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        );
                      },
                    ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          fav = !fav;
                          print(fav);
                        });
                      },
                      child: Container(
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'All time Favourite ',
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: 'sofi',
                                      fontWeight: FontWeight.bold),
                                ),
                                (fav)
                                    ? Transform.rotate(
                                        angle: -90 * pi / 180,
                                        child: Icon(
                                          Icons.arrow_left,
                                          size: 5.h,
                                        ))
                                    : Transform.rotate(
                                        angle: 90 * pi / 180,
                                        child: Icon(
                                          Icons.arrow_left,
                                          size: 5.h,
                                        )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              (fav)
                  ? SliverToBoxAdapter()
                  : SliverGrid.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 2 / 1,
                          crossAxisSpacing: 2.w,
                          mainAxisSpacing: 1.h),
                      itemCount: Allfav.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1.w),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 45.w,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 0.5.h, horizontal: 1.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              (Allfav[index].name).toString(),
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontFamily: 'sofi',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '\$ ' +
                                                  (Allfav[index].price)
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontFamily: 'sofi',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              Allfav[index].desc ?? '',
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontFamily: 'sofi',
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: CachedNetworkImage(
                                          imageUrl: Allfav[index].image ?? '',
                                          height: 20.h,
                                          width: 45.w,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            Positioned(
                                left: 72.w,
                                top: 0.5.h,
                                child: Container(
                                  padding: EdgeInsets.all(2.w),
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.add,
                                        color: Colors.white,
                                        size: 15.sp,
                                      ),
                                      Text(
                                        'Budget',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.white,
                                            fontFamily: 'sofi',
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        );
                      },
                    ),
              SliverToBoxAdapter(
                child: Container(height: 3.h),
              )
            ],
          ),
        ),
      ),
    );
  }
}
