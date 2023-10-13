import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/response.dart';

class taskprovider with ChangeNotifier{
  Map<String, String> headers = {
    'Authorization': 'ngjkdsbvsj111nvnbbHHdhsagdf221',
  };
  Future<http.Response> checklistapi() async {

    String? url = '$baseUrl/checkList/${userData?.user?.id.toString()}';
    print(url);
    var responseJson;
    final response = await http
        .get(Uri.parse(url), headers: headers)
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );

    responseJson = responses(response);
    print(response.body);
    return responseJson;
  }
}
