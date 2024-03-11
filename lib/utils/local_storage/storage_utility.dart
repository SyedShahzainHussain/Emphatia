import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/utils/constants/local_storage_text.dart';

class TStorageUtils {
  TStorageUtils._();

  // ! add user email
  static void addEmailToPreference(String email) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(LocalStorageText.email, email);
  }

  // ! get user email
  static Future<String> getEmailToPreference() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(LocalStorageText.email) ?? "";
  }
}
