import 'package:count_habits/util/library/custom_animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimatedCounter extends StatefulWidget {
  const AnimatedCounter({super.key});

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        value++;
        setState(() {});
        await Future<void>.delayed(const Duration(milliseconds: 600));
        await HapticFeedback.vibrate();
      },
      child: CustomAnimatedFlipCounter(
        duration: const Duration(milliseconds: 1500),
        curve: Curves.bounceOut,
        textStyle: const TextStyle(
          fontSize: 200,
          fontWeight: FontWeight.w400,
          fontFamily: 'Monomaniac_One',
          color: Colors.yellow,
          shadows: [
            BoxShadow(
              color: Colors.red,
              offset: Offset(4, 4),
              blurRadius: 10,
            ),
          ],
        ),
        value: value,
      ),
    );
  }
}
