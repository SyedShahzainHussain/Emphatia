import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store/common/widget/verify_screen/verify_screen_.dart';
import 'package:store/features/authentication/model/user_model.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psy_otp_screen_reset/psy_otp_screen_reset.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psy_reset_screen/psy_reset_screen.dart';
import 'package:store/home2.dart';
import 'package:store/repository/auth_repository.dart';
import 'package:store/utils/constants/api_constants.dart';
import 'package:store/utils/device/devices_utility.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/utils/local_storage/storage_utility.dart';
import 'package:store/viewModel/patient/services/user_view_model.dart';

class PhySignInViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  final data = UserViewModel();

  // ! signin  loading
  bool _isForgotLoading = false;
  bool get isForgotLoading => _isForgotLoading;
  setForgotLoading(bool isForgotLoading) {
    _isForgotLoading = isForgotLoading;
    notifyListeners();
  }

  // ! forgot verify loading
  bool _isForgotVerifyLoading = false;
  bool get isForgotVerifyLoading => _isForgotVerifyLoading;
  setForgotVerifyLoading(bool isForgotVerifyLoading) {
    _isForgotVerifyLoading = isForgotVerifyLoading;
    notifyListeners();
  }

  // ! reset verify loading
  bool _isresetVerifyLoading = false;
  bool get isResetVerifyLoading => _isresetVerifyLoading;
  setResetVerifyLoading(bool isresetVerifyLoading) {
    _isresetVerifyLoading = isresetVerifyLoading;
    notifyListeners();
  }

  // ! forgot password

  Future<void> forgotPassword(dynamic body, BuildContext context) async {
    setForgotLoading(true);
    TDeviceUtils.hideKeyboard(context);
    _myRepo.postApi(body, TAPiString.phyforgot).then((value) {
      final otp = value["otp"];
      TStorageUtils.addEmailToPreference(body["email"]);
      if (kDebugMode) {
        print(value);
      }
      THelperFunction.navigatedToScreen(
        context,
        PsyOtpScreenReset(
          onPressed: (String verificationCode, context2) async {
            if (otp == verificationCode) {
              TStorageUtils.getEmailToPreference().then((value) {
                THelperFunction.navigatedToScreen(
                  context,
                  PsyResetPasswordScreen(
                    onPressed: (oldPass, newPass, context) {
                      final body = {
                        "email": value,
                        "otp": verificationCode,
                        "newPassword": newPass,
                      };
                      postResetApi(body, context);
                    },
                  ),
                );
              });
            } else {
              THelperFunction.showToast("Otp Incorrect");
            }
          },
        ),
      );
      setForgotLoading(false);
      THelperFunction.showToast("Otp Has been sent to your email");
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
      setForgotLoading(false);
      THelperFunction.showToast(error.toString());
    });
  }

  // ! Reset Password
  Future<void> postResetApi(dynamic body, BuildContext context) async {
    TDeviceUtils.hideKeyboard(context);
    setResetVerifyLoading(true);
    _myRepo.postApi(body, TAPiString.psyresetPassword).then((value) {
      if (kDebugMode) {
        print(value);
      }
      setResetVerifyLoading(false);
      THelperFunction.showToast("Password Changed");
      THelperFunction.navigatedToScreenWithPop(
        context,
        const VerifyScreen(),
      );
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
      setResetVerifyLoading(false);

      THelperFunction.showToast(error.toString());
    });
  }

  // ! signin  loading
  bool _isSignInLoading = false;
  bool get isSignInLoading => _isSignInLoading;
  setSignInLoading(bool isSignInLoading) {
    _isSignInLoading = isSignInLoading;
    notifyListeners();
  }

  // ! post sign api
  Future<void> phyPostSignInApi(dynamic body, BuildContext context) async {
    TDeviceUtils.hideKeyboard(context);
    setSignInLoading(true);
    _myRepo.postApi(body, TAPiString.psylogin).then((value) {
      final token = value["user"]["token"];
      final email = value["user"]["email"];
      final sId = value["user"]["_id"];

      final user = User(email: email, token: token, sId: sId);
      data.saveUser(user);
      data.saveUserType("psychology");
      setSignInLoading(false);
      THelperFunction.showToast("User Login Successfully");
      THelperFunction.navigatedToScreenWithPop(context, const HomeScreen2());
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
