import 'package:flutter/material.dart';
import 'package:store/utils/constants/enum.dart';

class PatientGenderTileController with ChangeNotifier {
  GenderEnum _genderEnum = GenderEnum.none;

  GenderEnum get genderEnum =>_genderEnum;

  
  setGender(GenderEnum genderEnum) {
    
    _genderEnum = genderEnum;
    notifyListeners();
  }
}
