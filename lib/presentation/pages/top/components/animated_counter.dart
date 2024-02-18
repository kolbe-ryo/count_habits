import 'package:count_habits/util/library/custom_animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class AnimatedCounter extends StatefulWidget {
  const AnimatedCounter({super.key});

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter> with SingleTickerProviderStateMixin {
  int value = 1;

  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        value++;
        setState(() {});
        await Future<void>.delayed(const Duration(milliseconds: 600));
        await HapticFeedback.vibrate();
        await _controller.forward();
        _controller.reset();
      },
      child: Stack(
        children: [
          Align(
            child: Lottie.asset(
              'assets/animation/spark.json',
              repeat: false,
              controller: _controller,
              onLoaded: (composition) {
                _controller.duration = composition.duration;
              },
            ),
          ),
          Align(
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
          ),
        ],
      ),
    );
  }
}
