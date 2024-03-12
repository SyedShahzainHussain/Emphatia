import 'package:flutter/material.dart';
import 'package:store/common/widget/appBar/custom_appbar.dart';
import 'package:store/features/authentication/controller/patient_psyclogist_controller/patient_psy_controller.dart';
import 'package:store/features/authentication/view/modules/patient/patient_login.dart';
import 'package:store/features/authentication/view/modules/psychologist/psychologist_login.dart';
import 'package:store/features/authentication/view/patient_psychologist_module/widget/patient/patient_andpsy_column.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/features/authentication/view/patient_psychologist_module/widget/psychology/psychologist.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enum.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:provider/provider.dart';

class PatientPsycologist extends StatelessWidget {
  const PatientPsycologist({super.key});

  @override
  Widget build(BuildContext context) {
    bool isdark = THelperFunction.isDarkMode(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(TSized.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ! Header
            CustomAppBar(
              title: Text("Select Any One ",
                  style: Theme.of(context).textTheme.headlineMedium!),
            ),

            // ! Row
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //! Patient Card
                  PatientColumn(
                    onPressed: () {
                      context
                          .read<PatientPsycologistController>()
                          .setModule(Modules.patient);
                    },
                    isdark: isdark,
                    title: "Patient",
                    image: TImageString.patient,
                  ),
                  const SizedBox(
                    width: TSized.spacebetweenItem,
                  ),
                  //! Psychologist Card
                  PsyColumn(
                    onPressed: () {
                      context
                          .read<PatientPsycologistController>()
                          .setModule(Modules.psychologist);
                    },
                    isdark: isdark,
                    title: "Psychologist",
                    image: TImageString.psychologist,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // ! floating action button
      floatingActionButton: Consumer<PatientPsycologistController>(
        builder: (context, value, _) => FloatingActionButton(
          backgroundColor: isdark ? TColors.white : TColors.primaryBackground,
          onPressed: () {
            if (value.isCheck != Modules.defaults) {
              if (value.isCheck == Modules.patient) {
                THelperFunction.navigatedToScreen(context, const PatientLogin());
              } else if (value.isCheck == Modules.psychologist) {
                THelperFunction.navigatedToScreen(context, const PsychologistLogin());
              }
            } else {
              THelperFunction.showToast("Selected Any One");
            }
          },
          child: Icon(
            Iconsax.tick_circle,
            color: value.isCheck.name == Modules.patient.name ||
                    value.isCheck.name == Modules.psychologist.name
                ? Colors.green
                : TColors.black,
          ),
        ),
      ),
    );
  }
}
