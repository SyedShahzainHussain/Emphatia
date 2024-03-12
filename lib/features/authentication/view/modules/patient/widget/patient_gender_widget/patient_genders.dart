import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/common/style/text_style_common.dart';
import 'package:store/features/authentication/controller/patient_controller/patient_step_controller.dart';
import 'package:store/features/authentication/view/modules/patient/widget/patient_gender_widget/gender_tile_button_widget.dart';
import 'package:store/features/authentication/view/modules/patient/widget/patient_gender_widget/gender_title_widget.dart';
import 'package:store/features/authentication/view/modules/patient/widget/patient_gender_widget/patient_gender_tile_widget.dart';

import 'package:store/utils/constants/size.dart';
import 'package:store/utils/helper/helper_function.dart';

class PatientGender extends StatelessWidget {
  const PatientGender({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunction.isDarkMode(context);
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (!didPop) {
            context.read<PatientStepController>().previousPage(context);
          }
        },
        child: Padding(
          padding: TextStyleCommon.paddingWithAppBar,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ! Gender Title
              const GenderTitleWidget(),
              // ! Gender Tile
              PatientGenderTileWidget(isDark: isDark),
              const SizedBox(height: TSized.spacebetweenItem),
              // ! Gender Button
              const GenderButtonWidget()
            ],
          ),
        ),
      ),
    );
  }
}
