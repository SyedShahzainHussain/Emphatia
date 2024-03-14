import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:store/features/authentication/controller/onboard_controller/on_board_patient_controller.dart';
import 'package:store/features/authentication/controller/patient_controller/paitent_module_controller.dart';
import 'package:store/features/authentication/controller/patient_psyclogist_controller/patient_psy_controller.dart';
import 'package:store/features/authentication/controller/patient_controller/patient_step_controller.dart';
import 'package:store/features/authentication/controller/gender_controller/patient_gender_tile_controller.dart';
import 'package:store/features/authentication/controller/psychologist_controller/psychologist_controller.dart';

import 'package:store/viewModel/patient/forgot_reset_view_model.dart';
import 'package:store/viewModel/patient/patient_step_view_model.dart';
import 'package:store/viewModel/patient/signin_view_model.dart';
import 'package:store/viewModel/patient/signup_view_model.dart';
import 'package:store/viewModel/patient/user_view_model.dart';
import 'package:store/viewModel/psycology/psy_signin_view_model.dart';
import 'package:store/viewModel/psycology/psy_signup_view_model.dart';
import 'package:store/viewModel/psycology/psy_step_view_model.dart';

class AppProviders extends StatelessWidget {
  final Widget child;
  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => PatientPsycologistController()),
        ChangeNotifierProvider(create: (context) => PatientStepController()),
        ChangeNotifierProvider(create: (context) => GenderTileController()),
        ChangeNotifierProvider(create: (context) => OnBoardController()),
        ChangeNotifierProvider(create: (context) => PatientModuleController()),
        ChangeNotifierProvider(create: (context) => SignUpViewModel()),
        ChangeNotifierProvider(create: (context) => SignInViewModel()),
        ChangeNotifierProvider(create: (context) => ForgotResetViewModel()),
        ChangeNotifierProvider(create: (context) => UserViewModel()),
        ChangeNotifierProvider(create: (context) => PatientStepViewModel()),
        ChangeNotifierProvider(create: (context) => PsychologistController()),
        ChangeNotifierProvider(create: (context) => PsySignUpViewModel()),
        ChangeNotifierProvider(create: (context) => PsyStepViewModel()),
        ChangeNotifierProvider(create: (context) => PhySignInViewModel()),
      ],
      child: child,
    );
  }
}
