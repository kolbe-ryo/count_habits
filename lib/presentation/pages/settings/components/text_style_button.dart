import 'package:count_habits/application/usecase/appearance/state/appearance_state_provider.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:count_habits/presentation/pages/theme/text_schemes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextStyleButton extends ConsumerWidget {
  const TextStyleButton({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(cupertinoThemeProvider);
    return CupertinoButton(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      // color: theme.barBackgroundColor,
      padding: EdgeInsets.zero,
      child: Text(
        textSchemes[index + 1] ?? '',
        style: TextStyle(
          color: theme.primaryColor,
          fontSize: 22,
          fontFamily: textSchemes[index + 1],
        ),
      ),
      onPressed: () => ref.read(appearanceStateProvider.notifier).setFontFamily(index + 1),
    );
  }
}
