import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enum.dart';
import 'package:store/utils/constants/size.dart';

class RadioGenderTile extends StatelessWidget {
  const RadioGenderTile({
    super.key,
    required this.isDark,
    required this.title,
    required this.onChanged,
    required this.groupValue,
    required this.value,
  });

  final bool isDark;
  final String title;
  final void Function(GenderEnum?)? onChanged;
  final GenderEnum? groupValue;
  final GenderEnum value;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<GenderEnum>(
      fillColor: MaterialStateProperty.all(TColors.primary),
      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSized.borderRadiusLg),
        side: const BorderSide(
          width: 2,
          color: Colors.grey,
        ),
      ),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
