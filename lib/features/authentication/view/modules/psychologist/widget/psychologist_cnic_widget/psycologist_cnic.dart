import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/psychologist_controller/psychologist_controller.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychologist_cnic_widget/cnic_text_field_image_widget.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/device/devices_utility.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/viewModel/psycology/psy_step_view_model.dart';

class PsychlogistCnic extends StatelessWidget {
  const PsychlogistCnic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PsyStepViewModel>(
        builder: (context, value, _) => ModalProgressHUD(
          inAsyncCall: value.isPsyCnicStepLoading,
          progressIndicator: THelperFunction.showIndicator(),
          child: PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              if (!didPop) {
                context.read<PsychologistController>().previousPage(context);
              }
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: TDeviceUtils.screenHeight(context) * 0.05,
                  ),
                  // ! Title
                  Text(
                    TTexts.personalInfo,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: TSized.spacebetweenSections),
                  // ! Cninc Text Field & Cnic Image
                  const CnicTextFieldImageWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
