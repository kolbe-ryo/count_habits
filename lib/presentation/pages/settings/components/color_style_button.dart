import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorStyleButton extends ConsumerWidget {
  const ColorStyleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Icon(
        Icons.check,
        size: 50,
      ),
    );
  }
}
