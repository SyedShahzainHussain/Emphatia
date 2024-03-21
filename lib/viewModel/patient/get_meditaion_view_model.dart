import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store/data/response/api_response.dart';
import 'package:store/features/authentication/model/meditation_model.dart';
import 'package:store/repository/meditation_get_data_repo.dart';
import 'package:store/utils/constants/api_constants.dart';

class GetMeditationDataViewModel with ChangeNotifier {
  GetMeditationDataRepository getMeditationDataRepository =
      GetMeditationDataRepository();

  ApiResponse<List<MeditationModel>> apiResponse = ApiResponse.loading();

  setMeditationList(ApiResponse<List<MeditationModel>> response) {
    apiResponse = response;
    notifyListeners();
  }

  Future<void> getMeditationApi() async {
    getMeditationDataRepository
        .getMeditationApi(TAPiString.meditation)
        .then((value) {
      if (kDebugMode) {
        print(value);
      }
      setMeditationList(ApiResponse.complete(value));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
      setMeditationList(ApiResponse.error(error.toString()));
    });
  }
}
