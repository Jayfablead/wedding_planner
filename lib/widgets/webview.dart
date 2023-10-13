import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class webview extends StatefulWidget {
  final String? data;
  webview({Key? key,this.data}) : super(key: key);

  @override
  State<webview> createState() => _webviewState();
}

class _webviewState extends State<webview> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffb4776e6),
          automaticallyImplyLeading: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("File"),
              // GestureDetector(
              //   onTap: (){},
              //   child: Icon(Icons.download),
              // )
            ],
          ),
        ),
        body: InAppWebView(
          initialUrlRequest:
          URLRequest(url: Uri.parse((widget.data).toString())),
          androidOnGeolocationPermissionsShowPrompt:
              (InAppWebViewController controller, String origin) async {
            return GeolocationPermissionShowPromptResponse(
                origin: origin,
                allow: true,
                retain: true
            );
          },
        )
    );
  }
}
