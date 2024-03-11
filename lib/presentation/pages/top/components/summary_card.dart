import 'package:count_habits/application/usecase/counter/counter_usecase.dart';
import 'package:count_habits/domain/counter/entity/counter.dart';
import 'package:count_habits/presentation/components/app_dialog.dart';
import 'package:count_habits/presentation/components/app_loading.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:count_habits/presentation/pages/top/components/contribution_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SummaryCard extends ConsumerWidget {
  const SummaryCard({
    required this.counter,
    super.key,
  });

  final Counter counter;

  bool isSameText(String text) => counter.counterValue.name == text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(cupertinoThemeProvider);
    final controller = TextEditingController(text: counter.counterValue.name);
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
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: counter.didCheckIn ? theme.primaryColor : theme.primaryColor.withOpacity(0.4),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CupertinoTextField(
                    controller: controller,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    placeholder: 'カウンタ名を入力',
                    focusNode: FocusNode(),
                    style: TextStyle(
                      color: theme.brightness == Brightness.light ? Colors.black : Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      fontFamily: theme.textTheme.textStyle.fontFamily,
                    ),
                    onSubmitted: (text) {
                      // テキストが変わっていない場合何もしない
                      if (isSameText(text)) {
                        return;
                      }
                      // テキストを変更するだけでローディングは不自然なので、非同期的に更新する
                      ref.read(counterUsecaseProvider).update(id: counter.id, name: controller.text);
                    },
                    onTapOutside: (_) {
                      if (isSameText(controller.text)) {
                        return;
                      }
                      ref.read(counterUsecaseProvider).update(id: counter.id, name: controller.text);
                    },
                  ),
                ),
                // const Expanded(child: SizedBox.shrink()),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () async {
                    final result = await showDeleteDialog(context);
                    if (result ?? false) {
                      await loadingAction(
                        ref,
                        () => ref.read(counterUsecaseProvider).delete(counter.id),
                      );
                    }
                  },
                  child: Icon(
                    CupertinoIcons.delete_solid,
                    color: theme.primaryColor,
                  ),
                ),
              ],
            ),
            ContributionTile(contribution: counter.contribution),
          ],
        ),
      ),
    );
  }
}
