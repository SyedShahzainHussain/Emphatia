import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/patient_gender_tile_controller.dart';
import 'package:store/features/authentication/view/patient/widget/patient_gender_widget/gender_tile_widget.dart';
import 'package:store/utils/constants/enum.dart';



class PatientGenderTileWidget extends StatelessWidget {
  const PatientGenderTileWidget({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientGenderTileController>(
      builder: (context, value, _) => Column(
        children: [
          RadioGenderTile(
            isDark: isDark,
            groupValue: GenderEnum.male,
            onChanged: (value) {
              context
                  .read<PatientGenderTileController>()
                  .setGender(GenderEnum.male);
            },
            title: "Male",
            value: value.genderEnum,
          ),
          const SizedBox(
            height: 10,
          ),
          RadioGenderTile(
            isDark: isDark,
            groupValue: GenderEnum.female,
            onChanged: (value) {
              context
                  .read<PatientGenderTileController>()
                  .setGender(GenderEnum.female);
            },
            title: "Female",
            value: value.genderEnum,
          ),
          const SizedBox(
            height: 10,
          ),
          RadioGenderTile(
            isDark: isDark,
            groupValue: GenderEnum.transgender,
            onChanged: (value) {
              context
                  .read<PatientGenderTileController>()
                  .setGender(GenderEnum.transgender);
            },
            title: "Transgender",
            value: value.genderEnum,
          ),
        ],
      ),
    );
  }
}
