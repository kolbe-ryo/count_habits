import 'dart:async';

import 'package:count_habits/application/usecase/counter/counter_usecase.dart';
import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:count_habits/util/library/custom_animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

// TODO 1000くらいまで行った時に表示が問題ないか確認しておく
class AnimatedCounter extends ConsumerStatefulWidget {
  const AnimatedCounter({
    required this.counter,
    super.key,
  });

  final Counter counter;

  @override
  ConsumerState<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends ConsumerState<AnimatedCounter> with SingleTickerProviderStateMixin {
  late int _value;

  late bool _didChechIn;

  late final AnimationController _controller;

  @override
  void initState() {
    _value = widget.counter.counterValue.count;
    _didChechIn = widget.counter.didCheckIn;
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(cupertinoThemeProvider);
    return GestureDetector(
      onTap: () async {
        if (_didChechIn) {
          await Fluttertoast.showToast(
            msg: '本日はカウント済みです',
            backgroundColor: theme.primaryColor,
            gravity: ToastGravity.CENTER,
            fontSize: 18,
            textColor: Colors.white,
          );
          return;
        }
        // 二重タップ防止とRepository更新
        _didChechIn = true;
        unawaited(ref.read(counterUsecaseProvider).countUp(widget.counter.id));

        // カウンタの更新処理
        // TODO 初期値に戻す必要がある場合はvalue=1にする
        _value++;
        setState(() {});

        // アニメーション・バイブ処理
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
              textStyle: theme.textTheme.textStyle.copyWith(
                color: theme.primaryColor,
                fontSize: 200,
                fontWeight: FontWeight.w400,
                fontFamily: theme.textTheme.textStyle.fontFamily,
                shadows: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.shadow,
                    offset: const Offset(4, 4),
                    blurRadius: 5,
                  ),
                ],
              ),
              value: _value,
            ),
          ),
        ],
      ),
    );
  }
}
