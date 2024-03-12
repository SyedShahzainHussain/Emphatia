import 'package:flutter/material.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/constants/texts.dart';
import 'package:store/utils/device/devices_utility.dart';

class PsychlogistSignUpTitle extends StatelessWidget {
  const PsychlogistSignUpTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: TDeviceUtils.screenHeight(context) * 0.05,
        ),
        Text(
          TTexts.psychologistSignTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: TSized.spacebetweenItem),
        
      ],
    );
  }
}
