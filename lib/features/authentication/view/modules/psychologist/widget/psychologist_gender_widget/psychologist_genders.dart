import 'package:flutter/material.dart';

import 'package:store/features/authentication/view/modules/psychologist/widget/psychologist_gender_widget/psychologist_gender_tile_widget.dart';

import 'package:store/features/authentication/view/modules/psychologist/widget/psychologist_gender_widget/psychologist_title_widget.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/helper/helper_function.dart';

class PsychologistGender extends StatelessWidget {
  const PsychologistGender({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ! Gender Title
        const PsychologistGenderTitleWidget(),
        // ! Gender Tile
        PsychologistGenderTileWidget(isDark: isDark),
        const SizedBox(height: TSized.spacebetweenItem),
      ],
    );
  }
}
