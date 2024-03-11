import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:store/common/widget/forgot_password/forgot_password.dart';
import 'package:store/features/authentication/view/patient/patient_signup.dart';

import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/utils/validator/validation.dart';
import 'package:store/viewModel/patient/forgot_reset_view_model.dart';
import 'package:store/viewModel/patient/signin_view_model.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();
    ValueNotifier<bool> isObsecure = ValueNotifier<bool>(true);
    ValueNotifier<bool> isCheck = ValueNotifier<bool>(false);
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    // ! onSave

    void onSave() {
      final validate = form.currentState!.validate();
      if (!validate) {
        return;
      } else if (!isCheck.value) {
        THelperFunction.showToast("Check The Remember Me");
      } else {
        // ! post api
        final data = {"email": email.text, "password": password.text};
        context.read<SignInViewModel>().postSignInApi(data, context);
      }
    }

    return Form(
      key: form,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: TSized.spacebetweenSections),
        child: Column(
          children: [
            // ! Email
            TextFormField(
              controller: email,
              validator: (value) => TValidation.validateEmail(value),
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
                validator: (value) => TValidation.validatePassword(value),
                controller: password,
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
                      onPressed: (email) {
                        if (email.isNotEmpty) {
                          final body = {"email": email};
                          context
                              .read<ForgotResetViewModel>()
                              .forgotPassword(body, context);
                        } else {
                          THelperFunction.showToast("Enter the correct Email");
                        }
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
                    onPressed: () {
                      onSave();
                    },
                    child: const Text(TTexts.signIn))),
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
