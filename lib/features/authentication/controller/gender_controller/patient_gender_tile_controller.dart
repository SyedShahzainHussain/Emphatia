import 'package:flutter/material.dart';
import 'package:store/utils/constants/enum.dart';

class GenderTileController with ChangeNotifier {
  GenderEnum _genderEnum = GenderEnum.none;

  GenderEnum get genderEnum => _genderEnum;

  setGender(GenderEnum genderEnum) {
    _genderEnum = genderEnum;
    notifyListeners();
  }

  String getSelectedGenderAsString(BuildContext context) {
    final selectedGender = _genderEnum;
    switch (selectedGender) {
      case GenderEnum.male:
        return 'Male';
      case GenderEnum.female:
        return 'Female';
      case GenderEnum.transgender:
        return 'Transgender';
      default:
        return 'None'; // Or any default value you prefer
    }
  }
}
