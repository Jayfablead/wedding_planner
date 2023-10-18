import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wedding_planner/widgets/CustomExpection.dart';
import 'package:wedding_planner/widgets/sharedpreferance.dart';

responses(http.Response response) {
  switch (response.statusCode) {
    case 200:
      {
        if (jsonDecode(response.body)['statusCode'] == 101) {
          SaveDataLocal.clearUserData();
        }
        return response;
      }
    case 400:
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode :${response.statusCode}');
  }
}
