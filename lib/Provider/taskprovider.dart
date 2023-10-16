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
    return responseJson;
  }
  Future<http.Response> addchecklistapi(Map<String, String> bodyData) async {
    String? url = '$baseUrl/addCheckList/${userData?.user?.id.toString()}';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), headers: headers,body: bodyData)
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> unreadmsgapi() async {
    String? url = '$baseUrl/unreadMsgs/${userData?.user?.id.toString()}';
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
    return responseJson;
  }
  Future<http.Response> readmsgapi(String? data1) async {
    String? url = '$baseUrl/readNewMsg/${userData?.user?.id.toString()}/${data1}';
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
    return responseJson;
  }


  Future<http.Response> venuedeatilapi() async {

    String? url = '$baseUrl/myVenue/${userData?.user?.id.toString()}';

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

    return responseJson;
  }
  Future<http.Response> addguestapi(Map<String, String> bodyData) async {

    String? url = '$baseUrl/addGuest/${userData?.user?.id.toString()}';

    var responseJson;
    final response = await http
        .post(Uri.parse(url), headers: headers,body: bodyData)
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);

    return responseJson;
  }
  Future<http.Response> viewguestapi() async {

    String? url = '$baseUrl/myGuestList/${userData?.user?.id.toString()}';
    // String? url = '$baseUrl/myVenue/17';

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

    return responseJson;
  }
  Future<http.Response> removeguestapi(String? data1) async {

    String? url = '$baseUrl/removeGuest/${data1}';
    // String? url = '$baseUrl/myVenue/17';

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

    return responseJson;
  }
}
