import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:store/common/style/text_style_common.dart';
import 'package:store/features/authentication/view/modules/patient/widget/patient_login_widget/login_form.dart';
import 'package:store/common/widget/login_title/login_title.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/viewModel/patient/signin_view_model.dart';

class PatientLogin extends StatelessWidget {
  const PatientLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SignInViewModel>(
        builder: (context, value, _) => ModalProgressHUD(
          inAsyncCall: value.isSignInLoading,
          progressIndicator: THelperFunction.showIndicator(),
          child: SingleChildScrollView(
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
        ),
      ),
    );
  }
}
