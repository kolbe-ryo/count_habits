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

Future<bool?> showAddCounterDialog(BuildContext context) async {
  final controller = TextEditingController();
  return showCupertinoDialog<bool?>(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text('カウンタの追加'),
        content: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Expanded(
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
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
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
