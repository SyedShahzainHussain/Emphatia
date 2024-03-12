import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/psychologist_controller/psychologist_controller.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychlogist_age_widget/psychlogist_age.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychologist_cnic_widget/psycologist_cnic.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychologist_gender_widget/psychologist_genders.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychologist_step/psychologist_bottom_step.dart';

import 'package:store/utils/constants/size.dart';

class PsychologistStep extends StatelessWidget {
  const PsychologistStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          if (didPop) {
            context.read<PsychologistController>().currentPage = 0;
          }
        },
        child: Consumer<PsychologistController>(
          builder: (context, value, _) => Padding(
            padding: const EdgeInsets.all(TSized.defaultSpace),
            child: PageView(
              controller: value.pageController,
              onPageChanged: value.onPageChange,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                // ! Enter Age
                PsychlogistAge(),

                // ! Enter Gender
                PsychologistGender(),

             
                // ! Enter Cnic Number And Image 
                PsychlogistCnic(),

              ],
            ),
          ),
        ),
      ),
      // ! bottom Stepprogressindicator
      bottomNavigationBar: const PsychologistBottomStepWidget(),
    );
  }
}
