import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'WebView.dart';

class PdfView extends StatefulWidget {
  String? link;

  PdfView({super.key, this.link});

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  static var httpClient = new HttpClient();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("LINK : ${widget.link}");
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.blue, size: 20.sp)),
                  Text(
                    'Pdf View',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'task',
                      letterSpacing: 1,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () async {
                            final String? url = widget.link;
                            String fileExtension = path.extension(url!);
                            if (fileExtension == ".txt") {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return webview(
                                    data: widget.link,
                                  );
                                },
                              ));
                            } else {
                              EasyLoading.show(
                                  status: 'Downloading ..',
                                  indicator: CircularProgressIndicator(
                                    color: Colors.white,
                                  ));
                              const downloadsFolderPath =
                                  '/storage/emulated/0/Download';
                              var request = await httpClient
                                  .getUrl(Uri.parse((widget.link).toString()));
                              var response = await request.close();
                              var bytes =
                                  await consolidateHttpClientResponseBytes(
                                      response);
                              String fileName = url.toString().split('/').last;

                              Directory dir = Platform.isAndroid
                                  ? Directory(downloadsFolderPath)
                                  : await getApplicationDocumentsDirectory();
                              final String filePath =
                                  '${dir.path}/${fileName}${fileName.endsWith('.pdf') ? '' : '.pdf'}';
                              final File file = File(filePath);
                              await file.writeAsBytes(bytes);
                              EasyLoading.showSuccess("Downloaded");
                              print(file);
                              Fluttertoast.showToast(
                                  msg: 'file downloaded to : ${dir.path}',
                                  toastLength: Toast.LENGTH_SHORT,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.blue,
                                  textColor: Colors.white,
                                  fontSize: 13.sp);
                            }
                          },
                          icon: Icon(
                            CupertinoIcons.arrow_down,
                            size: 19.sp,
                            color: Colors.blue,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              height: 85.h,
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
