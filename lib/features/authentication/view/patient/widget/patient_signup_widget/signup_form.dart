import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widget/otp_screen/otp_screen.dart';
import 'package:store/features/authentication/view/patient/patient_login.dart';
import 'package:store/features/authentication/view/patient/patient_step.dart';

import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/helper/helper_function.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isObsecure = ValueNotifier<bool>(true);
    ValueNotifier<bool> isObsecure2 = ValueNotifier<bool>(true);

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
            // ! Confirm Password
            ValueListenableBuilder(
              valueListenable: isObsecure2,
              builder: (context, value, _) => TextFormField(
                obscuringCharacter: "*",
                obscureText: isObsecure2.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    icon: Icon(
                        isObsecure2.value ? Iconsax.eye_slash : Iconsax.eye),
                    onPressed: () {
                      isObsecure2.value = !isObsecure2.value;
                    },
                  ),
                  labelText: TTexts.confirmPassword,
                ),
              ),
            ),
            const SizedBox(
              height: TSized.spaceBtwInputFields / 2,
            ),

            // ! Sign up Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      THelperFunction.navigatedToScreen(context,
                          OtpScreen(onPressed: (String verification) {
                        THelperFunction.navigatedToScreenWithPop(
                            context, const PatientStep());
                      }));
                    },
                    child: const Text(TTexts.signUp))),
            const SizedBox(
              height: TSized.spacebetweenItem,
            ),
            // ! Login Account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      THelperFunction.navigatedToScreenWithPop(
                          context, const PatientLogin());
                    },
                    child: const Text(TTexts.signIn))),
          ],
        ),
      ),
    );
  }
}
