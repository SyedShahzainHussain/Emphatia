import 'dart:io';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/psychologist_controller/psychologist_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/extension.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/device/devices_utility.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/utils/local_storage/storage_utility.dart';
import 'package:store/viewModel/psycology/psy_step_view_model.dart';

class PsychlogistDegreePdf extends StatefulWidget {
  const PsychlogistDegreePdf({super.key});

  @override
  State<PsychlogistDegreePdf> createState() => _PsychlogistDegreePdfState();
}

class _PsychlogistDegreePdfState extends State<PsychlogistDegreePdf> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return Consumer<PsyStepViewModel>(
      builder: (context, value, _) => ModalProgressHUD(
        inAsyncCall: value.isPsyDegreeStepLoading,
        progressIndicator: THelperFunction.showIndicator(),
        child: Scaffold(
            body: PopScope(
                      canPop: false,
                      onPopInvoked: (didPop) {
            if (!didPop) {
              context.read<PsychologistController>().previousPage(context);
            }
                      },
                      child: Column(
            children: [
              SizedBox(
                height: TDeviceUtils.screenHeight(context) * 0.05,
              ),
              Text(
                TTexts.degree,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSized.spacebetweenSections,
              ),
              GestureDetector(
                onTap: () async {
                  THelperFunction.showBottomSheet(context, () async {
                    image = await THelperFunction.pickImageFromCamera();
                    setState(() {});
                  }, () async {
                    image = await THelperFunction.pickImageFromGallery();
                    setState(() {});
                  });
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: TColors.primary),
                      borderRadius: BorderRadius.circular(TSized.cardRadiusMd),
                      image: image != null
                          ? DecorationImage(
                              image: FileImage(File(image!.path)),
                              fit: BoxFit.cover)
                          : null),
                  child: image== null ? const Center(
                    child: Icon(Icons.image),
                  ) : const SizedBox(),
                ),
              ),
              const SizedBox(
                height: TSized.spacebetweenSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      TStorageUtils.getEmailToPreference().then((value) {
                        context
                            .read<PsyStepViewModel>()
                            .postPsyDegreeApi(image, value, context);
                      });
                    },
                    child: Text(TTexts.submit.capitalize())),
              )
            ],
                      ),
                    )),
      ),
    );
  }
}
