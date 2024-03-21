import 'package:store/data/network/base_api_services.dart';
import 'package:store/data/network/network_api_services.dart';
import 'package:store/features/authentication/model/meditation_model.dart';

class GetMeditationDataRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<List<MeditationModel>> getMeditationApi(String apiUrl) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(apiUrl);
      var data = response as List;

      return data
          .map((dynamic json) => MeditationModel.fromJson(json))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
