import 'package:flutter/material.dart';
import 'package:store/features/authentication/model/module_model.dart';

class PatientModuleController with ChangeNotifier {
  // final List<ModuleModel> _selectedItems = [];
  // List<ModuleModel> get selectedItems => _selectedItems;

  // void addModule(ModuleModel moduleModel) {
  //   _selectedItems.add(moduleModel);
  //   notifyListeners();
  // }

  // void removeModule(ModuleModel moduleModel) {
  //   _selectedItems.remove(moduleModel);
  //   notifyListeners();
  // }

  
    ModuleModel? _selectedItem;
  ModuleModel? get selectedItem => _selectedItem;

  void selectModule(ModuleModel moduleModel) {
    _selectedItem = moduleModel;
    notifyListeners();
  }

  void clearSelection() {
    _selectedItem = null;
    notifyListeners();
  }
}
