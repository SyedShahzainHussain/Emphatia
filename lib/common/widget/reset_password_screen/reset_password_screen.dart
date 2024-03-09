import 'package:flutter/material.dart';
import 'package:store/common/widget/reset_password_screen/widget/reset_password_screen_form.dart';

import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';

class ResetPasswordScreen extends StatelessWidget {
  final VoidCallback onPressed;
  const ResetPasswordScreen({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSized.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ! Reset Password Headings
            Text(
              TTexts.resetPassowrd,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: TSized.spacebetweenItem,
            ),
            Text(
              TTexts.resetPassSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),

            // ! Reset Password Form
            ResetPasswordLoginForm(
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
