import 'package:flutter/material.dart';
import 'package:store/common/style/text_style_common.dart';
import 'package:store/features/authentication/view/patient/widget/patient_login_widget/login_form.dart';
import 'package:store/features/authentication/view/patient/widget/patient_login_widget/login_title.dart';
import 'package:store/utils/constants/size.dart';


class PatientLogin extends StatelessWidget {
  const PatientLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: const Padding(
            padding: TextStyleCommon.paddingWithAppBar,
            child: Column(
              children: [
                LoginTitle(),
                SizedBox(height: TSized.spacebetweenItem),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
