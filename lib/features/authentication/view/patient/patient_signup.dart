import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/common/style/text_style_common.dart';
import 'package:store/features/authentication/view/patient/widget/patient_signup_widget/signup_form.dart';
import 'package:store/features/authentication/view/patient/widget/patient_signup_widget/signup_title.dart';
import 'package:store/utils/constants/size.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/viewModel/patient/signup_view_model.dart';

class PatientSignUp extends StatelessWidget {
  const PatientSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SignUpViewModel>(
        builder: (context, value, _) => ModalProgressHUD(
          inAsyncCall: value.isSignUpLoading,
          progressIndicator: THelperFunction.showIndicator(),
          child: SingleChildScrollView(
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
        ),
      ),
    );
  }
}
