import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/patient_gender_tile_controller.dart';
import 'package:store/features/authentication/controller/patient_step_controller.dart';
import 'package:store/utils/constants/enum.dart';
import 'package:store/utils/constants/extension.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/helper/helper_function.dart';

class GenderButtonWidget extends StatelessWidget {
  const GenderButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientGenderTileController>(
      builder: (context, value, _) => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            value.genderEnum == GenderEnum.none
                ? THelperFunction.showToast("Please Select Gender")
                : context.read<PatientStepController>().nextPage(context);
          },
          child: Text(TTexts.next.capitalize()),
        ),
      ),
    );
  }
}
