import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:store/features/authentication/controller/psychologist_controller/psychologist_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/size.dart';
import 'package:store/utils/device/devices_utility.dart';

class PsychologistBottomStepWidget extends StatelessWidget {
  const PsychologistBottomStepWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TDeviceUtils.screenHeight(context) / 8,
      child: Padding(
        padding: const EdgeInsets.all(TSized.defaultSpace),
        child: Consumer<PsychologistController>(
          builder: (context, value, _) => Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Step: ",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextSpan(
                    text: (value.currentPage + 1).toString(),
                    style: Theme.of(context).textTheme.bodyLarge),
              ])),
              const SizedBox(
                height: TSized.spacebetweenItem,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                child: StepProgressIndicator(
                  totalSteps: value.totalStep + 1,
                  currentStep: value.currentPage + 1,
                  size: 10,
                  unselectedColor: TColors.softGrey,
                  selectedColor: Colors.blue,
                  roundedEdges: const Radius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
