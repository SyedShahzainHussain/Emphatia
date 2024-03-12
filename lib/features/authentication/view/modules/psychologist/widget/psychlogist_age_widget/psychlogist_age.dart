import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/gender_controller/patient_gender_tile_controller.dart';
import 'package:store/features/authentication/controller/psychologist_controller/psychologist_controller.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychlogist_age_widget/psychlogist_age_button.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychlogist_age_widget/psychlogist_title.dart';
import 'package:store/utils/constants/enum.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/device/devices_utility.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychologist_gender_widget/psychologist_genders.dart';

class PsychlogistAge extends StatelessWidget {
  const PsychlogistAge({super.key});

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
                height: TDeviceUtils.screenHeight(context) * 0.05,
              ),
              // ! Age title
              const PsychlogistTitle(),

              const SizedBox(height: TSized.spacebetweenItem),
              // ! Age Textfield
              TextField(
                controller: age,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Your Age",
                  prefixIcon: Icon(Iconsax.user_add),
                ),
              ),
              const SizedBox(height: TSized.spacebetweenItem),
              const PsychologistGender(),
              const SizedBox(height: TSized.spacebetweenItem),
              // ! Age Button
              PsychlogistAgeButton(
                onPressed: () {
                  if (age.text.isEmpty ||
                      context.read<GenderTileController>().genderEnum ==
                          GenderEnum.none) {
                    THelperFunction.showToast("All Requried");
                  } else {
                    TDeviceUtils.hideKeyboard(context);
                    context.read<PsychologistController>().nextPage(context);
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
