import 'package:flutter/material.dart';
import 'package:store/features/authentication/view/on_board/widget/get_started.dart';
import 'package:store/features/authentication/view/on_board/widget/on_board_question.dart';
import 'package:store/features/authentication/view/patient_psychologist_module/patient_psychologist.dart';
import 'package:store/utils/helper/helper_function.dart';

import 'package:video_player/video_player.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  late VideoPlayerController _controller;

  // ! playVideo
  void playVideo() {
    _controller = VideoPlayerController.asset("assets/videos/pexels1.mp4")
      ..initialize().then((value) => setState(() {}));
    _controller.play();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    playVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // ! video
          _controller.value.isInitialized
              ? VideoPlayer(_controller)
              : Container(),

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
