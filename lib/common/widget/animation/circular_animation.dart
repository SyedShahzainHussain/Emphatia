import 'package:flutter/material.dart';

class CircularAnimation extends StatefulWidget {
  final Widget widget;
  const CircularAnimation({super.key, required this.widget});

  @override
  State<CircularAnimation> createState() => _CircularAnimationState();
}

class _CircularAnimationState extends State<CircularAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
    controller.forward();
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(controller),
      child: widget.widget,
    );
  }
}
