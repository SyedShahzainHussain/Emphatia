import 'package:flutter/material.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';

class PsychlogistTitle extends StatelessWidget {
  const PsychlogistTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TTexts.enterYourAgeTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: TSized.spacebetweenItem),
        Text(
          TTexts.enterYourAgeSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
