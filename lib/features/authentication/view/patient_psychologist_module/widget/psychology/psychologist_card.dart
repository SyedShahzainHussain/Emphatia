import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/patient_psy_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enum.dart';

import 'package:store/utils/constants/size.dart';
import 'package:store/utils/device/devices_utility.dart';

class PhyshologistCardWidget extends StatelessWidget {
  const PhyshologistCardWidget({
    super.key,
    required this.isdark,
    required this.image,
    required this.onPressed,
  });

  final bool isdark;
  final String image;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Consumer<PatientPsycologistController>(
      builder: (context, value, _) => Flexible(
        child: GestureDetector(
          onTap: onPressed,
          child: Material(
            elevation: TSized.cardElevation,
            borderRadius: BorderRadius.circular(TSized.cardRadiusMd),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              
              key: ValueKey(Modules.patient.name),
              decoration: BoxDecoration(
                gradient: value.isCheck == Modules.psychologist
                    ? const RadialGradient(
                        colors: [
                          TColors.primary,
                          TColors.primary,
                          TColors.primaryBackground,
                        ],
                      )
                    : null,
                color: isdark ? TColors.white : TColors.primaryBackground,
                borderRadius: BorderRadius.circular(TSized.cardRadiusMd),
              ),
              child: Image(
                image: AssetImage(
                  image,
                ),
                width: value.isCheck == Modules.psychologist
                    ? TDeviceUtils.screenWidth(context) / 2.6
                    : TDeviceUtils.screenWidth(context) / 3,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
