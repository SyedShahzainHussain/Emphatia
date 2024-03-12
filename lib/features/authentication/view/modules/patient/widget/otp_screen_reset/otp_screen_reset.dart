import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/extension.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/viewModel/patient/forgot_reset_view_model.dart';

class OtpScreenReset extends StatelessWidget {
  final Function(String, BuildContext) onPressed;
  const OtpScreenReset({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    String? verificationCode;
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ForgotResetViewModel>(
        builder: (context, value, _) => ModalProgressHUD(
          inAsyncCall: value.isForgotVerifyLoading,
          progressIndicator: THelperFunction.showIndicator(),
          child: Padding(
            padding: const EdgeInsets.all(TSized.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ! Headings
                Text(
                  TTexts.otpTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: TSized.spacebetweenItem,
                ),
                Text(
                  TTexts.otpSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: TSized.spacebetweenSections * 2,
                ),

                // ! OTP Text
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: OtpTextField(
                    clearText: true,

                    numberOfFields: 6,
                    borderColor: TColors.borderPrimary,
                    enabled: true,
                    focusedBorderColor: TColors.primary,
                    enabledBorderColor: TColors.borderSecondary,
                    showFieldAsBox: true,

                    onSubmit: (String verificationCodes) {
                      verificationCode = verificationCodes;
                      log(verificationCode!);
                    }, // end onSubmit
                  ),
                ),
                const SizedBox(
                  height: TSized.spacebetweenSections,
                ),

                // ! Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (verificationCode != null) {
                        onPressed(verificationCode!,
                            context); // Call onPressed with verification code if it's not null
                      }
                    },
                    child: Text(TTexts.submit.capitalize()),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
