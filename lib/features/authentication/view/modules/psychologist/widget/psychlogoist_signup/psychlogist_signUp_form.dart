import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/view/modules/patient/patient_login.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/helper/helper_function.dart';
import 'package:store/utils/validator/validation.dart';
import 'package:store/viewModel/psycology/psy_signup_view_model.dart';

class PsychlogisySignUpForm extends StatelessWidget {
  const PsychlogisySignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();
    ValueNotifier<bool> isObsecure = ValueNotifier<bool>(true);
    ValueNotifier<bool> isObsecure2 = ValueNotifier<bool>(true);
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController confirmPassword = TextEditingController();

    // ! onSave

    void onSave() {
      final validate = form.currentState!.validate();
      if (!validate) {
        return;
      }

      // ! post api
      final data = {"email": email.text, "password": password.text};
      context.read<PsySignUpViewModel>().postSignUpApi(data, context);
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
                prefixIcon: Icon(Iconsax.password_check),
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
            // ! Confirm Password
            ValueListenableBuilder(
              valueListenable: isObsecure2,
              builder: (context, value, _) => TextFormField(
                validator: (value) =>
                    TValidation.confirmPassword(password.text, value),
                controller: confirmPassword,
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
                      onSave();
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
