

import 'package:store/utils/constants/texts.dart';

class ModuleModel {
  String image, title;

  ModuleModel(this.image, this.title);
}


List<ModuleModel> moduleModel = [
  ModuleModel("assets/images/onBoard/anxiety.png", TTexts.anxiety),
  ModuleModel("assets/images/onBoard/sleep.png", TTexts.sleep),
  ModuleModel("assets/images/onBoard/sad.png", TTexts.depress),
  ModuleModel("assets/images/onBoard/heartbeat.png", TTexts.stress),
];
