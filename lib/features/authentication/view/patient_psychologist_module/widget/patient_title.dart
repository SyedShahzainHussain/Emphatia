import 'package:flutter/material.dart';
import 'package:store/utils/device/devices_utility.dart';

class PatientCardTitle extends StatelessWidget {
  const PatientCardTitle({
    super.key,
    required this.title
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TDeviceUtils.screenWidth(context) / 3.2,
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }
}
