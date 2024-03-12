import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/psychologist_controller/psychologist_controller.dart';
import 'package:store/features/authentication/model/pdf_file_model.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/extension.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/device/devices_utility.dart';
import 'package:store/utils/helper/helper_function.dart';

class PsychlogistDegreePdf extends StatelessWidget {
  const PsychlogistDegreePdf({super.key});

  @override
  Widget build(BuildContext context) {
    PdfFile? pdfFile;
    return Scaffold(
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
              pdfFile = await THelperFunction.pickFilePdf(context);
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
                child:  Icon(Icons.picture_as_pdf_rounded),
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
                  if (pdfFile == null) {
                    print("done");
                      context.read<PsychologistController>().nextPage(context);
                  } else {
                    THelperFunction.showToast("Add Pdf");
                  }
                },
                child: Text(TTexts.submit.capitalize())),
          )
        ],
      ),
    ));
  }
}
