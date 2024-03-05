import 'package:count_habits/application/usecase/counter/state/counters_provider.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:count_habits/presentation/pages/top/components/contribution_tile.dart';
import 'package:count_habits/util/constants/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final _textControllerProvider = Provider.family<TextEditingController, int>((ref, index) {
//   final text = ref.watch(countersProvider.select((value) => value[index].counterValue.name));
//   return TextEditingController(text: text);
// });

class SummaryCard extends ConsumerWidget {
  const SummaryCard({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(cupertinoThemeProvider);
    // final controller = ref.watch(_textControllerProvider(index));
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
            CupertinoTextField(
              controller: TextEditingController(),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              placeholder: 'Enter your text here',
              padding: const EdgeInsets.all(12),
              focusNode: FocusNode(),
              style: TextStyle(
                color: theme.brightness == Brightness.light ? Colors.black : Colors.white,
              ),
            ),
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
                  onPressed: () {
                    logger.i('delete');
                  },
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
