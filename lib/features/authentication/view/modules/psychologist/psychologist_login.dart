import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:store/common/style/text_style_common.dart';
import 'package:store/common/widget/login_title/login_title.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psychlogist_login/psychologist_login_form.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/viewModel/psycology/psy_signin_view_model.dart';

class PsychologistLogin extends StatelessWidget {
  const PsychologistLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PhySignInViewModel>(
        builder: (context, value, child) =>
         ModalProgressHUD(
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
                    PsyChologistLoginForm(),
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
