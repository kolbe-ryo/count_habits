import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:count_habits/util/library/custom_animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class AnimatedCounter extends ConsumerStatefulWidget {
  const AnimatedCounter({super.key});

  @override
  ConsumerState<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends ConsumerState<AnimatedCounter> with SingleTickerProviderStateMixin {
  int value = 0;

  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(cupertinoThemeProvider);
    return GestureDetector(
      onTap: () async {
        value++;
        setState(() {});
        await HapticFeedback.heavyImpact();
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
              textStyle: TextStyle(
                fontSize: 200,
                fontWeight: FontWeight.w400,
                fontFamily: 'Monomaniac_One',
                // TODO いい感じの色に変える（Theme.ofの取得を狭めてカラー以外の変更が通知されないようにする）
                color: theme.primaryColor,
                shadows: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.shadow,
                    offset: const Offset(4, 4),
                    blurRadius: 5,
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
