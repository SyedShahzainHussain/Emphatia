import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store/features/authentication/view/patient/widget/otp_screen/otp_screen.dart';
import 'package:store/features/authentication/view/patient/patient_step.dart';
import 'package:store/repository/auth_repository.dart';
import 'package:store/utils/constants/api_constants.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/utils/local_storage/storage_utility.dart';

class SignUpViewModel extends ChangeNotifier {
  final _myRepo = AuthRepository();
  // ! signup loading
  bool _isSignUpLoading = false;
  bool get isSignUpLoading => _isSignUpLoading;
  setSignUpLoading(bool isSignUpLoading) {
    _isSignUpLoading = isSignUpLoading;
    notifyListeners();
  }


   

  // ! signup verify loading
  bool _isSignUpVerifyLoading = false;
  bool get isSignUpVerifyLoading => _isSignUpVerifyLoading;
  setSignUpVerifyLoading(bool isSignUpVerifyLoading) {
    _isSignUpVerifyLoading = isSignUpVerifyLoading;
    notifyListeners();
  }

  // ! post register api + verify api
  Future<void> postSignUpApi(dynamic body, BuildContext context) async {
    setSignUpLoading(true);
    _myRepo.postApi(body, TAPiString.register).then((value) {
      TStorageUtils.addEmailToPreference(body["email"]);
      setSignUpLoading(false);
      THelperFunction.showToast("User Created Successfully");
      // ! verfiy Api
      THelperFunction.navigatedToScreen(
        context,
        OtpScreenSignUp(
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
      setSignUpLoading(false);
      THelperFunction.showToast(error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  // ! verify otp

  Future<void> postSignUpVerifyApi(dynamic body, BuildContext context) async {
    setSignUpVerifyLoading(true);
    _myRepo.postApi(body, TAPiString.verifyOtp).then((value) {
      setSignUpVerifyLoading(false);
      THelperFunction.showToast("Email Verified");
      THelperFunction.navigatedToScreenWithPop(context, const PatientStep());

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpVerifyLoading(false);
      THelperFunction.showToast(error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
