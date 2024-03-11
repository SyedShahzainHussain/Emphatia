import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:store/utils/constants/colors.dart';

class THelperFunction {
  THelperFunction._();

  static Color? getColor(String value) {
    value = value.toLowerCase();
    if (value == "green") {
      return Colors.green;
    } else if (value == "red") {
      return Colors.red;
    } else if (value == "blue") {
      return Colors.blue;
    } else if (value == "purple") {
      return Colors.purple;
    } else if (value == "pink") {
      return Colors.pink;
    } else if (value == "grey") {
      return Colors.grey;
    } else if (value == "black") {
      return Colors.black;
    } else if (value == "white") {
      return Colors.white;
    } else {
      return null;
    }
  }

  static showSnackbar(String message, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static void showAlertDialog(
      String title, String message, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Ok"))
              ],
            ));
  }

  static void navigatedToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static void navigatedToScreenWithPop(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
      (context) => false,
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static void showToast(String msg) {
    Fluttertoast.showToast(msg: msg);
  }

  static Widget showIndicator([double? size = 50]) {
    return SpinKitChasingDots(
      color: TColors.primary,
      size: size!,
    );
  }
}
