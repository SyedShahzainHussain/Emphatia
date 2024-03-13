import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:store/common/style/text_style_common.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychlogoist_signup/psychlogist_signUp_form.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychlogoist_signup/psychlogist_signUp_title.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/viewModel/psycology/psy_signup_view_model.dart';

class PsychologistSignUp extends StatelessWidget {
  const PsychologistSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PsySignUpViewModel>(
        builder: (context, value, _) => ModalProgressHUD(
          inAsyncCall: value.isPsySignUpLoading,
          progressIndicator: THelperFunction.showIndicator(),
          child: SingleChildScrollView(
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
        ),
      ),
    );
  }
}
