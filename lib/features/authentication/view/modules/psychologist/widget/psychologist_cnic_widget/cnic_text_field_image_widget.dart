import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/psychologist_controller/psychologist_controller.dart';
import 'package:store/features/authentication/model/pdf_file_model.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychologist_cnic_widget/expanded_file_contaner_widget.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/extension.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/utils/helper/pakistan_cnic_input_formatter.dart';

class CnicTextFieldImageWidget extends StatefulWidget {
  const CnicTextFieldImageWidget({
    super.key,
  });

  @override
  State<CnicTextFieldImageWidget> createState() =>
      _CnicTextFieldImageWidgetState();
}

class _CnicTextFieldImageWidgetState extends State<CnicTextFieldImageWidget> {
  File? frontImage;
  File? backImage;
  TextEditingController cnicController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TTexts.enterYourCnicNumber,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: TSized.md),
        // ! Cninc Text Field
        TextField(
          maxLength: 15,
          controller: cnicController,
          decoration: const InputDecoration(
            labelText: TTexts.cnicLabelText,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            PakistanCnicInputFormatter()
          ],
        ),
        const SizedBox(height: TSized.md),
        Text(
          TTexts.enterYourCnicFrontBackImage,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: TSized.md),
        Row(
          children: [
            ExpandedFileContainer(
                image: frontImage,
                onPress: () {
                  THelperFunction.showBottomSheet(context, () async {
                    frontImage = await THelperFunction.pickImageFromCamera();

                    setState(() {});
                  }, () async {
                    frontImage = await THelperFunction.pickImageFromGallery();

                    setState(() {});
                  });
                },
                icon: const Icon(Iconsax.camera)),
            const SizedBox(width: TSized.md),
            ExpandedFileContainer(
                image: backImage,
                onPress: () {
                  THelperFunction.showBottomSheet(context, () async {
                    backImage = await THelperFunction.pickImageFromCamera();

                    setState(() {});
                  }, () async {
                    backImage = await THelperFunction.pickImageFromGallery();

                    setState(() {});
                  });
                },
                icon: const Icon(Iconsax.gallery)),
          ],
        ),
        const SizedBox(
          height: TSized.spacebetweenItem,
        ),
        Text(
          TTexts.degree,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: TSized.spacebetweenItem,
        ),
        GestureDetector(
          onTap: () async {
            PdfFile? pdfFile = await THelperFunction.pickFilePdf(context);
            print(pdfFile!.filePath);
          },
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: TColors.primary),
              borderRadius: BorderRadius.circular(TSized.cardRadiusMd),
            ),
            child: const Center(
              child: Icon(Icons.picture_as_pdf_rounded),
            ),
          ),
        ),
        const SizedBox(
          height: TSized.spacebetweenSections,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                if (frontImage != null ||
                    backImage != null || 
                    cnicController.text.isNotEmpty) {
                  context.read<PsychologistController>().nextPage(context);
                } else {
                  THelperFunction.showToast("All Field Are Required");
                }
              },
              child: Text(TTexts.submit.capitalize())),
        )
      ],
    );
  }
}
