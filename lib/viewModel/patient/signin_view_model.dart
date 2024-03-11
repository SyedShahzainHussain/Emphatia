import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store/features/authentication/model/user_model.dart';
import 'package:store/home.dart';
import 'package:store/repository/auth_repository.dart';
import 'package:store/utils/constants/api_constants.dart';
import 'package:store/utils/device/devices_utility.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/viewModel/patient/user_view_model.dart';

class SignInViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  final data = UserViewModel();
  // ! signin  loading
  bool _isSignInLoading = false;
  bool get isSignInLoading => _isSignInLoading;
  setSignInLoading(bool isSignInLoading) {
    _isSignInLoading = isSignInLoading;
    notifyListeners();
  }

  // ! post sign api
  Future<void> postSignInApi(dynamic body, BuildContext context) async {
    TDeviceUtils.hideKeyboard(context);
    setSignInLoading(true);
    _myRepo.postApi(body, TAPiString.login).then((value) {
      final token = value["user"]["token"];
      final email = value["user"]["email"];
      final sId = value["user"]["_id"];

      final user = User(email: email, token: token, sId: sId);
      data.saveUser(user);
      setSignInLoading(false);
      THelperFunction.showToast("User Login Successfully");
      THelperFunction.navigatedToScreenWithPop(context, const HomeScreen());
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignInLoading(false);
      THelperFunction.showToast(error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
