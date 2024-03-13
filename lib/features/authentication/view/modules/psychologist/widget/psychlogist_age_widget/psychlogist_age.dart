import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/gender_controller/patient_gender_tile_controller.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychlogist_age_widget/psychlogist_age_button.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychlogist_age_widget/psychlogist_title.dart';
import 'package:store/utils/constants/enum.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/device/devices_utility.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychologist_gender_widget/psychologist_genders.dart';
import 'package:store/utils/local_storage/storage_utility.dart';
import 'package:store/viewModel/psycology/psy_step_view_model.dart';

class PsychlogistAge extends StatelessWidget {
  const PsychlogistAge({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController age = TextEditingController();
    return Scaffold(
      body: Consumer<PsyStepViewModel>(
        builder: (context, value, _) => ModalProgressHUD(
          inAsyncCall: value.isPsyStepLoading,
          progressIndicator: THelperFunction.showIndicator(),
          child: PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              if (!didPop) {
                THelperFunction.showAlertDialog("You cannot go back",
                    "Please fill all the fields", context);
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
                        String gender = context
                            .read<GenderTileController>()
                            .getSelectedGenderAsString(context);
                        TStorageUtils.getEmailToPreference().then((value) {
                          final body = {
                            "email": value,
                            "age": age.text.toString(),
                            "gender": gender
                          };
                          context
                              .read<PsyStepViewModel>()
                              .postPsyStepApi(body, context);
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
