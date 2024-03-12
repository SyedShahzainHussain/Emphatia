import 'package:flutter/material.dart';
import 'package:store/utils/constants/enum.dart';


class PatientPsycologistController with ChangeNotifier {
  Modules _isCheck = Modules.defaults;

  Modules get isCheck => _isCheck;

  setModule(Modules modules) {
    
    _isCheck = modules;
    notifyListeners();
  }
}
