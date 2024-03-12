import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/patient_controller/paitent_module_controller.dart';
import 'package:store/features/authentication/model/module_model.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/size.dart';

class PatientModuleWidget extends StatelessWidget {
  final String image, title;
  final ModuleModel moduleModel;
  const PatientModuleWidget({
    super.key,
    required this.moduleModel,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientModuleController>(builder: (context, module, _) {
      final isSelected = module.selectedItem == moduleModel;
      return GestureDetector(
        onTap: () {
          final modules = context.read<PatientModuleController>();
          if (isSelected) {
            modules.clearSelection();
          } else {
            modules.selectModule(moduleModel);
          }
        },
        child: Material(
          elevation: isSelected ? TSized.cardElevation : 0,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? TColors.primary : TColors.darkGrey,
                width: 2.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    image,
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
