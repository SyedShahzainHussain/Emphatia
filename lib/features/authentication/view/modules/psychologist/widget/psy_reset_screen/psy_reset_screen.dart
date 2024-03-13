import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:store/common/widget/reset_password_screen/widget/reset_password_screen_form.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psy_reset_screen/psy_reset_password_login.dart';

import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/viewModel/psycology/psy_signin_view_model.dart';

class PsyResetPasswordScreen extends StatelessWidget {
  final Function(String, String,BuildContext) onPressed;
  const PsyResetPasswordScreen({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<PhySignInViewModel>(
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
                  PsyResetPasswordLoginForm(
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
