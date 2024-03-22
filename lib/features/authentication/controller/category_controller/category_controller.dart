import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  String _selectedCategory = 'Mental Health';

  String get selectedCategory => _selectedCategory;

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
