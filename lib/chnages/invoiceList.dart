import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/InvoicelistModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';
import 'package:wedding_planner/widgets/load.dart';

class InvoiceList extends StatefulWidget {
  const InvoiceList({super.key});

  @override
  State<InvoiceList> createState() => _InvoiceListState();
}

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

class _InvoiceListState extends State<InvoiceList> {
  static var httpClient = new HttpClient();
  TextEditingController _search = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey8 = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    invoiceap();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
        drawer: drawer1(),
        key: scaffoldKey8,
        body: isLoading
            ? Container()
            : Padding(
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
                          header(
                              text: "Invoices",
                              callback1: () {
                                scaffoldKey8.currentState?.openDrawer();
                              }),
                          // headerwid(text: "Certificates"),
                          SizedBox(height: 1.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              searchBox1(),
                            ],
                          ),
                          SizedBox(height: 2.h),
                        ]),
                  )),
                  invoicelistmodal?.invoices?.length == 0 ||
                          invoicelistmodal?.invoices == null
                      ? SliverToBoxAdapter(
                          child: Container(
                            height: 65.h,
                            alignment: Alignment.center,
                            child: Text(
                              "No invoice available",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontFamily: 'sofi',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      : SliverList.builder(
                          itemCount: invoicelistmodal?.invoices?.length,
                          itemBuilder: (context, index) {
                            return Container(
                                height: 19.h,
                                padding: EdgeInsets.all(1.w),
                                margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 1.w),
                                      height: 16.h,
                                      width: 29.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.black38)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: invoicelistmodal
                                                  ?.invoices?[index]
                                                  .supplierDetails
                                                  ?.profile ??
                                              "",
                                          progressIndicatorBuilder: (context,
                                                  url, progress) =>
                                              Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                            'assets/user.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 54.w,
                                          child: Container(
                                            padding: EdgeInsets.only(left: 1.w),
                                            child: Text(
                                              'Services ${index + 1}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 1.h),
                                        Container(
                                          padding: EdgeInsets.only(left: 1.w),
                                          width: 55.w,
                                          child: Text(
                                            invoicelistmodal
                                                            ?.invoices?[index]
                                                            .supplierDetails
                                                            ?.name ==
                                                        "" ||
                                                    invoicelistmodal
                                                            ?.invoices?[index]
                                                            .supplierDetails
                                                            ?.name ==
                                                        null
                                                ? "N/A"
                                                : invoicelistmodal
                                                        ?.invoices?[index]
                                                        .supplierDetails
                                                        ?.name ??
                                                    "",
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        SizedBox(height: 1.h),
                                        Container(
                                          padding: EdgeInsets.only(left: 1.w),
                                          width: 55.w,
                                          child: Text(
                                            'Invoice id: ' +
                                                (invoicelistmodal
                                                                ?.invoices?[
                                                                    index]
                                                                .invId ==
                                                            "" ||
                                                        invoicelistmodal
                                                                ?.invoices?[
                                                                    index]
                                                                .invId ==
                                                            null
                                                    ? "N/A"
                                                    : (invoicelistmodal
                                                            ?.invoices?[index]
                                                            .invId)
                                                        .toString()),
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        SizedBox(height: 1.h),
                                        InkWell(
                                          onTap: () async {
                                            EasyLoading.show(
                                                status: 'Downloading ..',
                                                indicator:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ));
                                            const downloadsFolderPath =
                                                '/storage/emulated/0/Download';
                                            var request =
                                                await httpClient.getUrl(
                                                    Uri.parse(invoicelistmodal
                                                            ?.invoices?[index]
                                                            .invFile ??
                                                        ""));
                                            var response =
                                                await request.close();
                                            var bytes =
                                                await consolidateHttpClientResponseBytes(
                                                    response);
                                            Directory dir = Platform.isAndroid
                                                ? Directory(downloadsFolderPath)
                                                : await getApplicationDocumentsDirectory();

                                            final String filePath =
                                                '${dir.path}/${invoicelistmodal?.invoices?[index].supplierDetails?.name ?? ""}.pdf';
                                            final File file = File(filePath);
                                            await file.writeAsBytes(bytes);
                                            EasyLoading.showSuccess(
                                                "Downloaded");
                                            print(file);
                                          },
                                          child: Container(
                                            width: 45.w,
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.2.h),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 3.w),
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(90)),
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
                        ),
                ]),
              ),
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

  Widget searchBox1() {
    return Container(
      alignment: Alignment.center,
      width: 85.w,
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

  invoiceap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().invoicelistapi().then((response) async {
          invoicelistmodal =
              Invoicelistmodal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && invoicelistmodal?.status == "1") {
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
}
