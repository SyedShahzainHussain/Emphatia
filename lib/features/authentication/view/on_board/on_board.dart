import 'package:flutter/material.dart';
import 'package:store/features/authentication/view/on_board/widget/get_started.dart';
import 'package:store/features/authentication/view/on_board/widget/on_board_question.dart';
import 'package:store/features/authentication/view/patient_psychologist_module/patient_psychologist.dart';
import 'package:store/utils/helper/helper_function.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // ! Onboard Question
          const OnBoardQuestion(),

          // ! Get Started
          GetStartedOnboard(onPressed: () {
            THelperFunction.navigatedToScreenWithPop(
                context, const PatientPsycologist());
          }),
        ],
      ),
    );
  }
}
