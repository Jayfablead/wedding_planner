import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ItenraryDetails extends StatefulWidget {
  String? link;
  ItenraryDetails({super.key, this.link});
  @override
  State<ItenraryDetails> createState() => _ItenraryDetailsState();
}

class _ItenraryDetailsState extends State<ItenraryDetails> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.link);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    icon: Icon(Icons.arrow_back_ios_new_rounded,
                        color: Colors.blue, size: 23.sp)),
                Text(
                  'Itinerary View',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'sofi',
                    letterSpacing: 1,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(null)),

                  ],
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(height: 85.h,
              child: SfPdfViewer.network(
                widget.link.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
