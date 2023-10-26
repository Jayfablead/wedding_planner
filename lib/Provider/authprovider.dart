import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:wedding_planner/widgets/CustomExpection.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/response.dart';

class authprovider with ChangeNotifier {
  Map<String, String> headers = {
    'Authorization': 'ngjkdsbvsj111nvnbbHHdhsagdf221',
  };

  Future<http.Response> loginapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/login';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> forgotpassapi(Map<String, String> bodyData) async {
    const url = '$baseUrl/forgotPassword';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> changepassapi(Map<String, String> bodyData) async {
    String? url = '$baseUrl/changePassword/${userData?.user?.id.toString()}';
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> updateprofileapi(Map<String, String> bodyData) async {
    print(bodyData);
    String? url = '$baseUrl/updateProfile/${userData?.user?.id.toString()}';
    var responseJson;
    try {
      final imageUploadRequest = http.MultipartRequest('POST', Uri.parse(url));
      imageUploadRequest.headers.addAll(headers);
      if (bodyData['profile_img']?.isNotEmpty ?? false) {
        final file = await http.MultipartFile.fromPath(
          'profile_img',
          bodyData['profile_img'] ?? '',
          contentType: MediaType('image', 'jpg,png'),
        );
        imageUploadRequest.files.add(file);
      }
      imageUploadRequest.fields.addAll(bodyData);
      final streamResponse = await imageUploadRequest.send();
      responseJson = responses(await http.Response.fromStream(streamResponse));
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<http.Response> userprofileapi() async {
    String? url = '$baseUrl/userProfile/${userData?.user?.id.toString()}';
    var responseJson;
    final response = await http.get(Uri.parse(url), headers: headers).timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> booksuccess(String bId) async {
    String? url = '$baseUrl/successBookingInfo/$bId';
    var responseJson;
    final response = await http.get(Uri.parse(url), headers: headers).timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> chatlistapi() async {
    String? url = '$baseUrl/chatList/${userData?.user?.id.toString()}';
    var responseJson;
    final response = await http.get(Uri.parse(url), headers: headers).timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> sendmessageapi(
      Map<String, String> bodyData, String? data1) async {
    String? url =
        '$baseUrl/sendMessage/${userData?.user?.id.toString()}/${data1}';
    print(url);
    var responseJson;
    if (bodyData['mType'] == "1" || bodyData['mType'] == "4") {
      final response = await http
          .post(Uri.parse(url), headers: headers, body: bodyData)
          .timeout(
        const Duration(seconds: 60),
        onTimeout: () {
          throw const SocketException('Something went wrong');
        },
      );
      responseJson = responses(response);
      return responseJson;
    } else {
      try {
        final imageUploadRequest =
            http.MultipartRequest('POST', Uri.parse(url));
        imageUploadRequest.headers.addAll(headers);
        if (bodyData['file']?.isNotEmpty ?? false) {
          final file = await http.MultipartFile.fromPath(
              'file', bodyData['file'] ?? '',
              contentType: bodyData['mType'] == "2"
                  ? MediaType('image', 'jpg,png')
                  : MediaType('video', 'mp4'));
          imageUploadRequest.files.add(file);
        }
        imageUploadRequest.fields.addAll(bodyData);
        final streamResponse = await imageUploadRequest.send();
        responseJson =
            responses(await http.Response.fromStream(streamResponse));
      } on SocketException {
        throw FetchDataException('No Internet connection');
      }
      return responseJson;
    }
  }

  Future<http.Response> fullchatapi(String? data1) async {
    String? url = '$baseUrl/fullChat/${userData?.user?.id.toString()}/$data1';
    var responseJson;
    final response = await http.get(Uri.parse(url), headers: headers).timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    print(response.body);
    responseJson = responses(response);
    return responseJson;
  }
}
