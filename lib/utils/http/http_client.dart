import 'dart:convert';

import 'package:http/http.dart';

class THttpClient {
  static const String apiUrl = "";

  static Future<dynamic> getApi([String? endPoint]) async {
    final response = await get(Uri.parse(apiUrl));
    return _handleReponse(response);
  }

  static Future<dynamic> postApi(dynamic data, [String? endPoint]) async {
    final response = await post(Uri.parse(apiUrl), body: jsonEncode(data));
    return _handleReponse(response);
  }

  static Future<dynamic> putApi(dynamic data, [String? endPoint]) async {
    final response = await put(Uri.parse(apiUrl), body: jsonEncode(data));
    return _handleReponse(response);
  }

  static Future<dynamic> deletedApi([String? endPoint]) async {
    final response = await delete(Uri.parse(apiUrl));
    return _handleReponse(response);
  }

  static _handleReponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return Exception("Failed to load data: ${response.statusCode}");
    }
  }
}
