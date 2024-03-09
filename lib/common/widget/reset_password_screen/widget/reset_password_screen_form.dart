import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/utils/constants/extension.dart';

import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';

class ResetPasswordLoginForm extends StatelessWidget {
  final VoidCallback onPressed;
  const ResetPasswordLoginForm({
    super.key,
    required this.onPressed,
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
              height: TSized.spaceBtwInputFields,
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
                onPressed: onPressed,
                child:  Text(TTexts.submit.capitalize()),
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
