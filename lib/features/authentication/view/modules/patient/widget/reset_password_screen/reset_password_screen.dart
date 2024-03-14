import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/view/modules/patient/widget/reset_password_screen/widget/reset_password_screen_form.dart';

import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/viewModel/patient/forgot_reset_view_model.dart';

class ResetPasswordScreen extends StatelessWidget {
  final Function(String, String,BuildContext) onPressed;
  const ResetPasswordScreen({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ForgotResetViewModel>(
        builder: (context, value, _) => ModalProgressHUD(
          inAsyncCall: value.isResetVerifyLoading,
          progressIndicator: THelperFunction.showIndicator(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(TSized.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ! Reset Password Headings
                  Text(
                    TTexts.resetPassowrd,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: TSized.spacebetweenItem,
                  ),
                  Text(
                    TTexts.resetPassSubTitle,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
            
                  // ! Reset Password Form
                  ResetPasswordLoginForm(
                    onPressed: onPressed,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
