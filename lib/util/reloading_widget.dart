import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReLoadingWidget extends ConsumerWidget {
  const ReLoadingWidget(this.onPress, {super.key});

  final void Function() onPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(cupertinoThemeProvider);
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          color: theme.barBackgroundColor,
          onPressed: onPress,
          borderRadius: BorderRadius.circular(10),
          child: Text(
            '再読み込み',
            style: TextStyle(
              color: theme.brightness == Brightness.light ? Colors.black : Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontFamily: theme.textTheme.textStyle.fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
