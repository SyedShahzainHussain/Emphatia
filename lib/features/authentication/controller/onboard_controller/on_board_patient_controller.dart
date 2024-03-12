import 'package:flutter/material.dart';

class OnBoardController extends ChangeNotifier {
  PageController pageController = PageController(initialPage: 0);
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  pageChange(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
