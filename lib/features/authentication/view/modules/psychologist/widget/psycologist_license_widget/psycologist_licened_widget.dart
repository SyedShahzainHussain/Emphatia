import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/psychologist_controller/psychologist_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/extension.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/device/devices_utility.dart';
import 'package:store/utils/helper/helper_function.dart';

class PsycologistLicenedWidget extends StatefulWidget {
  const PsycologistLicenedWidget({super.key});

  @override
  State<PsycologistLicenedWidget> createState() =>
      _PsycologistLicenedWidgetState();
}

class _PsycologistLicenedWidgetState extends State<PsycologistLicenedWidget> {
  File? images;
  TextEditingController licenceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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

              // ! title

              Text(
                TTexts.licenceNumTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSized.spacebetweenItem,
              ),
              Text(
                TTexts.licenceNumSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: TSized.spacebetweenItem,
              ),

              // ! Licence Number
              TextField(
                controller: licenceController,
                decoration: const InputDecoration(
                  labelText: "Licence Number",
                ),
              ),

              const SizedBox(
                height: TSized.spacebetweenSections,
              ),

              GestureDetector(
                onTap: () {
                  THelperFunction.showBottomSheet(context, () async {
                    images = await THelperFunction.pickImageFromCamera();
                    setState(() {});
                  }, () async {
                    images = await THelperFunction.pickImageFromGallery();
                    setState(() {});
                  });
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: TColors.primary),
                    borderRadius: BorderRadius.circular(TSized.cardRadiusMd),
                    image: images != null
                        ? DecorationImage(
                            image: FileImage(File(images!.absolute.path)),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: images == null
                      ? Center(
                          child: IconButton(
                            onPressed: () {
                              THelperFunction.showBottomSheet(context,
                                  () async {
                                images =
                                    await THelperFunction.pickImageFromCamera();
                                setState(() {});
                              }, () async {
                                images = await THelperFunction
                                    .pickImageFromGallery();
                                setState(() {});
                              });
                            },
                            icon: const Icon(Iconsax.camera),
                          ),
                        )
                      : const SizedBox(),
                ),
              ),
              const SizedBox(
                height: TSized.spacebetweenSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (images != null) {
                        print("Done");
                      } else {
                        THelperFunction.showToast("All Field Are Required");
                      }
                    },
                    child: Text(TTexts.submit.capitalize())),
              )
            ],
          )),
    );
  }
}
