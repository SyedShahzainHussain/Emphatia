import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store/features/authentication/view/patient/patient_login.dart';
import 'package:store/repository/auth_repository.dart';
import 'package:store/utils/constants/api_constants.dart';
import 'package:store/utils/helper/helper_function.dart';

class PatientStepViewModel with ChangeNotifier {
  final _repo = AuthRepository();
  bool _isStepLoading = false;
  bool get isStepLoading => _isStepLoading;

  setStepLoading(bool isStepLoading) {
    _isStepLoading = isStepLoading;
    notifyListeners();
  }

  // ! step post api
  void postStepApi(dynamic body, BuildContext context) async {
    setStepLoading(true);
    _repo.postApi(body, TAPiString.updateStep).then((value) {
      if (kDebugMode) {
        print(value);
      }
      THelperFunction.showToast("Success");
      THelperFunction.navigatedToScreenWithPop(context, const PatientLogin());
      setStepLoading(false);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
      THelperFunction.showToast("Error");
      setStepLoading(false);
    });
  }
}
