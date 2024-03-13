import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:store/features/authentication/view/modules/psychologist/psychologist_step.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psy_otp_screen/psy_otp_screen.dart';
import 'package:store/repository/auth_repository.dart';
import 'package:store/utils/constants/api_constants.dart';
import 'package:store/utils/device/devices_utility.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/utils/local_storage/storage_utility.dart';

class PsySignUpViewModel extends ChangeNotifier {
  final _myRepo = AuthRepository();
  // ! signup loading
  bool _isPsySignUpLoading = false;
  bool get isPsySignUpLoading => _isPsySignUpLoading;
  setPsySignUpLoading(bool isPsySignUpLoading) {
    _isPsySignUpLoading = isPsySignUpLoading;
    notifyListeners();
  }

  // ! signup verify loading
  bool _isPsySignUpVerifyLoading = false;
  bool get isPsySignUpVerifyLoading => _isPsySignUpVerifyLoading;
  setPsySignUpVerifyLoading(bool isPsySignUpVerifyLoading) {
    _isPsySignUpVerifyLoading = isPsySignUpVerifyLoading;
    notifyListeners();
  }

  // ! post register api + verify api
  Future<void> postSignUpApi(dynamic body, BuildContext context) async {
    TDeviceUtils.hideKeyboard(context);
    setPsySignUpLoading(true);
    _myRepo.postApi(body, TAPiString.psyregister).then((value) {
      TStorageUtils.addEmailToPreference(body["email"]);
      setPsySignUpLoading(false);
      THelperFunction.showToast("User Created Successfully");
      // ! verfiy Api
      THelperFunction.navigatedToScreen(
        context,
        PsyOtpScreenSignUp(
          onPressed: (String verificationCode, context2) async {
            await TStorageUtils.getEmailToPreference().then((value) {
              final data = {
                "email": value.toString(),
                "otp": verificationCode.toString()
              };
              postSignUpVerifyApi(data, context2);
            });
          },
        ),
      );
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setPsySignUpLoading(false);
      THelperFunction.showToast(error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  // ! verify otp

  Future<void> postSignUpVerifyApi(dynamic body, BuildContext context) async {
    TDeviceUtils.hideKeyboard(context);
    setPsySignUpVerifyLoading(true);
    _myRepo.postApi(body, TAPiString.psyverifyOtp).then((value) {
      setPsySignUpVerifyLoading(false);
      THelperFunction.showToast("Email Verified");
      THelperFunction.navigatedToScreenWithPop(
          context, const PsychologistStep());

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setPsySignUpVerifyLoading(false);
      THelperFunction.showToast(error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
