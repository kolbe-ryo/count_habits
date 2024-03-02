import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:count_habits/presentation/pages/top/components/contribution_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SummaryCard extends ConsumerWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(cupertinoThemeProvider);
    return Card(
      elevation: 10,
      color: theme.barBackgroundColor,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CupertinoTextField(),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //　TODO: TextFieldにして編集可能にする
                Icon(
                  Icons.check,
                  color: theme.brightness == Brightness.light ? Colors.black54 : Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  'Contribution',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    fontFamily: theme.textTheme.textStyle.fontFamily,
                    color: theme.brightness == Brightness.light ? Colors.black : Colors.white,
                  ),
                ),
                const Expanded(child: SizedBox.shrink()),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Icon(
                    CupertinoIcons.delete,
                    color: theme.brightness == Brightness.light ? Colors.black54 : Colors.white,
                  ),
                ),
              ],
            ),
            const ContributionTile(),
          ],
        ),
      ),
    );
  }
}
