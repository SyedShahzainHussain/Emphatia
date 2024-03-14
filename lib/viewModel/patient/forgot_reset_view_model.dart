import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store/features/authentication/view/modules/patient/widget/reset_password_screen/reset_password_screen.dart';
import 'package:store/common/widget/verify_screen/verify_screen_.dart';
import 'package:store/features/authentication/view/modules/patient/widget/otp_screen_reset/otp_screen_reset.dart';
import 'package:store/repository/auth_repository.dart';
import 'package:store/utils/constants/api_constants.dart';
import 'package:store/utils/device/devices_utility.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/utils/local_storage/storage_utility.dart';

class ForgotResetViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

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
    _myRepo.postApi(body, TAPiString.forgotPassword).then((value) {
      final otp = value["otp"];
      TStorageUtils.addEmailToPreference(body["email"]);
      if (kDebugMode) {
        print(value);
      }
      THelperFunction.navigatedToScreen(
        context,
        OtpScreenReset(
          onPressed: (String verificationCode, context2) async {
            if (otp == verificationCode) {
              TStorageUtils.getEmailToPreference().then((value) {
                THelperFunction.navigatedToScreen(
                  context,
                  ResetPasswordScreen(
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
    _myRepo.postApi(body, TAPiString.resetPassword).then((value) {
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
}
