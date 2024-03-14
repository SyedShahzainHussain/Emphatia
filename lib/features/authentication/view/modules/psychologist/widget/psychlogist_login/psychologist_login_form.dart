import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/view/modules/psychologist/widget/psy_forgot_screen/psy_forgot_screen.dart';
import 'package:store/features/authentication/view/modules/psychologist/psychlogist_signup.dart';

import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/utils/validator/validation.dart';
import 'package:store/viewModel/psycology/psy_signin_view_model.dart';

class PsyChologistLoginForm extends StatefulWidget {
  const PsyChologistLoginForm({
    super.key,
  });

  @override
  State<PsyChologistLoginForm> createState() => _PsyChologistLoginFormState();
}

class _PsyChologistLoginFormState extends State<PsyChologistLoginForm> {
  Timer? autoCheckTimer;
  @override
  void initState() {
    super.initState();
    autoCheckTimer = Timer(const Duration(seconds: 2), () {
      // *  Toggle the checkbox after 2 seconds
      isCheck.value = true;
    });
  }

  bool isChecks = false;
  final form = GlobalKey<FormState>();
  ValueNotifier<bool> isObsecure = ValueNotifier<bool>(true);
  ValueNotifier isCheck = ValueNotifier(false);
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    // Dispose the timer when the widget is disposed to prevent memory leaks
    autoCheckTimer?.cancel();
    super.dispose();
  }

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
      context.read<PhySignInViewModel>().phyPostSignInApi(data, context);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    THelperFunction.navigatedToScreen(context,
                        PsyForgotPassword(
                      onPressed: (email) {
                        if (email.isNotEmpty) {
                          final body = {"email": email};
                          context
                              .read<PhySignInViewModel>()
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
                          context, const PsychologistSignUp());
                    },
                    child: const Text(TTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
