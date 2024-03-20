import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:store/features/authentication/model/user_model.dart";
import "package:store/features/authentication/view/on_board/on_board.dart";
import "package:store/features/authentication/view/modules/patient/patient_home.dart";
import "package:store/home2.dart";
import "package:store/utils/helper/helper_function.dart";
import "package:store/viewModel/patient/services/user_view_model.dart";

class SplashServices {
  Future<User> getUserData() => UserViewModel().getUser();
  void checkAuthentication(BuildContext context) async {
    final dp = await SharedPreferences.getInstance();
    final userType = dp.getString("userType");
    getUserData().then((value) {
      if (userType == "patient") {
        THelperFunction.navigatedToScreenWithPop(
            context, const PatientHomeScreen());
      } else if (userType == "psychology") {
        THelperFunction.navigatedToScreenWithPop(context, const HomeScreen2());
      } else {
        THelperFunction.navigatedToScreenWithPop(context, const OnBoard());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
