import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:store/features/authentication/model/user_model.dart";

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(User user) async {
    final SharedPreferences dp = await SharedPreferences.getInstance();
    dp.setString("token", user.token.toString());
    dp.setString("email", user.email.toString());
    dp.setString("userId", user.sId.toString());
    notifyListeners();

    return true;
  }

  Future<User> getUser() async {
    final SharedPreferences dp = await SharedPreferences.getInstance();
    final String? token = dp.getString("token");
    final String? email = dp.getString("email");
    final String? userId = dp.getString("userId");
    return User(email: email, sId: userId, token: token);
  }

  Future<bool> remove() async {
    final SharedPreferences dp = await SharedPreferences.getInstance();
    dp.remove("token");
    dp.remove("userId");
    dp.remove("email");
    return true;
  }
}
