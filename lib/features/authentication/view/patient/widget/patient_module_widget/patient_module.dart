import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/paitent_module_controller.dart';
import 'package:store/features/authentication/controller/patient_gender_tile_controller.dart';
import 'package:store/features/authentication/model/module_model.dart';
import 'package:store/features/authentication/view/patient/widget/patient_module_widget/patient_module_widgets.dart';

import 'package:store/utils/constants/extension.dart';

import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/device/devices_utility.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/utils/local_storage/storage_utility.dart';
import 'package:store/viewModel/patient/patient_step_view_model.dart';

import '../../../../controller/patient_step_controller.dart';

class PatientModule extends StatelessWidget {
  const PatientModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (!didPop) {
            context.read<PatientStepController>().previousPage(context);
          }
        },
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSized.spacebetweenSections),
          child: Column(children: [
            // ! Module Title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: TDeviceUtils.screenHeight(context) * 0.05,
                ),
                Text(
                  TTexts.selectedYourModel,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: TSized.spacebetweenItem),
              ],
            ),

            // ! Show Module

            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 2.0,
              ),
              itemCount: moduleModel.length,
              itemBuilder: (context, index) {
                return PatientModuleWidget(
                  moduleModel: moduleModel[index],
                  image: moduleModel[index].image,
                  title: moduleModel[index].title.capitalize(),
                );
              },
            ),
            const SizedBox(height: TSized.spacebetweenItem),

            // ! Next Button
            Consumer<PatientModuleController>(builder: (context, value, _) {
              final isSelected = value.selectedItem == null;
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isSelected
                      ? () {
                          THelperFunction.showToast("Seletect One Module");
                        }
                      : () async {
                          String module = value.selectedItem!.title;
                          String age =
                              context.read<PatientStepController>().age;
                          String gender = context
                              .read<PatientGenderTileController>()
                              .getSelectedGenderAsString(context);

                          await TStorageUtils.getEmailToPreference()
                              .then((value) {
                            final body = {
                              "email": value,
                              "gender": gender,
                              "age": age,
                              "selectModeules": module,
                            };
                            context
                                .read<PatientStepViewModel>()
                                .postStepApi(body, context);
                          });
                        },
                  child: Consumer<PatientStepViewModel>(
                    builder: (context, value, _) => value.isStepLoading
                        ? Center(
                            child: SizedBox(
                                height: 50,
                                width: 50,
                                child: THelperFunction.showIndicator(20)),
                          )
                        : Text(
                            TTexts.next.capitalize(),
                          ),
                  ),
                ),
              );
            })
          ]),
        ),
      ),
    );
  }
}
