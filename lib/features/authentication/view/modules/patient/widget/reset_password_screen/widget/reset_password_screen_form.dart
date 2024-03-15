import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/utils/constants/extension.dart';

import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/validator/validation.dart';

class ResetPasswordLoginForm extends StatefulWidget {
  final Function(String, String, BuildContext) onPressed;
  const ResetPasswordLoginForm({
    super.key,
    required this.onPressed,
  });

  @override
  State<ResetPasswordLoginForm> createState() => _ResetPasswordLoginFormState();
}

class _ResetPasswordLoginFormState extends State<ResetPasswordLoginForm> {
  final form = GlobalKey<FormState>();
  ValueNotifier<bool> isObsecure = ValueNotifier<bool>(true);
  ValueNotifier<bool> isObsecure2 = ValueNotifier<bool>(true);
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  save() {
    final validate = form.currentState!.validate();
    if (!validate) {
      return;
    }
    widget.onPressed(password.text, confirmPassword.text, context);
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
            // ! Password
            ValueListenableBuilder(
              valueListenable: isObsecure,
              builder: (context, value, _) => TextFormField(
                controller: password,
                obscuringCharacter: "*",
                obscureText: isObsecure.value,
                validator: (value) => TValidation.validatePassword(value),
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
              height: TSized.spaceBtwInputFields,
            ),
            // ! Confirm Password
            ValueListenableBuilder(
              valueListenable: isObsecure2,
              builder: (context, value, _) => TextFormField(
                controller: confirmPassword,
                obscuringCharacter: "*",
                obscureText: isObsecure2.value,
                validator: (value) =>
                    TValidation.confirmPassword(password.text, value),
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

            const SizedBox(
              height: TSized.spaceBtwInputFields / 2,
            ),

            const SizedBox(
              height: TSized.spacebetweenSections,
            ),
            // ! Submit  Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => save(),
                child: Text(TTexts.submit.capitalize()),
              ),
            ),
            const SizedBox(
              height: TSized.spacebetweenItem,
            ),
          ],
        ),
      ),
    );
  }
}
