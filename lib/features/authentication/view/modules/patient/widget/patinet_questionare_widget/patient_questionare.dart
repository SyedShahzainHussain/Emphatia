import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/patient_controller/patient_step_controller.dart';
import 'package:store/features/authentication/view/modules/patient/patient_login.dart';
import 'package:store/utils/helper/helper_function.dart';

class PatientQuestion extends StatelessWidget {
  const PatientQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (!didPop) {
            context.read<PatientStepController>().previousPage(context);
          }
        },
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Working"),
              OutlinedButton(
                  onPressed: () {
                    context.read<PatientStepController>().currentPage =0;
                    THelperFunction.navigatedToScreenWithPop(
                        context, const PatientLogin());
                  },
                  child: const Text("Exit"))
            ],
          ),
        ),
      ),
    );
  }
}
