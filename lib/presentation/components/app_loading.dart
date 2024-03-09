import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppLoading extends ConsumerWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ColoredBox(
      color: Colors.black26,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

// TODO ここに
Future<void> action(BuildContext context, ) {
  final loadingState = ref.read(loadingStateProvider.notifier)..show();
                    logger.i('Delete counter id = ${counter.id}');
                    await ref.read(counterUsecaseProvider).delete(counter.id);
                    loadingState.hide();
}