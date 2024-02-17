import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedBox extends StatefulWidget {
  const AnimatedBox({super.key});

  @override
  State<AnimatedBox> createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Lottie.asset(
          'assets/animation/spark.json',
          repeat: false,
        ),
      ],
    );
  }
}
