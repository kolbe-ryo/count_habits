import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditCounter extends ConsumerWidget {
  const EditCounter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.zero,
      child: const Text('Edit'),
    );
  }
}
