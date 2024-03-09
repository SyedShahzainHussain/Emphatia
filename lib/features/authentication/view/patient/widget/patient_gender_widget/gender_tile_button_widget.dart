import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/patient_step_controller.dart';
import 'package:store/utils/constants/extension.dart';
import 'package:store/utils/constants/texts.dart';

class GenderButtonWidget extends StatelessWidget {
  const GenderButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.read<PatientStepController>().nextPage(context);
        },
        child: Text(TTexts.next.capitalize()),
      ),
    );
  }
}
