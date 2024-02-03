import 'package:count_habits/application/state/app_loading_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppLoading extends ConsumerWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: ref.watch(appLoadingProvider),
      child: const ColoredBox(
        color: Colors.black26,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
