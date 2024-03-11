import 'package:store/data/network/base_api_services.dart';
import 'package:store/data/network/network_api_services.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> postApi(dynamic body, String apiUrl) async {
    try {
      dynamic response = _apiServices.getPostApiResponse(apiUrl, body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
