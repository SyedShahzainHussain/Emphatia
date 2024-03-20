import 'package:flutter/material.dart';

class PatientHomeBottom with ChangeNotifier {
  int currentIndex = 0;

  changePage(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
