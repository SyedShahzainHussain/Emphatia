import 'package:flutter/material.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';

class PsychologistGenderTitleWidget extends StatelessWidget {
  const PsychologistGenderTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TTexts.enterYourGenderTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: TSized.spacebetweenItem),
        Text(
          TTexts.enterYourGenderSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: TSized.spacebetweenSections,
        ),
      ],
    );
  }
}
