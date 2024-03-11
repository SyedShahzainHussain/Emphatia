import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:store/features/authentication/model/user_model.dart";
import "package:store/features/authentication/view/on_board/on_board.dart";
import "package:store/home.dart";
import "package:store/utils/helper/helper_function.dart";
import "package:store/viewModel/patient/user_view_model.dart";

class SplashServices {
  Future<User> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) {
      if (value.token == "null" || value.token == "" || value.token == null) {
        THelperFunction.navigatedToScreenWithPop(context, const OnBoard());
      } else {
        THelperFunction.navigatedToScreenWithPop(context, const HomeScreen());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
