import 'package:count_habits/presentation/pages/detail/components/animated_box.dart';
import 'package:count_habits/presentation/pages/detail/components/animated_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            AnimatedCounter(),
            AnimatedBox(),
          ],
        ),
      ),
    );
  }
}
