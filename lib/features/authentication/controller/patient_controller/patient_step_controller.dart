import 'package:flutter/material.dart';
import 'package:store/utils/device/devices_utility.dart';

class PatientStepController with ChangeNotifier {
  PageController pageController = PageController();
  int currentPage = 0;
  int totalStep = 2;
  String age = "";

  // ! page changed
  onPageChange(int index) {
    currentPage = index;
    notifyListeners();
  }

  // ! next page
  nextPage(BuildContext context) {
    if (currentPage == totalStep) {
      // ! do some thing when the page is end
    } else {
      TDeviceUtils.hideKeyboard(context);
      pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
    notifyListeners();
  }

  // ! Method to navigate to the previous page
  previousPage(BuildContext context) {
    if (currentPage > 0) {
      pageController.animateToPage(
        currentPage - 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    }
    notifyListeners();
  }
}
