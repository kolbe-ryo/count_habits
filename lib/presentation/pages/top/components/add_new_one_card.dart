import 'package:count_habits/application/usecase/counter/counter_usecase.dart';
import 'package:count_habits/presentation/components/app_dialog.dart';
import 'package:count_habits/presentation/components/app_loading.dart';
import 'package:count_habits/presentation/pages/theme/color_schemes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                onPressed: () async {
                  // TODO 課金が必要かどうかによってこちらを呼ぶか決める（FutureProviderとかで事前に取得しておくのが良さそう？）
                  final isBillingCompleted = await showBillingDialog(context) ?? false;
                  // TODO 課金が終了後に必要あれば戻り値を利用する
                  if (isBillingCompleted) {
                    return;
                  }
                  // BuildContextが失われている場合は処理を終了する
                  if (!context.mounted) {
                    return;
                  }
                  // 追加するカウンタがnullまたは空の場合は何もしない
                  final counterName = await showAddCounterDialog<String?>(context);
                  if (counterName?.isEmpty ?? true) {
                    return;
                  }
                  await loadingAction(
                    ref,
                    () => ref.read(counterUsecaseProvider).create(name: counterName!),
                  );
                  await Fluttertoast.showToast(
                    msg: '「$counterName」を追加しました',
                    backgroundColor: theme.primaryColor,
                    gravity: ToastGravity.CENTER,
                    fontSize: 18,
                    textColor: Colors.white,
                  );
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
