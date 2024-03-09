
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PatientAgeForm extends StatelessWidget {
  const PatientAgeForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: "Enter Your Age", prefixIcon: Icon(Iconsax.user_add)),
    );
  }
}