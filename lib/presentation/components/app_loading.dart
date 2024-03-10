import 'package:count_habits/application/state/loading_state_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> loadingAction(
  WidgetRef ref,
  Future<void> Function() action,
) async {
  final loadingState = ref.read(loadingStateProvider.notifier)..show();
  await action();
  loadingState.hide();
}

class AppLoading extends ConsumerWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
