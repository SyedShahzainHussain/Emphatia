import 'package:flutter/material.dart';
import 'package:store/common/style/text_style_common.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychlogoist_signup/psychlogist_signUp_form.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychlogoist_signup/psychlogist_signUp_title.dart';
import 'package:store/utils/constants/size.dart';

class PsychologistSignUp extends StatelessWidget {
  const PsychologistSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: const Padding(
            padding: TextStyleCommon.paddingWithAppBar,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PsychlogistSignUpTitle(),
                SizedBox(height: TSized.spacebetweenItem),
                PsychlogisySignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
