import 'package:count_habits/presentation/components/app_dialog.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewOneCard extends ConsumerWidget {
  const AddNewOneCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(cupertinoThemeProvider);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white60.withOpacity(0.5),
      margin: const EdgeInsets.all(32),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.black54,
            fontFamily: theme.textTheme.textStyle.fontFamily,
          ),
          child: Column(
            children: [
              const Text(
                'カウンタを追加しよう！',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '毎日すべきことを記録すると\n継続を実感できます',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              CupertinoButton(
                color: theme.barBackgroundColor,
                // TODO 追加処理
                onPressed: () async {
                  await showAddCounterDialog(context);
                },
                borderRadius: BorderRadius.circular(10),
                child: Text(
                  '追加する',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: theme.textTheme.textStyle.fontFamily,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
