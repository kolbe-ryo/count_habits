import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool?> showDeleteDialog(BuildContext context) async {
  return showCupertinoDialog<bool?>(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text('削除しますか？'),
        content: const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text('この操作は元に戻せません'),
        ),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text('削除'),
            onPressed: () => Navigator.pop(context, true),
          ),
          CupertinoDialogAction(
            textStyle: const TextStyle(color: Colors.black54),
            child: const Text('キャンセル'),
            onPressed: () => Navigator.pop(context, false),
          ),
        ],
      );
    },
  );
}

Future<T?> showAddCounterDialog<T>(BuildContext context) async {
  final controller = TextEditingController();
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text('カウンタの追加'),
        content: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: CupertinoTextField(
            controller: controller,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            placeholder: 'カウンタ名を入力',
            focusNode: FocusNode(),
            style: const TextStyle(color: Colors.black54),
          ),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context, controller.text),
          ),
          CupertinoDialogAction(
            textStyle: const TextStyle(color: Colors.black54),
            child: const Text('キャンセル'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}

Future<bool?> showBillingDialog(BuildContext context) async {
  return showCupertinoDialog<bool?>(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text('課金要素です'),
        content: const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            '以下の機能が解放されます\n\n・無制限のカウンタ追加\n・テーマ変更',
            textAlign: TextAlign.left,
          ),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('購入'),
            onPressed: () => Navigator.pop(context, true),
          ),
          CupertinoDialogAction(
            textStyle: const TextStyle(color: Colors.black54),
            child: const Text('キャンセル'),
            onPressed: () => Navigator.pop(context, false),
          ),
        ],
      );
    },
  );
}
