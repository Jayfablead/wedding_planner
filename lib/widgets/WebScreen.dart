import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/widgets/headerwidget.dart';

class Webviewscreen extends StatefulWidget {
  String? paymentsurl;
  String? title;

  Webviewscreen({super.key, required this.paymentsurl, required this.title});

  @override
  State<Webviewscreen> createState() => _WebviewscreenState();
}

class _WebviewscreenState extends State<Webviewscreen> {
  late InAppWebViewController _webViewController;

  bool _load = true;

  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _load = true;
    });

    print("Payments${widget.paymentsurl ?? ''}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 5.h),
        header(text: widget.title ?? '', callback1: () {}),
        Container(
          height: 80.h,
          child: InAppWebView(
            initialUrlRequest:
                URLRequest(url: Uri.parse((widget.paymentsurl).toString())),
            androidOnGeolocationPermissionsShowPrompt:
                (InAppWebViewController controller, String origin) async {
              return GeolocationPermissionShowPromptResponse(
                  origin: origin, allow: true, retain: true);
            },
          ),
        ),
      ],
    ));
  }
}
