import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store/features/authentication/view/patient_psychologist_module/widget/patient/patient_psy_cart.dart';
import 'package:store/features/authentication/view/patient_psychologist_module/widget/patient_title.dart';
import 'package:store/utils/constants/size.dart';

class PatientColumn extends StatelessWidget {
  const PatientColumn(
      {super.key,
      required this.isdark,
      required this.image,
      required this.title,required this.onPressed});

  final bool isdark;
  final String title;
  final String image;
   final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PatientCardWidget(
          isdark: isdark,
          image: image,
          onPressed: onPressed,
        ),
        const SizedBox(
          height: TSized.spacebetweenItem,
        ),
        PatientCardTitle(
          title: title,
        ),
      ],
    );
  }
}
