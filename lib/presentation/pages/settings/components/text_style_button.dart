import 'package:count_habits/application/usecase/appearance/state/appearance_state_provider.dart';
import 'package:count_habits/util/constants/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextStyleButton extends ConsumerWidget {
  const TextStyleButton({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      // color: theme.barBackgroundColor,
      padding: EdgeInsets.zero,
      child: Icon(
        Icons.check,
        // color: theme.primaryContrastingColor,
        // size: _circleRadius,
      ),
      onPressed: () => logger.i('message'),
    );
  }
}
