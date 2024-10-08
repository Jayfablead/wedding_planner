import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/response.dart';

import '../widgets/CustomExpection.dart';

class taskprovider with ChangeNotifier {
  Map<String, String> headers = {
    'Authorization': 'ngjkdsbvsj111nvnbbHHdhsagdf221',
  };

  Future<http.Response> Viewboardsapi(String suppid, String catid) async {
    String? url =
        '$baseUrl/myboards/${userData?.user?.id.toString()}/$suppid/$catid';
    print(url);
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

  Future<http.Response> addpostapi(
      Map<String, String> bodyData, List<File> imagePaths) async {
    String? url = '$baseUrl/addBoard/${userData?.user?.id.toString()}';
    print(url);
    var responseJson;
    final imageUploadRequest = http.MultipartRequest('POST', Uri.parse(url));
    imageUploadRequest.headers.addAll(headers);
    if (imagePaths.isNotEmpty) {
      for (var imagePath in imagePaths) {
        var file = await http.MultipartFile.fromPath(
          'postfiles[]',
          imagePath.path,
          contentType: MediaType('image', 'jpg'),
        );
        imageUploadRequest.files.add(file);
      }
    }
    imageUploadRequest.fields.addAll(bodyData);
    final streamResponse = await imageUploadRequest.send();
    var response = await http.Response.fromStream(streamResponse);
    responseJson = responses(response);
    // print("responseJson = ${json.decode(responseJson)}");
    return responseJson;
  }

  Future<http.Response> categoryapi() async {
    String? url = '$baseUrl/bookedServices/${userData?.user?.id.toString()}';
    print(url);
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

  Future<http.Response> categoryapi1() async {
    String? url = '$baseUrl/allServices';
    print(url);
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

  Future<http.Response> checklistapi() async {
    String? url = '$baseUrl/checkList/${userData?.user?.id.toString()}';
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

  Future<http.Response> suppliersearchapi(Map<String, String> bodyData) async {
    String? url = '$baseUrl/searchSuppliers/${userData?.user?.id}';

    var responseJson;
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
  }

  Future<http.Response> searchchecklistapi(Map<String, String> bodyData) async {
    String? url = '$baseUrl/searchCheckList/${userData?.user?.id.toString()}';
    var responseJson;
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
  }

  Future<http.Response> sentBookingReq(Map<String, String> bodyData) async {
    String? url = '$baseUrl/sentBookingReq/${userData?.user?.id.toString()}';
    var responseJson;
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
  }

  Future<http.Response> supplierdetailapi(String? suppid, String? catid) async {
    String? url =
        '$baseUrl/supplierDetails/${userData?.user?.id.toString()}/${suppid}/${catid}';
    print(url);
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

  Future<http.Response> addchecklistapi(Map<String, String> bodyData) async {
    String? url = '$baseUrl/addCheckList/${userData?.user?.id.toString()}';
    var responseJson;
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
  }

  Future<http.Response> unreadmsgapi() async {
    String? url = '$baseUrl/unreadMsgs/${userData?.user?.id.toString()}';
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

  Future<http.Response> readmsgapi(String? data1) async {
    String? url =
        '$baseUrl/readNewMsg/${userData?.user?.id.toString()}/${data1}';
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

  Future<http.Response> addmeetingapi(Map<String, String> bodyData) async {
    String? url = '$baseUrl/addMeeting/${userData?.user?.id.toString()}';

    var responseJson;
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
  }

  Future<http.Response> viewcategorryapi(String data1) async {
    String? url =
        '$baseUrl/categoryWiseSuppliers/${userData?.user?.id.toString()}/${data1}';
    print(url);
    var responseJson;
    final response = await http
        .get(
      Uri.parse(url),
      headers: headers,
    )
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> bookinglistapi() async {
    String? url = '$baseUrl/myBookings/${userData?.user?.id.toString()}';
    print(url);
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

  Future<http.Response> venuedeatilapi() async {
    String? url = '$baseUrl/myVenue/${userData?.user?.id.toString()}';

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

  Future<http.Response> SupDrop() async {
    String? url = '$baseUrl/suppliers_list/${userData?.user?.id.toString()}';

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

  Future<http.Response> addguestapi(Map<String, String> bodyData) async {
    String? url = '$baseUrl/addGuest/${userData?.user?.id.toString()}';

    var responseJson;
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
  }

  Future<http.Response> Addtopicap(Map<String, String> bodyData) async {
    String? url = '$baseUrl/saveTopic';

    var responseJson;
    final response = await http
        .post(Uri.parse(url), headers: headers, body: bodyData)
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

  Future<http.Response> viewguestapi() async {
    String? url = '$baseUrl/myGuestList/${userData?.user?.id.toString()}';
    // String? url = '$baseUrl/myVenue/17';
    print(url);

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

  Future<http.Response> removeguestapi(String? data1) async {
    String? url = '$baseUrl/removeGuest/${data1}';
    // String? url = '$baseUrl/myVenue/17';

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

  Future<http.Response> markcompletedapi(
      Map<String, String> bodyData, String data1) async {
    String? url =
        '$baseUrl/markAsCompleted/${userData?.user?.id.toString()}/${data1}';
    var responseJson;
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
  }

  Future<http.Response> removetodoapi(String data1) async {
    String? url = '$baseUrl/deleteCheckList/${data1}';
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

  Future<http.Response> notificationapi() async {
    String? url = '$baseUrl/notification/${userData?.user?.id.toString()}';
    // String? url = '$baseUrl/notification/21';
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

  Future<http.Response> myvenuetableapi(String floorId) async {
    String? url = '$baseUrl/myVenueTables/${userData?.user?.vid}/${floorId}';
    print(url);
    var responseJson;
    final response = await http.get(Uri.parse(url), headers: headers).timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    print(response.body);

    return responseJson;
  }

  Future<http.Response> guestseatingapi() async {
    String? url = '$baseUrl/myGuestSeating/${userData?.user?.id.toString()}';
    print(url);

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

  Future<http.Response> homeapi() async {
    String? url = '$baseUrl/myHome/${userData?.user?.id.toString()}';
    print("dsffsdhfjsd${url}");

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

  Future<http.Response> Mysups() async {
    String? url = '$baseUrl/mySuppliers/${userData?.user?.id.toString()}';
    print(url);
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

  Future<http.Response> subtype() async {
    String? url = '$baseUrl/suppliers_service_categories';
    print(url);
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

  Future<http.Response> unreadnotiapi() async {
    String? url = '$baseUrl/unreadNoti/${userData?.user?.id.toString()}';

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

  Future<http.Response> readnotiapi() async {
    String? url = '$baseUrl/readNoti/${userData?.user?.id.toString()}';

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

  Future<http.Response> meetingapi(String? date1) async {
    String? url = '$baseUrl/myMeetings/${userData?.user?.id}?date=${date1}';
    // String? url="https://wedding.fableadtechnolabs.com/wedding/portal/api/myMeetings/17?date=25/10/2023";

    var responseJson;
    final response = await http
        .get(
      Uri.parse(url),
      headers: headers,
    )
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> floordetelisapi() async {
    String? url = '$baseUrl/venueFloorPlans/${userData?.user?.vid}';
    var responseJson;
    final response = await http
        .get(
      Uri.parse(url),
      headers: headers,
    )
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> venuedetaliapi(String Fid) async {
    String? url = '$baseUrl/venueFloorPlanDetails/${Fid}';
    var responseJson;
    final response = await http
        .get(
      Uri.parse(url),
      headers: headers,
    )
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> addtofavouriteapi(Map<String, String> bodyData) async {
    String? url = '$baseUrl/addToFav';
    print(url);
    var responseJson;
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
  }

  Future<http.Response> favouritelist() async {
    String? url = '$baseUrl/myFavList/${userData?.user?.id.toString()}';
    print(url);
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

  Future<http.Response> addtobudgetapi(Map<String, String> bodyData) async {
    String? url = '$baseUrl/addTobudget';

    var responseJson;
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
  }

  Future<http.Response> setbudgetapi(Map<String, String> bodyData) async {
    String? url = '$baseUrl/setBudget/${userData?.user?.id.toString()}';

    var responseJson;
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
  }

  Future<http.Response> removefrombudgetapi(String? data1) async {
    String? url = '$baseUrl/rmvFrombudget/${data1}';
    print(url);
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

  Future<http.Response> invoicelistapi() async {
    String? url = '$baseUrl/myInvoices/${userData?.user?.id.toString()}';

    var responseJson;
    final response = await http
        .get(
      Uri.parse(url),
      headers: headers,
    )
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

  Future<http.Response> mybudgetapi() async {
    String? url = '$baseUrl/mybudget/${userData?.user?.id.toString()}';
    print(url);
    var responseJson;
    final response = await http.get(Uri.parse(url), headers: headers).timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    print(response.body);
    return responseJson;
  }

  Future<http.Response> QuoteDetailsApi(String Qid) async {
    String? url = '$baseUrl/quotationDetails/${Qid}';

    print(url);
    var responseJson;
    final response = await http.get(Uri.parse(url), headers: headers).timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    print(response.body);
    return responseJson;
  }

  Future<http.Response> QuoteAcceptApi(String Qid) async {
    String? url = '$baseUrl/acceptQuotation/${Qid}';
    print(url);
    var responseJson;
    final response = await http.get(Uri.parse(url), headers: headers).timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    print(response.body);
    return responseJson;
  }

  Future<http.Response> QuoteRejectApi(String Qid) async {
    String? url = '$baseUrl/rejectQuotation/${Qid}';
    print(url);
    var responseJson;
    final response = await http.get(Uri.parse(url), headers: headers).timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    print(response.body);
    return responseJson;
  }

  Future<http.Response> chatserchapi(Map<String, String> bodyData) async {
    String? url = '$baseUrl/searchChat/${userData?.user?.id.toString()}';
    print(url);
    var responseJson;
    final response = await http
        .post(Uri.parse(url), headers: headers, body: bodyData)
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    print(response.body);
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> searchquotationapi(Map<String, String> bodyData) async {
    String? url = '$baseUrl/searchQuotation/${userData?.user?.id.toString()}';
    var responseJson;
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
  }

  Future<http.Response> QouteListApi() async {
    String? url = '$baseUrl/myQuotations/${userData?.user?.id.toString()}';
    print(url);
    var responseJson;
    final response = await http.get(Uri.parse(url), headers: headers).timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    print(response.body);
    return responseJson;
  }

  Future<http.Response> documentapi() async {
    String? url = '$baseUrl/myDocuments/${userData?.user?.id}';
    print(url);
    // String? url="https://wedding.fableadtechnolabs.com/wedding/portal/api/myMeetings/17?date=25/10/2023";

    var responseJson;
    final response = await http
        .get(
      Uri.parse(url),
      headers: headers,
    )
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

  Future<http.Response> itienraryapi() async {
    String? url = '$baseUrl/myItenerary/${userData?.user?.id}';
    print(url);
    // String? url="https://wedding.fableadtechnolabs.com/wedding/portal/api/myMeetings/17?date=25/10/2023";

    var responseJson;
    final response = await http
        .get(
      Uri.parse(url),
      headers: headers,
    )
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

  Future<http.Response> quoteapi(Map<String, String> bodyData) async {
    String? url = '$baseUrl/sendQuotationReq';

    var responseJson;
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
  }

  Future<http.Response> deleteItinerary(Map<String, String> bodyData) async {
    String? url = '$baseUrl/delteItenerary';

    var responseJson;
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
  }

  Future<http.Response> seatingapiflutterapi() async {
    String? url = '$baseUrl/myGuestSeating/${userData?.user?.id}';
    print(url);
    // String? url="https://wedding.fableadtechnolabs.com/wedding/portal/api/myMeetings/17?date=25/10/2023";

    var responseJson;
    final response = await http
        .get(
      Uri.parse(url),
      headers: headers,
    )
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

  Future<http.Response> itenraryuploadapi(Map<String, String> bodyData) async {
    String? url = '$baseUrl/uploadItenerary/${userData?.user?.id}';

    var responseJson;
    final imageUploadRequest = http.MultipartRequest('POST', Uri.parse(url));
    imageUploadRequest.headers.addAll(headers);
    if (bodyData['itinerary_file']?.isNotEmpty ?? false) {
      final file = await http.MultipartFile.fromPath(
          'itinerary_file', bodyData['itinerary_file'] ?? '',
          contentType: MediaType('application', 'pdf,doc,docx'));
      imageUploadRequest.files.add(file);
    }
    imageUploadRequest.fields.addAll(bodyData);
    final streamResponse = await imageUploadRequest.send();
    responseJson = responses(await http.Response.fromStream(streamResponse));
    return responseJson;
  }

  Future<http.Response> FloorplansList() async {
    String? url = '$baseUrl/venueFloorPlans/${userData?.user?.vid}';
    var responseJson;
    final response = await http
        .get(
      Uri.parse(url),
      headers: headers,
    )
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> MyEventDetailsApi() async {
    String? url = '$baseUrl/myEventDetail/${userData?.user?.id}';
    print(url);
    var responseJson;
    final response = await http
        .get(
      Uri.parse(url),
      headers: headers,
    )
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    print(response.body);
    print(response.bodyBytes);
    return responseJson;
  }

  Future<http.Response> requsestsuppiersapi(
      Map<String, String> bodyData, List<String> imagePaths) async {
    print(bodyData);
    String? url = '$baseUrl/requestSupplier/${userData?.user?.id.toString()}';
    var responseJson;
    try {
      final imageUploadRequest = http.MultipartRequest('POST', Uri.parse(url));
      imageUploadRequest.headers.addAll(headers);
      if (bodyData['p_img']?.isNotEmpty ?? false) {
        final file = await http.MultipartFile.fromPath(
          'p_img',
          bodyData['p_img'] ?? '',
          contentType: MediaType('image', 'jpg,png'),
        );
        imageUploadRequest.files.add(file);
      }
      if (imagePaths.isNotEmpty) {
        for (var imagePath in imagePaths) {
          var file = await http.MultipartFile.fromPath(
            'c_img[]',
            imagePath!,
            contentType: MediaType('image', 'jpg'),
          );
          imageUploadRequest.files.add(file);
        }
      }
      imageUploadRequest.fields.addAll(bodyData);
      final streamResponse = await imageUploadRequest.send();
      responseJson = responses(await http.Response.fromStream(streamResponse));
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<http.Response> restetsuppliersviewapi() async {
    String? url =
        '$baseUrl/requestedSuppliers/${userData?.user?.id.toString()}';
    print(url);
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

  Future<http.Response> deletesuppliersresuestapi(String data1) async {
    String? url = '$baseUrl/deleteRequestedSupplier/${data1}';
    print(url);
    var responseJson;
    final response = await http
        .post(
      Uri.parse(url),
      headers: headers,
    )
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> updatesulierapi(
      Map<String, String> bodyData, String data1) async {
    print(bodyData);
    String? url = '$baseUrl/updateRequestedSupplier/${data1}';
    var responseJson;
    try {
      final imageUploadRequest = http.MultipartRequest('POST', Uri.parse(url));
      imageUploadRequest.headers.addAll(headers);
      if (bodyData['p_img']?.isNotEmpty ?? false) {
        final file = await http.MultipartFile.fromPath(
          'p_img',
          bodyData['p_img'] ?? '',
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

  Future<http.Response> alldelivaryshowapi() async {
    String? url = '$baseUrl/all_delivery_collection';
    print(url);
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

  Future<http.Response> viewdeliveryapi(String data1) async {
    String? url = '$baseUrl/view_delivery_collection/${data1}';
    print(url);
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

  Future<http.Response> approvedsuppliersapi() async {
    String? url = '$baseUrl/approvedSuppliers/${userData?.user?.id.toString()}';
    print(url);
    var responseJson;
    final response = await http.get(Uri.parse(url), headers: headers).timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    print(response.body);
    return responseJson;
  }

  Future<http.Response> viewalleventspaceapi(
      Map<String, String> bodyData) async {
    String? url = '$baseUrl/eventSpace';
    var responseJson;
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
  }

  Future<http.Response> singaleventspaceapi(
      Map<String, String> bodyData) async {
    String? url = '$baseUrl/editeventSpace';
    var responseJson;
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
  }

  Future<http.Response> getservicesupplirsapi(
      Map<String, String> bodyData) async {
    String? url =
        '$baseUrl/get_suppliers_service/${userData?.user?.id.toString()}';

    var responseJson;
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
  }

  Future<http.Response> pedingdeliveryapi() async {
    String? url = '$baseUrl/get_delivery_collection';
    print(url);
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

  Future<http.Response> pedingmeetingapi(String? date1) async {
    String? url =
        '$baseUrl/myPendingMeetings/${userData?.user?.id}?date=${date1}';
    // String? url="https://wedding.fableadtechnolabs.com/wedding/portal/api/myMeetings/17?date=25/10/2023";

    var responseJson;
    final response = await http
        .get(
      Uri.parse(url),
      headers: headers,
    )
        .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> viewmeetingapi(Map<String, String> bodyData) async {
    String? url = '$baseUrl/editMeeting';

    var responseJson;
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
  }
}
