import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/psychologist_controller/psychologist_controller.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychologist_gender_widget/psychologist_gender_tile_widget.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychologist_gender_widget/psychologist_tile_button_widget.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychologist_gender_widget/psychologist_title_widget.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/device/devices_utility.dart';
import 'package:store/utils/helper/helper_function.dart';

class PsychologistGender extends StatelessWidget {
  const PsychologistGender({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = THelperFunction.isDarkMode(context);
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (!didPop) {
            context.read<PsychologistController>().previousPage(context);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: TDeviceUtils.screenHeight(context) * 0.05,
            ),
            // ! Gender Title
            const PsychologistGenderTitleWidget(),
            // ! Gender Tile
            PsychologistGenderTileWidget(isDark: isDark),
            const SizedBox(height: TSized.spacebetweenItem),
            // ! Gender Button
            const PsychologistButtonWidget()
          ],
        ),
      ),
    );
  }
}
