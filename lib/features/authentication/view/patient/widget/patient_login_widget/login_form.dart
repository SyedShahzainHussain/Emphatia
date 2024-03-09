import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widget/forgot_password/forgot_password.dart';
import 'package:store/common/widget/otp_screen/otp_screen.dart';
import 'package:store/common/widget/reset_password_screen/reset_password_screen.dart';
import 'package:store/common/widget/verify_screen/verify_screen_.dart';
import 'package:store/features/authentication/view/patient/patient_signup.dart';

import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/helper/helper_function.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isObsecure = ValueNotifier<bool>(true);
    ValueNotifier<bool> isCheck = ValueNotifier<bool>(false);

    return Form(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: TSized.spacebetweenSections),
        child: Column(
          children: [
            // ! Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),
            const SizedBox(
              height: TSized.spaceBtwInputFields,
            ),
            // ! Password
            ValueListenableBuilder(
              valueListenable: isObsecure,
              builder: (context, value, _) => TextFormField(
                obscuringCharacter: "*",
                obscureText: isObsecure.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    icon: Icon(
                        isObsecure.value ? Iconsax.eye_slash : Iconsax.eye),
                    onPressed: () {
                      isObsecure.value = !isObsecure.value;
                    },
                  ),
                  labelText: TTexts.password,
                ),
              ),
            ),
            const SizedBox(
              height: TSized.spaceBtwInputFields / 2,
            ),

            const SizedBox(
              height: TSized.spaceBtwInputFields / 2,
            ),
            // ! Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ! Remember Me
                Row(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: isCheck,
                      builder: (context, value, child) => Checkbox(
                        value: isCheck.value,
                        onChanged: (value) {
                          isCheck.value = !isCheck.value;
                        },
                      ),
                    ),
                    const Text(TTexts.rememberMe)
                  ],
                ),
                // ! Forget Password
                TextButton(
                  onPressed: () {
                    THelperFunction.navigatedToScreen(context, ForgotPassword(
                      onPressed: () {
                        THelperFunction.navigatedToScreen(context, OtpScreen(
                          onPressed: (String verification) {
                            THelperFunction.navigatedToScreen(
                              context,
                              ResetPasswordScreen(
                                onPressed: () {
                                  THelperFunction.navigatedToScreen(
                                      context, const VerifyScreen());
                                },
                              ),
                            );
                          },
                        ));
                      },
                    ));
                  },
                  child: const Text(TTexts.forgotPassword),
                )
              ],
            ),
            const SizedBox(
              height: TSized.spacebetweenSections,
            ),
            // ! Sign in Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text(TTexts.signIn))),
            const SizedBox(
              height: TSized.spacebetweenItem,
            ),
            // ! Create Account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      THelperFunction.navigatedToScreenWithPop(
                          context, const PatientSignUp());
                    },
                    child: const Text(TTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
