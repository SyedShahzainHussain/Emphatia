import 'package:flutter/material.dart';
import 'package:store/common/style/text_style_common.dart';
import 'package:store/features/authentication/view/patient/widget/patient_signup_widget/signup_form.dart';
import 'package:store/features/authentication/view/patient/widget/patient_signup_widget/signup_title.dart';
import 'package:store/utils/constants/size.dart';

class PatientSignUp extends StatelessWidget {
  const PatientSignUp({super.key});

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
                SignUpTitle(),
                SizedBox(height: TSized.spacebetweenItem),
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}