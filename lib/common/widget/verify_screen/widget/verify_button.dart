
import 'package:flutter/material.dart';
import 'package:store/features/authentication/view/patient/patient_login.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/constants/extension.dart';
import 'package:store/utils/helper/helper_function.dart';
class VerifyButton extends StatelessWidget {
  const VerifyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          THelperFunction.navigatedToScreenWithPop(context, const PatientLogin());
        },
        child: Text(TTexts.done.capitalize()),
      ),
    );
  }
}