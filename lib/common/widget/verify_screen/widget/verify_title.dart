
import 'package:flutter/material.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/constants/size.dart';
class VerifyTitleSubTitle extends StatelessWidget {
  const VerifyTitleSubTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          TTexts.resetSuccesPassworditle,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: TSized.spacebetweenItem,
        ),
        Text(
          TTexts.resetSuccesPasswordSubTitle,
          style: Theme.of(context).textTheme.labelMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}