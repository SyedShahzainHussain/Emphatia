import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:store/data/app_exception.dart';

import 'package:store/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await get(Uri.parse(url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic body) async {
    dynamic responseJson;
    try {
      final response = await post(Uri.parse(url), body: body);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
        Map<String, dynamic> errorJson = jsonDecode(response.body);
        if (errorJson.containsKey('message')) {
          throw BadRequestException(errorJson['message']);
        } else {
          throw BadRequestException(response.body.toString());
        }
      case 404:
      case 401:
        Map<String, dynamic> errorJson = jsonDecode(response.body);
        if (errorJson.containsKey('message')) {
          throw UnauthorizedException(errorJson['message']);
        } else {
          throw BadRequestException(response.body.toString());
        }
      default:
        throw FetchDataException(
            'Error occured while communicate with serverwith status code${response.statusCode}');
    }
  }
}
