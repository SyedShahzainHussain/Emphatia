import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/features/authentication/controller/patient_gender_tile_controller.dart';
import 'package:store/features/authentication/controller/patient_psy_controller.dart';
import 'package:store/features/authentication/controller/patient_step_controller.dart';
import 'package:store/features/authentication/view/on_board/on_board.dart';

import 'package:store/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PatientPsycologistController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PatientStepController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PatientGenderTileController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Empathia',
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        home: const OnBoard(),
      ),
    );
  }
}
