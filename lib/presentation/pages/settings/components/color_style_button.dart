import 'package:count_habits/application/usecase/appearance/appearance_usecase.dart';
import 'package:count_habits/application/usecase/appearance/state/appearance_state_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorStyleButton extends ConsumerWidget {
  const ColorStyleButton({
    required this.theme,
    required this.index,
    super.key,
  });

  final CupertinoThemeData theme;

  final int index;

  static const _circleRadius = 50.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoButton(
      borderRadius: const BorderRadius.all(Radius.circular(_circleRadius)),
      color: theme.barBackgroundColor,
      padding: EdgeInsets.zero,
      child: Icon(
        Icons.check,
        color: theme.primaryContrastingColor,
        size: _circleRadius,
      ),
      onPressed: () async {
        final appearance = await ref.read(appearanceUsecaseProvider).update(colorId: index);
        ref.read(appearanceStateProvider.notifier).setColorPalette(appearance.colorId);
      },
    );
  }
}
