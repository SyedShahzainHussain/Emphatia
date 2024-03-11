import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/patient_step_controller.dart';

import 'package:store/features/authentication/view/patient/widget/patient_age_widget/patient_age_button.dart';
import 'package:store/features/authentication/view/patient/widget/patient_age_widget/patient_title.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/device/devices_utility.dart';
import 'package:store/utils/helper/helper_function.dart';

class PatientAge extends StatelessWidget {
  const PatientAge({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController age = TextEditingController();
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (!didPop) {
            THelperFunction.showAlertDialog(
                "You cannot go back", "Please fill all the fields", context);
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: TDeviceUtils.screenHeight(context) / 4.5,
              ),
              // ! Age title
              const PatientTitle(),

              const SizedBox(height: TSized.spacebetweenSections),
              // ! Age Textfield
              TextField(
                controller: age,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Your Age",
                  prefixIcon: Icon(Iconsax.user_add),
                ),
              ),
              const SizedBox(height: TSized.spacebetweenSections),
              // ! Age Button
              PatientAgeButton(
                onPressed: () {
                  if (age.text.isEmpty) {
                    THelperFunction.showToast("Age Requried");
                  } else {
                    context.read<PatientStepController>().age = age.text;
                    context.read<PatientStepController>().nextPage(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
