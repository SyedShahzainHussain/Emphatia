import 'package:flutter/material.dart';
import 'package:store/utils/constants/extension.dart';
import 'package:store/utils/constants/texts.dart';

class PatientAgeButton extends StatelessWidget {
  final VoidCallback onPressed;
  const PatientAgeButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(TTexts.next.capitalize()),
      ),
    );
  }
}
