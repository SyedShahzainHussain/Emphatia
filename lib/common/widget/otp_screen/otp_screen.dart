import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/extension.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';

class OtpScreen extends StatelessWidget {
  final Function(String) onPressed;
  const OtpScreen({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    String? verificationCode;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
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
                onPressed:(){
                  if (verificationCode != null) {
                    onPressed(verificationCode!); // Call onPressed with verification code if it's not null
                  } 
                },
                child: Text(TTexts.submit.capitalize()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
